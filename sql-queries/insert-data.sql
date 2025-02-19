-- Description: 
-- Author: Nicole Sparkes
-- Date: Feb 17,2024


-- Insert data into the speakers table
-- This table stores information about event speakers, including their names, emails, and specialties.
INSERT INTO speakers (id, first_name, last_name, email, speciality) VALUES
(1, 'Peter', 'Martin', 'pmartin@gmail.com', 'Time-Travel-Specialist'),  -- Expert in Time Travel
(2, 'Hank', 'Diaz', 'theyre-real-i-swear@live.ca', 'Cryptid-Communication-Specialist'),  -- Specializes in Cryptid Research
(3, 'Ashley', 'Barrie', 'actualghostbuster@gmail.com', 'Curse-Removal-Specialist'),  -- Focus on Curse Removal
(4, 'Meka', 'Warren', 'demonshaverights@hotmail.com', 'Demonic-Contract-Lawyer'),  -- Legal specialist in demonic contracts
(5, 'Arthur', 'Timmons', 'phoenix4ever@yahoo.ca', 'Phoenix-Rebirth-Strategist'),  -- Expert in Phoenix and Rebirth Strategies
(6, 'Molly', 'Mews', 'doctorwhoWHO@gmail.com', 'Portal-Travel-Safety-Instructor');  -- Specializes in Portal and Multiversal Travel Safety


-- Insert data into the attendees table
-- This table stores information about people attending the event, including their names, emails, and affiliated organizations.
INSERT INTO attendees (id, first_name, last_name, email, organization) VALUES
(433, 'Stan', 'Larry', '4everyesterday@gmail.com', 'The-Grand-Archive-of-Lost-Knowledge'),  -- Interested in time travel and paradoxes
(435, 'Alex', 'Keats', 'masterafterlife@live.ca', 'Institute-of-Paranormal-Memories'),  -- Studies paranormal history and records
(437, 'Ryan', 'Stevens', 'alwaysdefend@gmail.com', 'The-Veilwatchers'),  -- Specializes in cryptid sightings and protection
(439, 'Sam', 'Johnson', 'hexthem@hotmail.com', 'Hex-Breakers-International'),  -- Dedicated to curse removal and hex studies
(441, 'Evelyn', 'Hargrove', 'paradoxproof@aethermail.com', 'ChronoGuard-Association'),  -- Focuses on time travel safety
(443, 'Julian', 'Frost', 'cryptidwhisperer@mythos.net', 'Global-Cryptid-Research'),  -- Investigates global cryptid presence
(445, 'Dante', 'Blackwell', 'soulsafe@infernalcontracts.org', 'Hellfire-Legal'),  -- Specializes in demonic contracts and legal aid
(447, 'Mira', 'Faelan', 'ashrisen@rebirthmail.com', 'The-Phoenix-Foundation'),  -- Studies phoenix rebirth and mystical strategies
(449, 'Theodore', 'Vance', 'runesecure@arcaneethics.com', 'Enchanted-Objects-Registry'),  -- Catalogs and secures magical artifacts
(451, 'Sophia', 'Ravensdale', 'cursebreaker@hexhunters.net', 'The-Curse-Contract-Lawyers'),  -- Provides legal aid for curses and hexes
(453, 'Gideon', 'Lark', 'portalguardian@riftwatch.org', 'Multiversal-Logistics');  -- Works with interdimensional travel safety


-- Insert data into the sessions table
-- This table stores information about conference sessions, including the topic, the assigned speaker, and scheduled time.
INSERT INTO sessions (id, topic_title, speaker_id, date, time) VALUES
(101, 'The Ethics of Timeline Manipulation: Should We Fix the Past?', 1, '2025-03-20', '10:00:00'),  -- Led by Peter Martin (Time Travel Specialist)
(102, 'Hex Removal for Beginners: Spotting and Stopping a Curse Before It Ruins Your Life', 3, '2025-03-20', '11:00:00'),  -- Led by Ashley Barrie (Curse Removal)
(103, 'Cryptid Rights & Recognition: Why Bigfoot Deserves Citizenship', 2, '2025-03-20', '13:00:00'),  -- Led by Hank Diaz (Cryptid Communication)
(104, 'Devil’s in the Details: How to Get What You Want Without Losing Your Soul', 4, '2025-03-20', '14:00:00'),  -- Led by Meka Warren (Demonic Contracts)
(105, 'Ancestral Hexes: Are You Paying for Your Great-Great-Grandfather’s Mistakes?', 3, '2025-03-20', '15:00:00'),  -- Led by Ashley Barrie (Curse Removal)
(106, 'Chrono-Tourism: A Guide to Vacationing in the Past (Without Causing an Apocalypse)', 1, '2025-03-21', '10:00:00'),  -- Led by Peter Martin (Time Travel Specialist)
(107, 'Phoenix Rising: How to Reinvent Yourself After Complete Disaster', 5, '2025-03-21', '11:00:00'),  -- Led by Arthur Timmons (Phoenix Rebirth)
(108, 'Soul or Salary? The Modern Workplace vs. Traditional Demon Contracts', 4, '2025-03-21', '13:00:00'),  -- Led by Meka Warren (Demonic Contracts)
(109, 'Paradox Prevention 101: How to Travel Through Time Without Breaking Reality', 6, '2025-03-21', '14:00:00');  -- Led by Molly Mews (Portal Travel Safety)

INSERT INTO registrations (attendee_id, session_id, speaker_id) VALUES
-- Time Travel & Chrono-Tourism (Peter Martin - Speaker 1)
(441, 101, 1),  -- ChronoGuard Association attends Time Manipulation
(441, 106, 1),  -- ChronoGuard Association attends Chrono-Tourism
(433, 101, 1),  -- The Grand Archive of Lost Knowledge attends Time Manipulation
(433, 106, 1),  -- The Grand Archive attends Chrono-Tourism

-- Cryptid & Paranormal Research (Hank Diaz - Speaker 2)
(437, 103, 2),  -- The Veilwatchers attends Cryptid Rights
(435, 103, 2),  -- Institute of Paranormal Memories attends Cryptid Rights
(443, 103, 2),  -- Global Cryptid Research attends Cryptid Rights

-- Curse Removal & Hex Studies (Ashley Barrie - Speaker 3)
(439, 102, 3),  -- Hex-Breakers International attends Hex Removal
(445, 102, 3),  -- Hellfire Legal attends Hex Removal
(439, 105, 3),  -- Hex-Breakers International attends Ancestral Hexes
(445, 105, 3),  -- Hellfire Legal attends Ancestral Hexes

-- Demon Contracts & Occult Law (Meka Warren - Speaker 4)
(451, 104, 4),  -- Curse Contract Lawyers attends Devil's in the Details
(449, 104, 4),  -- Enchanted Objects Registry attends Devil's in the Details
(451, 108, 4),  -- Curse Contract Lawyers attends Soul vs Salary
(449, 108, 4),  -- Enchanted Objects Registry attends Soul vs Salary

-- Phoenix & Rebirth (Arthur Timmons - Speaker 5)
(447, 107, 5),  -- The Phoenix Foundation attends Phoenix Rising
(445, 107, 5),  -- Hellfire Legal attends Phoenix Rising

-- Portal Travel & Multiversal Studies (Molly Mews - Speaker 6)
(453, 109, 6),  -- Multiversal Logistics attends Paradox Prevention
(433, 109, 6);  -- The Grand Archive attends Paradox Prevention
