-- Create school table
CREATE TABLE school (
    school_id INT PRIMARY KEY AUTO_INCREMENT,
    school_name VARCHAR(100) NOT NULL,
    school_address TEXT NOT NULL,
    contact_number VARCHAR(20),
    email VARCHAR(100)
);

-- Create role table
CREATE TABLE role (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50) NOT NULL,
    description TEXT,
    access_level INT CHECK (access_level BETWEEN 1 AND 5),
    status VARCHAR(20) DEFAULT 'Active'
);

-- Create user table
CREATE TABLE user (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    role_id INT,
    school_id INT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    status VARCHAR(20) DEFAULT 'Active',
    FOREIGN KEY (role_id) REFERENCES role(role_id),
    FOREIGN KEY (school_id) REFERENCES school(school_id)
);

-- Create student table
CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    school_id INT,
    full_name VARCHAR(100) NOT NULL,
    class VARCHAR(20),
    date_of_birth DATE,
    gender VARCHAR(20),
    contact_number VARCHAR(20),
    email VARCHAR(100),
    address TEXT,
    join_date DATE,
    status VARCHAR(20) DEFAULT 'Active',
    FOREIGN KEY (school_id) REFERENCES school(school_id)
);

-- Create program table
CREATE TABLE program (
    program_id INT PRIMARY KEY AUTO_INCREMENT,
    school_id INT,
    youTube_channel_link VARCHAR(255),
    establishment_date DATE,
    status VARCHAR(20) DEFAULT 'Active',
    FOREIGN KEY (school_id) REFERENCES school(school_id)
);

-- Create student_application table
CREATE TABLE student_application (
    application_id INT PRIMARY KEY AUTO_INCREMENT,
    program_id INT,
    student_id INT,
    apply_date DATE,
    status VARCHAR(20) DEFAULT 'Pending',
    interests TEXT,
    skills TEXT,
    FOREIGN KEY (program_id) REFERENCES program(program_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);

-- Create content table
CREATE TABLE content (
    content_id INT PRIMARY KEY AUTO_INCREMENT,
    program_id INT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    video_url VARCHAR(255),
    upload_date DATE,
    category VARCHAR(50),
    status VARCHAR(20) DEFAULT 'Active',
    FOREIGN KEY (program_id) REFERENCES program(program_id)
);

-- Create studio table
CREATE TABLE studio (
    studio_id INT PRIMARY KEY AUTO_INCREMENT,
    program_id INT,
    studio_name VARCHAR(100) NOT NULL,
    studio_level VARCHAR(20),
    location VARCHAR(255),
    size DECIMAL(10,2),
    status VARCHAR(20) DEFAULT 'Operational',
    FOREIGN KEY (program_id) REFERENCES program(program_id)
);

-- Create crew table
CREATE TABLE crew (
    crew_id INT PRIMARY KEY AUTO_INCREMENT,
    studio_id INT,
    student_id INT,
    role VARCHAR(50),
    join_date DATE,
    status VARCHAR(20) DEFAULT 'Active',
    FOREIGN KEY (studio_id) REFERENCES studio(studio_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);

-- Create equipment table
CREATE TABLE equipment (
    equipment_id INT PRIMARY KEY AUTO_INCREMENT,
    studio_id INT,
    equipment_name VARCHAR(100) NOT NULL,
    equipment_type VARCHAR(50),
    quantity INT DEFAULT 1,
    status VARCHAR(20) DEFAULT 'Good',
    purchase_date DATE,
    FOREIGN KEY (studio_id) REFERENCES studio(studio_id)
);
