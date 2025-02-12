# Transaction Tracker

A comprehensive full-stack mobile application for tracking financial transactions, built with Flutter for the frontend and Node.js for the backend. The application provides secure user authentication and real-time transaction management capabilities.

## Design Choices and Implementation Challenges

The application was architected with a focus on scalability and maintainability. The Flutter frontend implements a clean architecture pattern with separate layers for UI (screens), business logic (services), and data models. State management is handled efficiently using Provider, while the backend uses Express.js to create a RESTful API with JWT authentication.

Key challenges included implementing secure user authentication and maintaining consistent state across the application. These were addressed by creating a robust AuthService that manages JWT tokens and user sessions. Another challenge was ensuring real-time synchronization of transaction data between the frontend and backend, which was solved through careful API design and proper state management.

## Prerequisites

- Flutter SDK (latest stable version)
- Java (v17.0.12)
- Node.js (v14 or higher)
- XAMPP (for MySQL database)
- Git
- Code editor (VS Code recommended)

## Installation and Setup

### 1. Clone the Repository

```bash
git clone https://github.com/Nyazenga/buse-transaction-tracker.git
cd buse-transaction-tracker
```

### 2. Database Setup

1. Start XAMPP Control Panel and start Apache and MySQL services
2. Open phpMyAdmin (http://localhost/phpmyadmin)
3. Create a new database named `transaction_tracker`
4. Import the database structure using the provided SQL dump transaction_tracker.sql:
   - Click on the newly created database
   - Select "Import" from the top menu
   - Choose the SQL file from the repository
   - Click "Go" to execute the import

To create a new user, you can use the following steps:

1. First, generate a hashed password using the provided script:
   ```bash
   cd TransactionTracker_backend
   node hash-password.js
   ```
   This will generate a hashed version of the password 'password'

2. Use the generated hash in your SQL insert statement:
   ```sql
   INSERT INTO users (username, password) 
   VALUES ('[put_desired_username_here]', '[put generated_hash_here]');
   ```

### 3. Backend Setup

1. Navigate to the backend directory:
   ```bash
   cd TransactionTracker/backend
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Rename env-example file to .env or Create a `.env` file in the backend directory. Feel free to change the JWT_SECRET:
   ```
   PORT=3000
   JWT_SECRET=hoisjojdoijsihfihi27836290932ui093uie9uy87y3he
   DB_HOST=localhost
   DB_USER=root
   DB_PASSWORD=
   DB_NAME=transaction_tracker
   ```

4. Start the backend server:
   ```bash
   node index.js
   ```

### 4. Frontend Setup

1. Navigate to the Flutter project directory:
   ```bash
   cd transaction_tracker_app
   ```

2. Install Flutter dependencies:
   ```bash
   flutter pub get
   ```

3. Check if all dependencies are correctly configured:
   ```bash
   flutter doctor
   ```

4. **Important Java Configuration**:
   Update the Java configuration in `transaction_tracker_app/android/gradle.properties`:
   ```properties
   # JVM arguments for Gradle
   org.gradle.jvmargs=-Xmx4G -XX:MaxMetaspaceSize=2G -XX:+HeapDumpOnOutOfMemoryError
   
   # Enable AndroidX and Jetifier
   android.useAndroidX=true
   android.enableJetifier=true
   
   # Specify Java compatibility (optional, but recommended)
   org.gradle.java.home=C:/Program Files/Java/jdk-17
   
   # Enable parallel project execution (optional, speeds up builds)
   org.gradle.parallel=true
   ```
   **Note**: If you're using a different version of Java, make sure to update the `org.gradle.java.home` path accordingly.

5. Run the application:
   ```bash
   flutter run
   ```

## Project Structure

### Frontend (`transaction_tracker_app`)
- `lib/models`: Data models
- `lib/screens`: UI screens including:
  - `login_screen.dart`
  - `add_transaction_screen.dart`
  - `transactions_screen.dart`
- `lib/services`: Business logic and API services
  - `api_service.dart`
  - `auth_service.dart`

### Backend (`TransactionTracker/backend`)
- `index.js`: Main server file
- `hash-password.js`: Password hashing utility
- `.env`: Environment configuration
- `package.json`: Project dependencies

## Features

- User Authentication (Login/Register)
- Transaction Management:
  - View all transactions
  - Add new transactions
  - Filter and sort transactions
- Secure password hashing
- JWT-based authentication
- Real-time data updates

## API Endpoints

- `POST /api/auth/login`: User login
- `GET /api/transactions`: Get all transactions
- `POST /api/transactions`: Create new transaction

## Security Features

- Password hashing using bcrypt
- JWT authentication
- SQL injection prevention
- Input validation
- Secure environment variable handling

## Troubleshooting

Common issues and solutions:

1. Database Connection Issues:
   - Ensure XAMPP is running
   - Verify database credentials in `.env`
   - Check if database exists and is properly imported

2. Flutter Build Issues:
   - Run `flutter clean`
   - Delete `pubspec.lock` and run `flutter pub get`

3. Backend Server Issues:
   - Check if port 3000 is available
   - Verify all dependencies are installed
   - Ensure `.env` file is properly configured

## Support

For support, contact MUNASHE NYAZENGA ON +263782794721