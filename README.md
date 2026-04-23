# Hostel Management System - Relational Database

A robust, fully normalized (1NF, 2NF, 3NF) relational database designed to manage university hostel operations efficiently. This project demonstrates practical database architecture, data manipulation, and complex querying using MySQL.

## 📌 Project Overview
This database system manages the end-to-end allocation lifecycle of a university hostel. It tracks physical infrastructure (hostels and rooms), student allocations, fee payments, staff assignments, and maintenance complaints. 

## 🏗️ Database Schema & Architecture
The database consists of 7 interrelated tables with strict primary and foreign key constraints to ensure referential integrity. 

* **Hostel**: Stores building information and capacity.
* **Room**: Tracks room numbers, status (`available`, `occupied`, `maintenance`), and capacities.
* **Student**: Holds student demographic and contact details with UNIQUE constraints on CNIC and Email.
* **Allocation**: A junction table linking students to rooms, handling Many-to-Many (M:N) relationships.
* **Fee**: Tracks monthly fee records and payment statuses (`paid`, `unpaid`, `overdue`).
* **Staff**: Records warden and maintenance staff assignments.
* **Complaint**: Logs student complaints with status tracking (`open`, `resolved`, `rejected`).


## ⚙️ Key Technical Features
* **Normalization:** Schema is normalized up to the Third Normal Form (3NF) to eliminate data redundancy and transitive dependencies.
* **Referential Integrity:** Extensive use of `ON DELETE CASCADE` ensures that removing a parent record (like a student) cleanly removes associated child records (like fees and allocations) without leaving orphaned data.
* **Data Validation:** Utilizes `CHECK` constraints (e.g., preventing negative room capacities or fee amounts) and `ENUM` types for precise status tracking.
* **Advanced Querying:** Includes complex DQL operations such as `INNER JOIN`, `LEFT JOIN`, Aggregate functions (`SUM`, `COUNT`), and Subqueries.

## 🚀 How to Run Locally
1. Clone this repository to your local machine.
2. Open MySQL Workbench (or your preferred SQL IDE).
3. Open the `hostel_db_backup.sql` file.
4. Execute the script to automatically build the `hostel_management_db` schema, generate the tables, and populate them with data.

## 🧠 Key Learnings & Future Scope
Building this system provided hands-on experience in resolving real-world database design challenges. A major learning outcome was understanding the critical importance of table creation and deletion order when handling Foreign Key dependencies. Designing the allocation junction table also clarified how to properly resolve Many-to-Many relationships.

**Future features to implement:**
* User Authentication tables for Role-Based Access Control (Admin vs. Warden).
* Automated SQL Triggers to instantly update a room's status to 'occupied' when a new allocation is inserted.

---
*Created by Mahboob Ali ,Azad Ali, Yasir Malik, Waqas Hussain| BS Artificial Intelligence | Aror University Sukkur*
