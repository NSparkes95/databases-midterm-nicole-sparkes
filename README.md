# 🏛️ Conference Management CLI App

A command-line application for managing conference sessions, speakers, and attendees using **PostgreSQL** and **Node.js**.

---

## 📋 **Table of Contents**
- [📌 Project Overview](#-project-overview)
- [🛠️ Installation](#️-installation)
- [🚀 Setup Instructions](#-setup-instructions)
- [📂 Folder Structure](#-folder-structure)
- [🖥️ Usage Guide](#️-usage-guide)
- [📜 SQL Queries](#-sql-queries)
- [🔍 Database Normalization (3NF)](#-database-normalization-3nf)
- [⚙️ Features Implemented](#️-features-implemented)
- [📷 Screenshots](#-screenshots)
- [🔗 Git Commit History](#-git-commit-history)
- [🛠️ Future Improvements](#️-future-improvements)

---

## 📌 **Project Overview**

This CLI application allows users to:

- **Manage speakers, attendees, and conference sessions** through a PostgreSQL database.
- **Insert, update, and retrieve** conference session data.
- **Perform advanced queries** to retrieve session schedules and attendee information.

---

## 🛠️ **Installation**
### **Prerequisites**
- **Node.js** (v16+ recommended)
- **PostgreSQL** (Latest version)
- **Git** (for version control)
- **pgAdmin** (Optional for database management)

### **1️⃣ Clone the Repository**
```sh
git clone <your-repo-url>
cd cli-app

2️⃣ Install Dependencies
npm install

3️⃣ Setup PostgreSQL Database:

Mac (Using Homebrew)
brew install postgresql
brew services start postgresql

Linux
sudo apt update
sudo apt install postgresql postgresql-contrib
sudo systemctl start postgresql

🚀 Setup Instructions

Create the Database:
CREATE DATABASE conference_db;

Run Table Creation Script:
psql -U postgres -d conference_db -f sql-queries/create-tables.sql

Insert Sample Data:
psql -U postgres -d conference_db -f sql-queries/insert-data.sql

Configure .env for Security:
- Create a .env file in the cli-app/ directory:
      DB_USER=postgres
      DB_HOST=localhost
      DB_DATABASE=conference_db
      DB_PASSWORD=yourpassword
      DB_PORT=5432

Update index.js to use dotenv:
require('dotenv').config();

📂 Folder Structure

cli-app/
│── sql-queries/
│   ├── create-tables.sql
│   ├── insert-data.sql
│   ├── queries.sql
│   ├── normalization-explanation.txt
│   ├── images/  (contains screenshots)
│── index.js
│── package.json
│── README.md

🖥️ Usage Guide:

1️⃣ Run the CLI App
node index.js

2️⃣ Available Commands
Command	Description
insert <title> <speaker_id> <date> <time>	Add a new session
show	Display all available sessions
update <attendee_id> <new_email>	Update an attendee's email
remove <attendee_id>	Remove an attendee

📜 SQL Queries

Find Sessions by Attendee:

SELECT s.id, s.topic_title, s.date, s.time
FROM sessions s
JOIN registrations r ON s.id = r.session_id
JOIN attendees a ON r.attendee_id = a.id
WHERE a.email = 'attendee@example.com';

Find Attendees by Session:

SELECT a.first_name, a.last_name, a.email
FROM attendees a
JOIN registrations r ON a.id = r.attendee_id
WHERE r.session_id = 1;

Speaker Session Schedule:

SELECT s.topic_title, s.date, s.time
FROM sessions s
JOIN speakers sp ON s.speaker_id = sp.id
WHERE sp.first_name = 'John' AND sp.last_name = 'Doe';

🔍 Database Normalization (3NF)

The database follows Third Normal Form (3NF):

Each table has a primary key uniquely identifying each row.
No repeating groups or redundant data.
All non-key attributes fully depend on the primary key.
Relationships between tables are managed using foreign keys.
For more details, refer to normalization-explanation.txt.

⚙️ Features Implemented

✅ Table creation via CLI
✅ CRUD operations (Insert, Show, Update, Remove)
✅ PostgreSQL queries for sessions and attendees
✅ Database normalization (3NF)
✅ Secure database connection using .env
✅ Git version control and commit history

📷 Screenshots

Screenshots are located in the sql-queries/images/ folder.

Database Created in pgAdmin ✅
Tables Created Successfully ✅
Sample Data Inserted ✅
CLI Commands in Action ✅
Database Queries Executed Successfully ✅

🔗 Git Commit History

To view the full commit history:
git log --oneline --graph --decorate --all

Example:

abcd123 Finalized CLI app and database setup
efgh456 Implemented session queries
ijkl789 Added 3NF explanation and query optimizations

🛠️ Future Improvements

🔹 Add user authentication for secure access.
🔹 Improve error handling with better validation.
🔹 Implement a web interface using Express.js.
