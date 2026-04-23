-- ==========================================================
-- Project Name: Hostel Management System
-- Group Name: AI Study Squad
-- Members: Mahboob Ali, Yasir Shakeel, Azad Ali, Waqas Hussain 
-- Instructor: Engr. Arifa
-- ==========================================================



DROP DATABASE IF EXISTS hostel_management_db;
CREATE DATABASE hostel_management_db;
USE hostel_management_db;
SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE hostel (
hostel_id INT AUTO_INCREMENT PRIMARY KEY,
hostel_name VARCHAR(150) NOT NULL,
location VARCHAR(150) NOT NULL,
warden_name VARCHAR(100) NOT NULL,
capacity INT NOT NULL
);

CREATE TABLE student (
student_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
cnic VARCHAR(15) NOT NULL UNIQUE,
phone VARCHAR(15) NOT NULL,
emergency_contact VARCHAR(15),
address VARCHAR(200) NOT NULL,
email VARCHAR(100) UNIQUE
);

CREATE TABLE room (
room_id INT AUTO_INCREMENT PRIMARY KEY,
room_number VARCHAR(10) NOT NULL,
capacity INT NOT NULL,
status ENUM('available','occupied','maintenance') DEFAULT 'available',
hostel_id INT,
UNIQUE(room_number, hostel_id),
FOREIGN KEY (hostel_id) REFERENCES hostel(hostel_id) ON DELETE CASCADE
);

CREATE TABLE allocation (
allocation_id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT,
room_id INT,
allocation_date DATE,
vacate_date DATE,
FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE CASCADE,
FOREIGN KEY (room_id) REFERENCES room(room_id) ON DELETE CASCADE
);

CREATE TABLE fee (
fee_id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT,
amount DECIMAL(10,2),
due_date DATE,
paid_date DATE,
status ENUM('paid','unpaid','overdue') DEFAULT 'unpaid',
FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE CASCADE
);

CREATE TABLE staff (
staff_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
role VARCHAR(50),
phone VARCHAR(15),
hostel_id INT,
FOREIGN KEY (hostel_id) REFERENCES hostel(hostel_id) ON DELETE CASCADE
);

CREATE TABLE complaint (
complaint_id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT,
room_id INT,
description TEXT,
complaint_date DATE,
status ENUM('open','resolved','rejected') DEFAULT 'open',
FOREIGN KEY (student_id) REFERENCES student(student_id),
FOREIGN KEY (room_id) REFERENCES room(room_id)
);

SET FOREIGN_KEY_CHECKS = 1;
INSERT INTO hostel (hostel_name, location, warden_name, capacity) VALUES
('Al-Farabi Hostel','Block A','Mr. Saleem',120),
('Ibn-Sina Hostel','Block B','Mr. Tariq',80),
('Al-Khawarizmi','Block C','Ms. Nadia',60),
('Razi Hostel','Annex','Mr. Kamran',40),
('Avicenna Hostel','North Wing','Ms. Fatima',100);

INSERT INTO student (name, cnic, phone, emergency_contact, address, email) VALUES
('Mehboob Ali','42101-1234567-1','03111111111','03110000000','Karachi','[mehboob@uni.edu.pk](mailto:mehboob@uni.edu.pk)'),
('Yasir Shakeel','42201-2345678-2','03222222222','03220000000','Lahore','[yasir@uni.edu.pk](mailto:yasir@uni.edu.pk)'),
('Azad Ali','42301-3456789-3','03333333333','03330000000','Peshawar','[azad@uni.edu.pk](mailto:azad@uni.edu.pk)'),
('Waqas Hussain','42401-4567890-4','03444444444','03440000000','Quetta','[waqas@uni.edu.pk](mailto:waqas@uni.edu.pk)'),
('Ahmed Raza','42501-5678901-5','03555555555','03550000000','Islamabad','[ahmed@uni.edu.pk](mailto:ahmed@uni.edu.pk)');

INSERT INTO room (room_number, capacity, status, hostel_id) VALUES
('R-101',2,'occupied',1),
('R-102',3,'available',1),
('R-201',2,'occupied',2),
('R-202',4,'maintenance',2),
('R-301',2,'available',3);

INSERT INTO allocation (student_id, room_id, allocation_date, vacate_date) VALUES
(1,1,'2025-01-10',NULL),
(2,1,'2025-01-15',NULL),
(3,3,'2025-02-01',NULL),
(4,3,'2025-02-05',NULL),
(5,2,'2025-03-01','2025-06-30');

INSERT INTO fee (student_id, amount, due_date, paid_date, status) VALUES
(1,5000,'2025-02-28','2025-02-20','paid'),
(2,5000,'2025-02-28',NULL,'overdue'),
(3,4500,'2025-03-31','2025-03-25','paid'),
(4,4500,'2025-03-31',NULL,'unpaid'),
(5,5000,'2025-04-30','2025-04-15','paid');

INSERT INTO staff (name, role, phone, hostel_id) VALUES
('Mr. Saleem','Warden','03000000001',1),
('Mr. Haroon','Maintenance','03000000002',1),
('Mr. Tariq','Warden','03000000003',2),
('Ms. Nadia','Warden','03000000004',3),
('Mr. Imran','Security','03000000005',2);

INSERT INTO complaint (student_id, room_id, description, complaint_date, status) VALUES
(1,1,'Fan not working','2025-03-01','resolved'),
(2,1,'Water leakage','2025-03-05','open'),
(3,3,'Electricity issue','2025-03-10','resolved'),
(4,3,'Window broken','2025-03-15','open'),
(5,2,'Internet issue','2025-03-20','rejected');


















INSERT INTO student (name, cnic, phone, emergency_contact, address, email) VALUES
-- Real Data (cleaned)
('Yasir Malik','43301-7000001-1','03070000001','03070000002','Ubaro Ghotki','[yasir.malik@uni.edu.pk](mailto:yasir.malik@uni.edu.pk)'),
('Moiz Malik','43301-7000002-2','03070000003','03070000004','Ghari Yasin','[moiz.malik@uni.edu.pk](mailto:moiz.malik@uni.edu.pk)'),
('Awais Memon','43301-7000003-3','03070000005','03070000006','Lakhi Shikarpur','[awais.memon@uni.edu.pk](mailto:awais.memon@uni.edu.pk)'),
('Atif Aijaz','43301-7000004-4','03070000007','03070000008','Ghotki','[atif.aijaz@uni.edu.pk](mailto:atif.aijaz@uni.edu.pk)'),
('Umar Khan','43301-7000005-5','03070000009','03070000010','Ghotki','[umar.khan@uni.edu.pk](mailto:umar.khan@uni.edu.pk)'),

-- Mixed realistic dummy
('Ali Hassan','43301-7000006-6','03070000011','03070000012','Khairpur','[ali.hassan@uni.edu.pk](mailto:ali.hassan@uni.edu.pk)'),
('Sajid Ali','43301-7000007-7','03070000013','03070000014','Sukkur','[sajid.ali@uni.edu.pk](mailto:sajid.ali@uni.edu.pk)'),
('Imran Shah','43301-7000008-8','03070000015','03070000016','Larkana','[imran.shah@uni.edu.pk](mailto:imran.shah@uni.edu.pk)'),
('Bilal Ahmed','43301-7000009-9','03070000017','03070000018','Hyderabad','[bilal.ahmed@uni.edu.pk](mailto:bilal.ahmed@uni.edu.pk)'),
('Zubair Ali','43301-7000010-0','03070000019','03070000020','Karachi','[zubair.ali@uni.edu.pk](mailto:zubair.ali@uni.edu.pk)'),

-- More realistic variety
('Furqan Haider','43301-7000011-1','03070000021','03070000022','Ghotki','[furqan@uni.edu.pk](mailto:furqan@uni.edu.pk)'),
('Kamran Ali','43301-7000012-2','03070000023','03070000024','Shikarpur','[kamran@uni.edu.pk](mailto:kamran@uni.edu.pk)'),
('Nouman Nabi','43301-7000013-3','03070000025','03070000026','Jacobabad','[nouman@uni.edu.pk](mailto:nouman@uni.edu.pk)'),
('Rehmat Ali','43301-7000014-4','03070000027','03070000028','Shahdadkot','[rehmat@uni.edu.pk](mailto:rehmat@uni.edu.pk)'),
('Najaf Ali','43301-7000015-5','03070000029','03070000030','Ranipur','[najaf@uni.edu.pk](mailto:najaf@uni.edu.pk)');

INSERT INTO room (room_number, capacity, status, hostel_id) VALUES
('R-120',3,'available',1),
('R-121',3,'occupied',1),
('R-122',2,'available',2),
('R-123',2,'occupied',2),
('R-124',4,'available',3),
('R-125',3,'occupied',3),
('R-126',2,'maintenance',4),
('R-127',3,'available',4),
('R-128',4,'occupied',5),
('R-129',2,'available',5);


SHOW databases;
USE hostel_management_db;
SHOW tables;
describe FEE;
SELECT S.name, F.amount, F.status 
FROM student S
JOIN fee F ON S.student_id = F.student_id
WHERE F.status IN ('unpaid', 'overdue');




