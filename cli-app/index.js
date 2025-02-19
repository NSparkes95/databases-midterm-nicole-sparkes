const { Pool } = require('pg');

// PostgreSQL connection
const pool = new Pool({
  user: 'postgres', 
  host: 'localhost',
  database: 'conference_db', 
  password: 'Database123', 
  port: 5432,
});

module.exports = pool;

/**
 * Creates the required database tables if they do not exist.
 */
async function createTables() {
  const query = `
    CREATE TABLE IF NOT EXISTS speakers (
      id SERIAL PRIMARY KEY,
      first_name VARCHAR(50) NOT NULL,
      last_name VARCHAR(50) NOT NULL,
      email VARCHAR(100) UNIQUE NOT NULL,
      speciality VARCHAR(100) NOT NULL
    );

    CREATE TABLE IF NOT EXISTS attendees (
      id SERIAL PRIMARY KEY,
      first_name VARCHAR(50) NOT NULL,
      last_name VARCHAR(50) NOT NULL,
      email VARCHAR(100) UNIQUE NOT NULL,
      organization VARCHAR(100)
    );

    CREATE TABLE IF NOT EXISTS sessions (
      id SERIAL PRIMARY KEY,
      topic_title VARCHAR(100) NOT NULL,
      speaker_id INT NOT NULL,
      date DATE NOT NULL,
      time TIME NOT NULL,
      FOREIGN KEY (speaker_id) REFERENCES speakers(id) ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS registrations (
      attendee_id INT NOT NULL,
      session_id INT NOT NULL,
      speaker_id INT NOT NULL,
      PRIMARY KEY (attendee_id, session_id),
      FOREIGN KEY (attendee_id) REFERENCES attendees(id) ON DELETE CASCADE,
      FOREIGN KEY (session_id) REFERENCES sessions(id) ON DELETE CASCADE,
      FOREIGN KEY (speaker_id) REFERENCES speakers(id) ON DELETE CASCADE
    );
  `;

  try {
    await pool.query(query);
    console.log("✅ Tables created successfully.");
  } catch (err) {
    console.error("❌ Error creating tables:", err);
  }
}

/**
 * Inserts a new session into the Sessions table.
 */
async function insertSession(title, speakerId, date, time) {
  const query = `
    INSERT INTO sessions (topic_title, speaker_id, date, time) 
    VALUES ($1, $2, $3, $4)
    RETURNING *;
  `;

  try {
    const result = await pool.query(query, [title, speakerId, date, time]);
    console.log("✅ Session inserted:", result.rows[0]);
  } catch (err) {
    console.error("❌ Error inserting session:", err);
  }
}

/**
 * Retrieves and displays all sessions in the database.
 */
async function displaySessions() {
  const query = "SELECT * FROM sessions;";
  
  try {
    const result = await pool.query(query);
    console.table(result.rows);
  } catch (err) {
    console.error("❌ Error fetching sessions:", err);
  }
}

/**
 * Updates an attendee's email.
 */
async function updateAttendeeEmail(attendeeId, newEmail) {
  const query = `
    UPDATE attendees 
    SET email = $1 
    WHERE id = $2
    RETURNING *;
  `;

  try {
    const result = await pool.query(query, [newEmail, attendeeId]);
    if (result.rowCount === 0) {
      console.log("⚠️ No attendee found with the given ID.");
    } else {
      console.log("✅ Attendee email updated:", result.rows[0]);
    }
  } catch (err) {
    console.error("❌ Error updating email:", err);
  }
}

/**
 * Removes an attendee and their session registrations.
 */
async function removeAttendee(attendeeId) {
  const query = `
    DELETE FROM attendees 
    WHERE id = $1
    RETURNING *;
  `;

  try {
    const result = await pool.query(query, [attendeeId]);
    if (result.rowCount === 0) {
      console.log("⚠️ No attendee found with the given ID.");
    } else {
      console.log("✅ Attendee removed:", result.rows[0]);
    }
  } catch (err) {
    console.error("❌ Error removing attendee:", err);
  }
}

/**
 * Prints CLI help instructions.
 */
function printHelp() {
  console.log(`
    Usage:
      insert <title> <speaker_id> <date> <time> - Insert a new session
      show - Show all available sessions
      update <attendee_id> <new_email> - Update an attendee's email
      remove <attendee_id> - Remove an attendee from the system
  `);
}

/**
 * Main CLI function.
 */
async function runCLI() {
  await createTables();

  const args = process.argv.slice(2);
  switch (args[0]) {
    case 'insert':
      if (args.length !== 5) {
        printHelp();
        return;
      }
      await insertSession(args[1], parseInt(args[2]), args[3], args[4]);
      break;

    case 'show':
      await displaySessions();
      break;

    case 'update':
      if (args.length !== 3) {
        printHelp();
        return;
      }
      await updateAttendeeEmail(parseInt(args[1]), args[2]);
      break;

    case 'remove':
      if (args.length !== 2) {
        printHelp();
        return;
      }
      await removeAttendee(parseInt(args[1]));
      break;

    default:
      printHelp();
      break;
  }
}

// Run CLI application
runCLI();