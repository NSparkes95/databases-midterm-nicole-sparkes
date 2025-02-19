-- Author: Nicole Sparkes
-- Date: Feb 18, 2025

-- Selects the session ID, topic title, date, and time for sessions an attendee is registered for
SELECT s.id, s.topic_title, s.date, s.time  
FROM sessions s  
-- Joins the registrations table to link sessions with attendees
JOIN registrations r ON s.id = r.session_id  
-- Joins the attendees table to get attendee details
JOIN attendees a ON r.attendee_id = a.id  
-- Filters the results to show only the sessions for a specific attendee's email
WHERE a.email = 'paradoxproof@aethermail.com';

-- Selects the first name, last name, and email of attendees registered for a specific session
SELECT a.first_name, a.last_name, a.email  
FROM attendees a  
-- Joins the registrations table to link attendees with sessions
JOIN registrations r ON a.id = r.attendee_id  
-- Joins the sessions table to filter attendees by session title
JOIN sessions s ON r.session_id = s.id  
-- Filters results to show only attendees registered for a specific session
WHERE s.topic_title = 'Ancestral Hexes: Are You Paying for Your Great-Great-Grandfather’s Mistakes?';

-- Selects the session title, date, and time for sessions presented by a specific speaker
SELECT s.topic_title, s.date, s.time  
FROM sessions s  
-- Joins the speakers table to link each session to its presenter
JOIN speakers sp ON s.speaker_id = sp.id  
-- Filters the results to show only sessions where the speaker's email matches the provided value
WHERE sp.email = 'demonshaverights@hotmail.com';

-- Selects distinct attendee details (first name, last name, and email) who attended sessions by a specific speaker
SELECT DISTINCT a.first_name, a.last_name, a.email  
FROM attendees a  
-- Joins the registrations table to link attendees with sessions
JOIN registrations r ON a.id = r.attendee_id  
-- Joins the sessions table to determine which session they attended
JOIN sessions s ON r.session_id = s.id  
-- Joins the speakers table to find sessions presented by a specific speaker
JOIN speakers sp ON s.speaker_id = sp.id  
-- Filters results to show only attendees who attended sessions led by the specified speaker
WHERE sp.email = 'doctorwhoWHO@gmail.com';

-- Selects session title, time, and the speaker's name for sessions occurring on a specific date
SELECT s.topic_title, s.time, sp.first_name, sp.last_name  
FROM sessions s  
-- Joins the speakers table to include speaker information for each session
JOIN speakers sp ON s.speaker_id = sp.id  
-- Filters results to show only sessions happening on a specific date
WHERE s.date = '2025-03-21';
