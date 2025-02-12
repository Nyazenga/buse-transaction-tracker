// hash-password.js
const bcrypt = require('bcrypt');

async function generateHash() {
    const password = 'password';
    const saltRounds = 10;
    const hash = await bcrypt.hash(password, saltRounds);
    console.log('Hashed password:', hash);
}

generateHash();