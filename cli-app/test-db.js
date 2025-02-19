const pool = require('./index');

pool.query('SELECT NOW()', (err, res) => {
  if (err) {
    console.error('Database connection error:', err);
  } else {
    console.log('Connected to database! Server time:', res.rows[0]);
  }
  pool.end();
});

