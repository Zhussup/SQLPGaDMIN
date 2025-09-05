CREATE TABLE groups_ (
    group_id SERIAL PRIMARY KEY,
    group_name VARCHAR(50) NOT NULL, 
    student_count INT DEFAULT 0 CHECK (student_count >= 0),
    year_ INT CHECK (year_ BETWEEN 1 AND 6),
    department VARCHAR(50) NOT NULL
);

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50), 
    group_id INT NOT NULL,
    password VARCHAR(20) NOT NULL DEFAULT '1234',
    birth_year INT DEFAULT 2008 CHECK (birth_year >= 2000),
    CONSTRAINT fk_group FOREIGN KEY (group_id) REFERENCES groups_(group_id)
);

CREATE TABLE teachers (
    teacher_id SERIAL PRIMARY KEY, 
    last_name VARCHAR(50) NOT NULL, 
    first_name VARCHAR(50) NOT NULL, 
    middle_name VARCHAR(58)
);

CREATE TABLE subjects (
    subject_id SERIAL PRIMARY KEY, 
    subject_name VARCHAR(100) NOT NULL, 
    teacher_id INT NOT NULL,
    semester INT CHECK (semester BETWEEN 1 AND 8), 
    CONSTRAINT fk_teacher FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

INSERT INTO groups_ (group_name, student_count, year_, department)
VALUES ('SE2410', 22, 1, 'ABD');

INSERT INTO students (last_name, first_name, middle_name, group_id, birth_year)
VALUES
('Alikhan', 'Aibat', 'Alua Amanqolkyzy', 1, 2008),
('Alauddin', 'Nurlanuly', NULL, 1, 2008),
('Aymurza', 'Medetov', 'Arenovuly', 1, 2008),
('Asanali', 'Ahmet', 'Armanovich', 1, 2008),
('Amanzhan', 'Ahmet', 'Asem Abayuly', 1, 2008),
('Baybusinov', 'Barinov', 'Temirlan Rauanuly', 1, 2008),
('Nikolai', 'Vladimirovich', NULL, 1, 2008),
('Bekturganov', 'Bekzhan', 'Askaruly', 1, 2008),
('Duysenbay', 'Aslan', 'Sayanuly', 1, 2008),
('Ermekbay', 'Aym', 'Ermekbaykyzy', 1, 2008),
('Ermolov', 'Arseniy', NULL, 1, 2008),
('Kenzhekhanov', 'Ratmin', 'Sergeevich', 1, 2008),
('Bogdan', 'Anatolyevich', NULL, 1, 2008),
('Kusainov', 'Zhangir', 'Daniyarovich', 1, 2008),
('Kuantayuly', 'Batyrkhan', NULL, 1, 2008),
('Mukaev', 'Dsanali', 'Nurlanovich', 1, 2008),
('Murad', 'Zhanibek', 'Ruslanuly', 1, 2008),
('Olzhaev', 'Batyrkhan', 'Nurjanovich', 1, 2008),
('Serikuly', 'Alisher', NULL, 1, 2008),
('Kanatovich', 'Roslav', 'Vladimirovich', 1, 2008),
('Zholdasbekov', 'Zhusup', NULL, 1, 2008);

ALTER TABLE Teachers
RENAME COLUMN Teacher_ID TO Teacher_Number;

INSERT INTO Teachers (Last_Name, First_Name, Middle_Name)
VALUES
('Zhumakhmetov', 'Nurzhan', 'Alimovich'),
('Batyrkhanov', 'Akhmet', 'Zhadradinovich'),
('Aituganov', 'Seilkhan', 'Kanatovich'),
('Omirkulov', 'Meirlan', 'Serikovich'),
('Syzdykova', 'Saule', 'Zhumabaevna');


INSERT INTO subjects (subject_name, semester)
VALUES
('Mathematical Analysis', 1),
('Python Programming', 1),
('Databases', 2),
('Web Technologies', 3),
('Algorithm Theory', 2),
('Operating Systems', 4),
('Artificial Intelligence', 5),
('Computer Networks', 3),
('Machine Learning', 6),
( 'Cybersecurity', 4);
