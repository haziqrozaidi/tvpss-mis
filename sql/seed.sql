-- Seed data for school table
INSERT INTO school (school_name, school_address, contact_number, email) VALUES
('SMK Damansara Jaya', 'Jalan SS22/19, Damansara Jaya, 47400 Petaling Jaya, Selangor', '03-7728 2364', 'info@smkdj.edu.my'),
('SMK Bandar Utama 3', 'Lebuh Bandar Utama, Bandar Utama, 47800 Petaling Jaya, Selangor', '03-7726 5871', 'admin@smkbu3.edu.my'),
('SMK Subang Jaya', 'Jalan USJ 12, 47620 Subang Jaya, Selangor', '03-5634 2891', 'contact@smksj.edu.my');

-- Seed data for role table
INSERT INTO role (role_name, description, access_level, status) VALUES
('Admin', 'System administrator', 5, 'Active'),
('Teacher', 'Program supervisor and content moderator', 4, 'Active'),
('Student', 'Participant and content creator', 3, 'Active'),
('JPNJ', 'Jabatan Pendidikan Negeri Johor', 2, 'Active'),
('PPD', 'Pejabat Pendidikan Daerah', 1, 'Active');

-- Seed data for user table
INSERT INTO user (role_id, school_id, username, password, email, full_name, status) VALUES
(1, 1, 'ahmad_ibrahim', 'hashed_password_1', 'ahmad@smkdj.edu.my', 'Ahmad Bin Ibrahim', 'Active'),
(2, 1, 'siti_fatimah', 'hashed_password_2', 'siti@smkdj.edu.my', 'Siti Nur Fatimah', 'Active'),
(2, 2, 'raj_kumar', 'hashed_password_3', 'raj@smkbu3.edu.my', 'Raj Kumar a/l Muthu', 'Active');

-- Seed data for student table
INSERT INTO student (school_id, full_name, class, date_of_birth, gender, contact_number, email, address, join_date) VALUES
(1, 'Muhammad Hafiz Bin Abdullah', '5 Cemerlang', '2006-03-15', 'Male', '012-345 6789', 'hafiz@student.smkdj.edu.my', 'No. 12, Jalan SS22/31, Damansara Jaya', '2022-01-10'),
(1, 'Lee Wei Ling', '4 Bestari', '2007-06-22', 'Female', '016-876 5432', 'weiling@student.smkdj.edu.my', 'No. 45, Jalan SS22/11, Damansara Jaya', '2022-01-10'),
(2, 'Thanusha a/p Ramesh', '5 Bijaksana', '2006-11-30', 'Female', '019-765 4321', 'thanusha@student.smkbu3.edu.my', '23, Jalan BU 3/2, Bandar Utama', '2022-01-15');

-- Seed data for program table
INSERT INTO program (school_id, youTube_channel_link, establishment_date, status) VALUES
(1, 'https://youtube.com/smkdj_studio', '2022-01-01', 'Active'),
(2, 'https://youtube.com/smkbu3_media', '2022-02-01', 'Active'),
(3, 'https://youtube.com/smksj_broadcast', '2022-03-01', 'Active');

-- Seed data for student_application table
INSERT INTO student_application (program_id, student_id, apply_date, status, interests, skills) VALUES
(1, 1, '2022-01-05', 'Approved', 'Video editing, Public speaking', 'Adobe Premiere, Photography'),
(1, 2, '2022-01-06', 'Approved', 'Script writing, Acting', 'Creative writing, Drama'),
(2, 3, '2022-01-12', 'Approved', 'Camera operation, Lighting', 'Photography, Technical skills');

-- Seed data for content table
INSERT INTO content (program_id, title, description, video_url, upload_date, category, status) VALUES
(1, 'Hari Raya Celebration 2023', 'Annual school Hari Raya celebration highlights', 'https://youtube.com/watch?v=abc123', '2023-05-15', 'Events', 'Active'),
(1, 'SPM Success Tips', 'Interview with top scorers', 'https://youtube.com/watch?v=def456', '2023-06-20', 'Education', 'Active'),
(2, 'Sports Day 2023', 'Annual sports day coverage', 'https://youtube.com/watch?v=ghi789', '2023-07-10', 'Sports', 'Active');

-- Seed data for studio table
INSERT INTO studio (program_id, studio_name, studio_level, location, size, status) VALUES
(1, 'SMKDJ Media Hub', 'Advanced', 'Block C, Level 2', 45.5, 'Operational'),
(2, 'BU3 Creative Space', 'Intermediate', 'Media Room 1', 35.0, 'Operational'),
(3, 'SMKSJ Broadcast Center', 'Basic', 'AV Room', 30.0, 'Operational');

-- Seed data for crew table
INSERT INTO crew (studio_id, student_id, role, join_date, status) VALUES
(1, 1, 'Camera Operator', '2022-01-15', 'Active'),
(1, 2, 'Script Writer', '2022-01-15', 'Active'),
(2, 3, 'Video Editor', '2022-02-01', 'Active');

-- Seed data for equipment table
INSERT INTO equipment (studio_id, equipment_name, equipment_type, quantity, status, purchase_date) VALUES
(1, 'Canon EOS 80D', 'Camera', 2, 'Good', '2022-01-01'),
(1, 'Rode VideoMic Pro', 'Microphone', 3, 'Good', '2022-01-01'),
(1, 'Neewer LED Light Kit', 'Lighting', 2, 'Good', '2022-01-01'),
(2, 'Sony A7 III', 'Camera', 1, 'Good', '2022-02-01'),
(2, 'DJI Ronin-SC', 'Stabilizer', 1, 'Good', '2022-02-01');
