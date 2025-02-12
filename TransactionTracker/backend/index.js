// backend/index.js
require('dotenv').config();
const express = require('express');
const mysql = require('mysql');
const cors = require('cors');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

const app = express();
app.use(cors());
app.use(express.json());

// Create a database connection
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'transaction_tracker'
});

// Connect to database
db.connect((err) => {
    if (err) {
        console.error('[DB ERROR] Error connecting to database:', err);
        return;
    }
    console.log('[DB] Connected to database');
});

// Middleware to log all incoming requests
app.use((req, res, next) => {
    console.log(`\n[${new Date().toISOString()}] [REQUEST] ${req.method} ${req.url}`);
    if (Object.keys(req.body).length) {
        console.log('[BODY]', req.body);
    }
    next();
});

// Middleware to verify JWT
const authenticateToken = (req, res, next) => {
    console.log('[AUTH] Checking token...');
    
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];

    if (!token) {
        console.log('[AUTH ERROR] No token provided');
        return res.sendStatus(401);
    }

    jwt.verify(token, process.env.JWT_SECRET, (err, user) => {
        if (err) {
            console.log('[AUTH ERROR] Token verification failed:', err);
            return res.sendStatus(403);
        }
        console.log('[AUTH] Token verified:', user);
        req.user = user;
        next();
    });
};

// Login endpoint
app.post('/login', async (req, res) => {
    console.log('[LOGIN] Login attempt:', req.body.username);

    const { username, password } = req.body;

    db.query('SELECT * FROM users WHERE username = ?', [username], async (err, results) => {
        if (err) {
            console.error('[DB ERROR] Login query failed:', err);
            return res.status(500).json({ error: 'Database error' });
        }

        if (results.length === 0) {
            console.log('[LOGIN ERROR] Invalid username:', username);
            return res.status(401).json({ error: 'Invalid credentials' });
        }

        const user = results[0];
        console.log('[LOGIN] User found:', user.username);

        const validPassword = await bcrypt.compare(password, user.password);
        if (!validPassword) {
            console.log('[LOGIN ERROR] Invalid password for:', username);
            return res.status(401).json({ error: 'Invalid credentials' });
        }

        const token = jwt.sign({ id: user.id, username: user.username }, process.env.JWT_SECRET);
        console.log('[LOGIN SUCCESS] Token generated for:', username);
        res.json({ token });
    });
});

// Get transactions
app.get('/transactions', authenticateToken, (req, res) => {
    console.log('[TRANSACTIONS] Fetching transactions for user:', req.user.id);

    db.query(
        'SELECT * FROM transactions WHERE user_id = ? ORDER BY date DESC',
        [req.user.id],
        (err, results) => {
            if (err) {
                console.error('[DB ERROR] Fetch transactions failed:', err);
                return res.status(500).json({ error: 'Database error' });
            }
            console.log('[TRANSACTIONS] Retrieved transactions:', results.length);
            res.json(results);
        }
    );
});

// Add transaction
app.post('/transactions', authenticateToken, (req, res) => {
    console.log('[TRANSACTIONS] Adding new transaction for user:', req.user.id);
    console.log('[TRANSACTIONS] Request Body:', req.body);

    const { amount, description, date } = req.body;
    
    db.query(
        'INSERT INTO transactions (user_id, amount, description, date) VALUES (?, ?, ?, ?)',
        [req.user.id, amount, description, date],
        (err, result) => {
            if (err) {
                console.error('[DB ERROR] Insert transaction failed:', err);
                return res.status(500).json({ error: 'Database error' });
            }
            console.log('[TRANSACTIONS] Transaction added with ID:', result.insertId);
            res.json({ id: result.insertId });
        }
    );
});

// Start server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`[SERVER] Running on port ${PORT}`);
});

