-- Seed data for role table
INSERT INTO role (role_name, description, access_level, status) VALUES
('Admin', 'System administrator', 5, 'Active'),
('Teacher', 'Program supervisor and content moderator', 4, 'Active'),
('Student', 'Participant and content creator', 2, 'Active'),
('JPNJ', 'Jabatan Pendidikan Negeri Johor', 4, 'Active'),
('PPD', 'Pejabat Pendidikan Daerah', 3, 'Active');

-- Seed data for school table
INSERT INTO school (school_name, school_address, contact_number, email) VALUES
('SMK Taman Desa Skudai', 'Jalan Pendidikan 1, Taman Desa Skudai, 81300 Skudai, Johor', '07-5586234', 'smktds@moe.edu.my'),
('SMK Taman Universiti', 'Jalan TU 1, Taman Universiti, 81300 Skudai, Johor', '07-5575123', 'smktu@moe.edu.my'),
('SMK Bandar Dato Onn', 'Jalan Dato Onn 3, Bandar Dato Onn, 81100 Johor Bahru, Johor', '07-3586299', 'smkbdo@moe.edu.my'),
('SMK Taman Molek', 'Jalan Molek 2/1, Taman Molek, 81100 Johor Bahru, Johor', '07-3526877', 'smktm@moe.edu.my'),
('SMK Taman Daya', 'Jalan Daya 10, Taman Daya, 81100 Johor Bahru, Johor', '07-3514433', 'smktd@moe.edu.my');

-- Seed data for user table
INSERT INTO user (role_id, school_id, username, password, full_name, date_of_birth, gender, contact_number, email, address, join_date, status) VALUES
-- Admins
(1, 1, 'admin1', '$2a$10$5yCaK/38Gd6kbu86d2.EUeWrcniE/OIXw/FwN0ofgadv72oc4BrvO', 'Ahmad Bin Ismail', '1985-03-15', 'Male', '011-10123456', 'ahmad.ismail@moe.edu.my', 'Taman Universiti, Skudai', '2023-01-01', 'Active'),
(1, 2, 'admin2', 'hashed_password', 'Siti Aminah Binti Abdullah', '1988-07-22', 'Female', '011-20123456', 'siti.aminah@moe.edu.my', 'Taman Desa, Skudai', '2023-01-01', 'Active'),

-- Teachers
(2, 1, 'teacher1', '$2a$10$pBuf0kcK.xrzhkYnMe2vkuNlXYP/UtduHS1B9q/kc1nT5xRnqI8DC', 'Muhammad Hafiz Bin Omar', '1990-05-12', 'Male', '012-3456789', 'hafiz.omar@moe.edu.my', 'Taman Ungku Tun Aminah, Skudai', '2023-01-15', 'Active'),
(2, 2, 'teacher2', 'hashed_password', 'Nurul Izzah Binti Razak', '1992-09-28', 'Female', '012-8765432', 'nurul.izzah@moe.edu.my', 'Taman Tebrau, Johor Bahru', '2023-01-15', 'Active'),

-- JPNJ Officers
(4, NULL, 'jpnj1', '$2a$10$Cbv9Q7R8mab/cBp5eF0ndeFp2RCyTkD3lMxJ3fdlczu5PAEH1oFKm', 'Dr. Zulkifli Bin Rahman', '1975-11-30', 'Male', '019-7775555', 'zulkifli.r@jpnjohor.edu.my', 'Taman Pelangi, Johor Bahru', '2023-02-01', 'Active'),
(4, NULL, 'jpnj2', 'hashed_password', 'Puan Mastura Binti Hassan', '1978-04-18', 'Female', '019-8885555', 'mastura.h@jpnjohor.edu.my', 'Taman Century, Johor Bahru', '2023-02-01', 'Active'),

-- PPD Officers
(5, NULL, 'ppd1', '$2a$10$ngJJJrjlKLIacKJEzwe/y.wWDNRqvXzoBn6qt4Sja6GWbTYQra186', 'Encik Razali Bin Yusof', '1980-08-25', 'Male', '013-7778888', 'razali.y@ppd.edu.my', 'Taman Perling, Johor Bahru', '2023-02-15', 'Active'),
(5, NULL, 'ppd2', 'hashed_password', 'Puan Faridah Binti Salleh', '1982-12-03', 'Female', '013-8889999', 'faridah.s@ppd.edu.my', 'Taman Rinting, Pasir Gudang', '2023-02-15', 'Active'),

-- Students
(3, 1, 'student1', '$2a$10$JW82lBKID7n8UW.Y8nVeOO80kwLnE4Tx1Q.XO9tpyw7e0f3QKLKzS', 'Amir Danial Bin Khairul', '2007-06-20', 'Male', '011-11223344', 'amir.danial@student.moe.edu.my', 'Taman Selesa Jaya, Skudai', '2023-03-01', 'Active'),
(3, 1, 'student2', 'hashed_password', 'Nur Aliya Binti Mazlan', '2007-08-15', 'Female', '011-22334455', 'nur.aliya@student.moe.edu.my', 'Taman Mutiara Rini, Skudai', '2023-03-01', 'Active'),
(3, 2, 'student3', 'hashed_password', 'Muhammad Irfan Bin Azmi', '2008-02-10', 'Male', '011-33445566', 'irfan.azmi@student.moe.edu.my', 'Taman Universiti, Skudai', '2023-03-01', 'Active'),
(3, 2, 'student4', 'hashed_password', 'Nor Syafiqah Binti Rosli', '2008-04-25', 'Female', '011-44556677', 'syafiqah.rosli@student.moe.edu.my', 'Taman Skudai Baru, Skudai', '2023-03-01', 'Active');

-- Seed data for program table
INSERT INTO program (school_id, youTube_channel_link, establishment_date, status) VALUES
(1, 'https://youtube.com/c/SMKTamanDesaSkudaiTV', '2023-01-01', 'Active'),
(2, 'https://youtube.com/c/SMKTamanUniversitiTV', '2023-01-01', 'Active'),
(3, 'https://youtube.com/c/SMKBandarDatoOnnTV', '2023-02-01', 'Active'),
(4, 'https://youtube.com/c/SMKTamanMolekTV', '2023-02-01', 'Active'),
(5, 'https://youtube.com/c/SMKTamanDayaTV', '2023-03-01', 'Active');

-- Seed data for studio table
INSERT INTO studio (program_id, studio_name, studio_level, location, size, status) VALUES
(1, 'Studio Perdana TDS', 'Advanced', 'Block A, Level 2', 100.50, 'Operational'),
(2, 'Studio Kreatif UTM', 'Intermediate', 'Block B, Level 1', 85.75, 'Operational'),
(3, 'Studio BDO Media', 'Basic', 'Block C, Ground Floor', 75.25, 'Operational'),
(4, 'Studio Molek Productions', 'Advanced', 'Media Building, Level 1', 120.00, 'Operational'),
(5, 'Daya Creative Studio', 'Intermediate', 'Resource Center, Level 2', 90.50, 'Operational');

-- Seed data for equipment table
INSERT INTO equipment (studio_id, equipment_name, equipment_type, quantity, status, purchase_date) VALUES
(1, 'Canon EOS R6', 'Camera', 2, 'Good', '2023-01-15'),
(1, 'Rode VideoMic Pro+', 'Microphone', 3, 'Good', '2023-01-15'),
(1, 'Godox SL-60W LED', 'Lighting', 4, 'Good', '2023-01-15'),
(2, 'Sony A7 III', 'Camera', 2, 'Good', '2023-01-20'),
(2, 'Shure SM58', 'Microphone', 2, 'Good', '2023-01-20'),
(3, 'Panasonic Lumix GH5', 'Camera', 1, 'Good', '2023-02-10'),
(3, 'APUTURE LS C120d', 'Lighting', 2, 'Good', '2023-02-10'),
(4, 'BlackMagic Pocket 6K', 'Camera', 2, 'Good', '2023-02-15'),
(4, 'Sennheiser MKE 600', 'Microphone', 2, 'Good', '2023-02-15'),
(5, 'Canon EOS 80D', 'Camera', 1, 'Good', '2023-03-05');

-- Seed data for student_application table
INSERT INTO student_application (program_id, user_id, apply_date, status, interests, skills) VALUES
(1, 9, '2023-03-05', 'Approved', 'Video editing, cinematography', 'Adobe Premiere Pro, photography'),
(1, 10, '2023-03-06', 'Approved', 'Script writing, directing', 'Creative writing, leadership'),
(2, 11, '2023-03-07', 'Pending', 'Sound design, music production', 'FL Studio, guitar'),
(2, 12, '2023-03-08', 'Pending', 'Animation, graphic design', 'Adobe After Effects, Illustrator');

-- Seed data for content table
INSERT INTO content (program_id, title, description, video_url, upload_date, category, status) VALUES
(1, 'Sambutan Hari Guru 2023', 'Liputan khas sambutan Hari Guru di sekolah', 'https://youtube.com/watch?v=abc123', '2023-05-16', 'Event Coverage', 'Active'),
(1, 'Tutorial Sains SPM: Bab 1', 'Video pembelajaran Sains tingkatan 5', 'https://youtube.com/watch?v=def456', '2023-05-20', 'Education', 'Active'),
(2, 'Pertandingan Deklamasi Puisi', 'Rakaman pertandingan deklamasi puisi peringkat sekolah', 'https://youtube.com/watch?v=ghi789', '2023-06-01', 'Event Coverage', 'Active'),
(2, 'Teknik Menjawab Sejarah PT3', 'Tips dan panduan menjawab soalan Sejarah PT3', 'https://youtube.com/watch?v=jkl012', '2023-06-05', 'Education', 'Active');

-- Seed data for crew table
INSERT INTO crew (studio_id, user_id, role, join_date, status) VALUES
(1, 9, 'Camera Operator', '2023-03-15', 'Active'),
(1, 10, 'Sound Engineer', '2023-03-15', 'Active'),
(2, 11, 'Video Editor', '2023-03-20', 'Active'),
(2, 12, 'Production Assistant', '2023-03-20', 'Active');

-- Seed data for equipment_request table
INSERT INTO equipment_request (studio_id, equipment_name, equipment_type, quantity, price, link, request_reason, status, request_date, approval_date, approved_by, remarks) VALUES
-- Studio 1 Requests
(1, 'Canon EOS R5', 'Camera', 1, 3899.00, 'https://example.com/canon-eos-r5', 'Need an additional camera for high-quality shoots', 'Pending', '2025-01-10 10:00:00', NULL, NULL, NULL),
(1, 'Sony A7S III', 'Camera', 1, 3499.00, 'https://example.com/sony-a7s-iii', 'Upgrade to better camera', 'Rejected', '2025-01-05 09:00:00', '2025-01-12 14:00:00', 5, 'Budget constraints'),
(1, 'DJI Ronin-S', 'Stabilizer', 1, 749.00, 'https://example.com/dji-ronin-s', 'Need a stabilizer for smooth shots', 'Approved', '2025-01-01 08:00:00', '2025-01-07 11:00:00', 5, 'Approved for purchase'),

-- Studio 2 Requests
(2, 'Rode NTG5', 'Microphone', 2, 499.00, 'https://example.com/rode-ntg5', 'Need high-quality microphones for recording', 'Pending', '2025-01-10 10:30:00', NULL, NULL, NULL),
(2, 'Canon EOS M50', 'Camera', 2, 649.00, 'https://example.com/canon-eos-m50', 'Upgrade for better video quality', 'Rejected', '2025-01-05 09:30:00', '2025-01-12 14:30:00', 6, 'Not needed at the moment'),
(2, 'Zoom H5', 'Audio Recorder', 1, 279.00, 'https://example.com/zoom-h5', 'Portable audio recorder for fieldwork', 'Approved', '2025-01-01 08:30:00', '2025-01-07 11:30:00', 6, 'Approved for purchase'),

-- Studio 3 Requests
(3, 'Aputure Light Dome II', 'Lighting', 1, 149.00, 'https://example.com/aputure-light-dome-ii', 'Need better lighting for indoor shoots', 'Pending', '2025-01-10 11:00:00', NULL, NULL, NULL),
(3, 'Panasonic GH5S', 'Camera', 1, 1699.00, 'https://example.com/panasonic-gh5s', 'Upgrade to a better camera', 'Rejected', '2025-01-05 10:00:00', '2025-01-12 15:00:00', 5, 'Budget constraints'),
(3, 'Rode Wireless GO II', 'Microphone', 1, 299.00, 'https://example.com/rode-wireless-go-ii', 'Need wireless microphones for recording', 'Approved', '2025-01-01 09:00:00', '2025-01-07 12:00:00', 5, 'Approved for purchase'),

-- Studio 4 Requests
(4, 'Sony FX3', 'Camera', 1, 3899.00, 'https://example.com/sony-fx3', 'Need a high-quality camera for shoots', 'Pending', '2025-01-10 11:30:00', NULL, NULL, NULL),
(4, 'Canon C70', 'Camera', 1, 5499.00, 'https://example.com/canon-c70', 'Upgrade to a better camera', 'Rejected', '2025-01-05 10:30:00', '2025-01-12 15:30:00', 6, 'Too expensive'),
(4, 'Rode NT1', 'Microphone', 1, 269.00, 'https://example.com/rode-nt1', 'Need a high-quality microphone for recording', 'Approved', '2025-01-01 09:30:00', '2025-01-07 12:30:00', 6, 'Approved for purchase'),

-- Studio 5 Requests
(5, 'DJI Mavic Air 2', 'Drone', 1, 799.00, 'https://example.com/dji-mavic-air-2', 'Need a drone for aerial shots', 'Pending', '2025-01-10 12:00:00', NULL, NULL, NULL),
(5, 'Canon XF405', 'Camera', 1, 2999.00, 'https://example.com/canon-xf405', 'Upgrade to a better camera', 'Rejected', '2025-01-05 11:00:00', '2025-01-12 16:00:00', 5, 'Not needed at the moment'),
(5, 'Shure SM7B', 'Microphone', 1, 399.00, 'https://example.com/shure-sm7b', 'Need a high-quality microphone for recording', 'Approved', '2025-01-01 10:00:00', '2025-01-07 13:00:00', 5, 'Approved for purchase');
