-- Description: 
-- Author: Nicole Sparkes
-- Date: Feb 17,2024
CREATE TABLE speakers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    topic VARCHAR(100) NOT NULL
);

CREATE TABLE attendees (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    organization VARCHAR(100)
);

CREATE TABLE sessions (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    speaker_id INT NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    FOREIGN KEY (speaker_id) REFERENCES speakers(id) ON DELETE CASCADE
);

CREATE TABLE registrations (
    attendee_id INT NOT NULL,
    session_id INT NOT NULL,
    speaker_id INT NOT NULL,
    PRIMARY KEY (attendee_id, session_id),
    FOREIGN KEY (attendee_id) REFERENCES attendees(id) ON DELETE CASCADE,
    FOREIGN KEY (session_id) REFERENCES sessions(id) ON DELETE CASCADE,
    FOREIGN KEY (speaker_id) REFERENCES speakers(id) ON DELETE CASCADE
);
