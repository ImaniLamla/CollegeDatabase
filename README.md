# College Database EER Diagram

<img width="973" height="863" alt="image" src="https://github.com/user-attachments/assets/2ece5906-3c15-4c0b-97c0-1b48f54bee3f" />


_EER DIAGRAM_

---

## Table of Contents

- [Project Overview](#project-overview)
- [Tables and Descriptions](#tables-and-descriptions)
- [Common Columns](#common-columns)
- [Relationships](#relationships)
- [Triggers](#triggers)
- [Events](#events)
- [Authors](#authors)

---

## Project Overview

![MariaDB](https://img.shields.io/badge/Database-MariaDB-blue)  
![EER](https://img.shields.io/badge/Model-EER%20Diagram-lightgrey)  
![Education](https://img.shields.io/badge/Project-Classroom%20Assignment-yellow)

This project is a classroom assignment that models a college database using an Enhanced Entity-Relationship (EER) diagram.  
It captures data about users, students, employees, departments, courses, semesters, sections, rooms, buildings, enrollments, and grades. For the final version of this database, triggers and events were added.

The database is designed to:

- Track users who may be students, employees, or other.
- Manage course offerings, enrollments, and grades.
- Handle departmental and building assignments.
- Support classroom scheduling and room assignments.

---

| Table Name     | Description                                                                                                                                                       |
| -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `user`         | Represents a person associated with the university (student, employee, or other). Stores personal info like name, date of birth, contact info, and university ID. |
| `student`      | Represents a student enrolled at the university; each student corresponds to a `user`. Tracks admission date, GPA, and current status.                            |
| `employee`     | Represents a university employee, including faculty or staff. Each employee corresponds to a `user` and belongs to a `department` and has a `role`.               |
| `department`   | Represents an academic or administrative department at the university.                                                                                            |
| `role`         | Represents a role assigned to an employee (e.g., Professor, Administrator).                                                                                       |
| `status`       | Represents the status of a student (e.g., Active, Alumnus, Leave of Absence).                                                                                     |
| `course`       | Represents an academic course offered by the university. Includes course name, description, and whether it is currently active.                                   |
| `semester`     | Represents a university semester, including term (e.g., Fall) and year.                                                                                           |
| `section`      | Represents a course section offered during a semester, taught by an employee (instructor), with day(s) of the week and start/end times.                           |
| `enrollment`   | Represents a student's enrollment in a specific section.                                                                                                          |
| `grade_type`   | Represents the type of a grade (e.g., Midterm, Final, Project).                                                                                                   |
| `grade`        | Represents a grade assigned to a student's enrollment in a section, linked to a `grade_type`.                                                                     |
| `building`     | Represents a university building, including its name, campus, and a supervising employee.                                                                         |
| `room`         | Represents a room within a building, with capacity and optional description.                                                                                      |
| `section_room` | Represents the many-to-many relationship between `section`s and `room`s. Allows a section to be assigned to multiple rooms and a room to host multiple sections.  |

## Tables and Descriptions

### `user`

**Columns:**

- `id` (PK) – Unique identifier
- `first_name`, `last_name` – Name of the user
- `dob` – Date of birth
- `address`, `email`, `phone_number`, `ssn` – Contact and identification information
- `university_id` – Unique university-specific identifier

---

### `student`

**Columns:**

- `id` (PK) – Unique identifier
- `user_id` (FK → `user.id`) – Associated user
- `admission_date` – Date of admission
- `gpa` – Current grade point average
- `status` (FK → `status.id`) – Current student status (e.g., Active, Alumnus)

---

### `employee`

**Columns:**

- `id` (PK) – Unique identifier
- `user_id` (FK → `user.id`) – Associated user
- `department_id` (FK → `department.id`) – Department where the employee works
- `role_id` (FK → `role.id`) – Role or job title

---

### `department`

**Columns:**

- `id` (PK) – Unique identifier
- `name` – Department name

---

### `role`

**Columns:**

- `id` (PK) – Unique identifier
- `name` – Role name (e.g., Professor, Administrator)
- `description` – Optional description of the role

---

### `status`

**Columns:**

- `id` (PK) – Unique identifier
- `label` – Status label (e.g., Active, Alumnus)
- `description` – Explanation of the status

---

### `grade_type`

**Columns:**

- `id` (PK) – Unique identifier
- `name` – Grade type (e.g., Midterm, Final, Project)

---

### `grade`

**Columns:**

- `id` (PK) – Unique identifier
- `letter` – Letter grade (e.g., A, B, C)
- `enrollment_id` (FK → `enrollment.id`) – Enrollment associated with this grade
- `type` (FK → `grade_type.id`) – Type of the grade

---

### `enrollment`

**Columns:**

- `id` (PK) – Unique identifier
- `student_id` (FK → `student.id`) – Enrolled student
- `section_id` (FK → `section.id`) – Section the student is enrolled in

---

### `section`

**Columns:**

- `id` (PK) – Unique identifier
- `semester_id` (FK → `semester.id`) – Semester the section is offered in
- `course_id` (FK → `course.id`) – Associated course
- `instructor_id` (FK → `employee.id`) – Instructor assigned to the section
- `dow` – Day(s) of the week
- `start_time`, `end_time` – Scheduled times

---

### `course`

**Columns:**

- `id` (PK) – Unique identifier
- `name` – Course name
- `description` – Course description
- `active` – Indicates if the course is currently active (TINYINT)

---

### `semester`

**Columns:**

- `id` (PK) – Unique identifier
- `term` – Term name (e.g., Fall, Spring)
- `year` – Calendar year

---

### `building`

**Columns:**

- `id` (PK) – Unique identifier
- `name` – Building name
- `building_supervisor` (FK → `employee.id`) – Employee supervising the building
- `campus` – Campus location

---

### `room`

**Columns:**

- `id` (PK) – Unique identifier
- `name` – Room name or number
- `building` (FK → `building.id`) – Building containing the room
- `capacity` – Number of occupants the room can hold
- `description` – Additional notes about the room

---

### `section_room`

**Columns:**

- `id` (PK) – Unique identifier
- `room_id` (FK → `room.id`) – Assigned room
- `section_id` (FK → `section.id`) – Section scheduled in the room

---

## Common Columns

All tables include the following audit columns:

- `created` (TIMESTAMP) – Record creation timestamp
- `created_userid` (INT) – User ID who created the record
- `updated` (TIMESTAMP) – Last update timestamp
- `updated_userid` (INT) – User ID who last updated the record

---

## Relationships

- `user` → `student` / `employee` (1-to-0..1)
- `student` → `status` (many-to-1)
- `student` → `enrollment` (1-to-many)
- `enrollment` → `grade` (1-to-many)
- `grade` → `grade_type` (many-to-1)
- `employee` → `department` / `role` (many-to-1)
- `building` → `employee` (`building_supervisor`) (many-to-1)
- `room` → `building` (many-to-1)
- `section` → `course` / `semester` / `employee` (`instructor_id`) (many-to-1)
- `section_room` → `section` / `room` (many-to-many)

---
## Triggers
 
| Trigger Name |    Type    |      Table Affected      | Description                                                                                                                               |                
| ------------ | -----------|--------------------------|------------------------------------------------------------------------------------------------------------------------------------------ |
| `grade_after_insert` | INSERT | `grade_audit` | This trigger populates the audit table with the new data that is being inserted into the `grade` table.                                          |
| `grade_before_update` | UPDATE | `grade_audit` | This trigger populates the audit table with the old data or record before it can be updated.                                                    |
| `grade_before_delete` | DELETE | `grade_audit` | This trigger populates the audit table with the record before it can be deleted from the `grade` table.                                         |
| `audit_section_insert` | INSERT | `section_audit` | This trigger populates the audit table with the new data that is being inserted into the `section` table.                                    |
| `audit_section_update` | UPDATE | `section_audit` | This trigger populates the audit table with the old data or record before it can be updated.                                                 |
| `audit_section_delete` | DELETE | `section_audit` | This trigger populates the audit table with the record before it can be deleted from the `section` table.                                    |
| `insert_user_username` | INSERT | `user`          | This trigger generates a user's username and campus email before insertion into the `user` table.                                            |
| `on_user_insert` | INSERT | `user`          | This trigger sets the audit username fields to the current user when inserting a new record into the `user` table.                                 |
| `on_department_insert` | INSERT | `department`          | This trigger sets the audit username fields to the current user when inserting a new record into the `department` table.               |
| `on_role_insert` | INSERT | `role`          | This trigger sets the audit username fields to the current user when inserting a new record into the `role` table.                                 |
| `on_employee_insert` | INSERT | `employee`          | This trigger sets the audit username fields to the current user when inserting a new record into the `employee` table.                     |
| `on_building_insert` | INSERT | `building`          | This trigger sets the audit username fields to the current user when inserting a new record into the `building` table.                     |
| `on_room_insert` | INSERT | `room`          | This trigger sets the audit username fields to the current user when inserting a new record into the `room` table.                                 |
| `on_status_insert` | INSERT | `status`          | This trigger sets the audit username fields to the current user when inserting a new record into the `status` table.                           |
| `on_student_insert` | INSERT | `student`          | This trigger sets the audit username fields to the current user when inserting a new record into the `student` table.                        |
| `on_semester_insert` | INSERT | `semester`          | This trigger sets the audit username fields to the current user when inserting a new record into the `semester` table.                     |
| `on_course_insert` | INSERT | `course`          | This trigger sets the audit username fields to the current user when inserting a new record into the `course` table.                           |
| `on_section_insert` | INSERT | `section`          | This trigger sets the audit username fields to the current user when inserting a new record into the `section` table.                        |
| `on_enrollment_insert` | INSERT | `enrollment`          | This trigger sets the audit username fields to the current user when inserting a new record into the `enrollment` table.               |
| `on_grade_insert` | INSERT | `grade`          | This trigger sets the audit username fields to the current user when inserting a new record into the `grade` table.                              |
| `on_grade_type_insert` | INSERT | `grade_type`          | This trigger sets the audit username fields to the current user when inserting a new record into the `grade_type` table.               |
| `on_section_room_insert` | INSERT | `section_room`          | This trigger sets the audit username fields to the current user when inserting a new record into the `section_room` table.         |
| `on_user_update` | UPDATE | `user`          | This trigger sets the audit username field to the current user when updating a record in the `user` table.                                 |
| `on_department_update` | UPDATE | `department`          | This trigger sets the audit username field to the current user when updating a record in the `department` table.               |
| `on_role_update` | UPDATE | `role`          | This trigger sets the audit username fiels to the current user when updating a record in the `role` table.                                 |
| `on_employee_update` | UPDATE | `employee`          | This trigger sets the audit username field to the current user when updating a record in the `employee` table.                     |
| `on_building_update` | UPDATE | `building`          | This trigger sets the audit username field to the current user when updating a record in the `building` table.                     |
| `on_room_update` | UPDATE | `room`          | This trigger sets the audit username field to the current user when updating a record in the `room` table.                                 |
| `on_status_update` | UPDATE | `status`          | This trigger sets the audit username field to the current user when updating a record in the `status` table.                           |
| `on_student_update` | UPDATE | `student`          | This trigger sets the audit username field to the current user when updating a record in the `student` table.                        |
| `on_semester_update` | UPDATE | `semester`          | This trigger sets the audit username field to the current user when updating a record in the `semester` table.                     |
| `on_course_update` | UPDATE | `course`          | This trigger sets the audit username field to the current user when updating a record in the `course` table.                           |
| `on_section_update` | UPDATE | `section`          | This trigger sets the audit username field to the current user when updating a record in the `section` table.                        |
| `on_enrollment_update` | UPDATE | `enrollment`          | This trigger sets the audit username field to the current user when updating a record in the `enrollment` table.               |
| `on_grade_update` | UPDATE | `grade`          | This trigger sets the audit username field to the current user when updating a record in the `grade` table.                              |
| `on_grade_type_update` | UPDATE | `grade_type`          | This trigger sets the audit username field to the current user when updating a record in the `grade_type` table.               |
| `on_section_room_update` | UPDATE | `section_room`          | This trigger sets the audit username field to the current user when updating a record in the `section_room` table.         |
| `insert_format_grade_letter` | INSERT | `grade`          | This trigger standardizes the the format for the `letter` field in this table to be uppercase.                                |
| `insert_format_dow` | INSERT | `section`          | This trigger standardizes the the format for the `dow` field in this table to be uppercase.                                          |
| `insert_format_term` | INSERT | `semester`          | This trigger standardizes the the format for the `term` field in this table where only the first character is capitalized.         |
| `update_format_grade_letter` | UPDATE | `grade`          | This trigger standardizes the the format for the `letter` field in this table to be uppercase when updated.                                |
| `update_format_dow` | UPDATE | `section`          | This trigger standardizes the the format for the `dow` field in this table to be uppercase when updated.                                          |
| `update_format_term` | UPDATE | `semester`          | This trigger standardizes the the format for the `term` field in this table where only the first character is capitalized when updated.         | 


## Events

| Event Name |      Table Affected      | Description                                                                                                                               |                
| -----------| -------------            |------------------------------------------------------------------------------------------------------------------------------------------ |
| `monthly_delete_grade_audit_rows`   |  `grade_audit   | This event will delete records from the `grade_audit` table that are over a month old starting on Dec. 3                  | 
| `monthly_delete_section_audit_rows` | `section_audit` | This event will delete records from the `section_audit` table that are over a month old starting on Dec. 3                | 

## Authors

- [Nicolas Tagliafichi](https://github.com/nicotaglia14)
- [Imani Lamla](https://github.com/ImaniLamla)
