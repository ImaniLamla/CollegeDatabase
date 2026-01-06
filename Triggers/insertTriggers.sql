DELIMITER $$
-- This document contains all INSERT triggers on the databse
    
-- User table trigger: sets the audit user fields to the current user
DROP TRIGGER IF EXISTS on_user_insert$$
CREATE TRIGGER on_user_insert
BEFORE INSERT ON user
FOR EACH ROW
BEGIN
    SET NEW.created_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Department table trigger: sets the audit user fields to the current user
DROP TRIGGER IF EXISTS on_department_insert$$
CREATE TRIGGER on_department_insert
BEFORE INSERT ON department
FOR EACH ROW
BEGIN
    SET NEW.created_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Role table trigger: sets the audit user fields to the current user
DROP TRIGGER IF EXISTS on_role_insert$$
CREATE TRIGGER on_role_insert
BEFORE INSERT ON role
FOR EACH ROW
BEGIN
    SET NEW.created_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Employee table trigger: sets the audit user fields to the current user
DROP TRIGGER IF EXISTS on_employee_insert$$
CREATE TRIGGER on_employee_insert
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
    SET NEW.created_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Building table trigger: sets the audit user fields to the current user
DROP TRIGGER IF EXISTS on_building_insert$$
CREATE TRIGGER on_building_insert
BEFORE INSERT ON building
FOR EACH ROW
BEGIN
    SET NEW.created_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Room table trigger: sets the audit user fields to the current user
DROP TRIGGER IF EXISTS on_room_insert$$
CREATE TRIGGER on_room_insert
BEFORE INSERT ON room
FOR EACH ROW
BEGIN
    SET NEW.created_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Status table trigger: sets the audit user fields to the current user
DROP TRIGGER IF EXISTS on_status_insert$$
CREATE TRIGGER on_status_insert
BEFORE INSERT ON status
FOR EACH ROW
BEGIN
    SET NEW.created_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Student table trigger: sets the audit user fields to the current user
DROP TRIGGER IF EXISTS on_student_insert$$
CREATE TRIGGER on_student_insert
BEFORE INSERT ON student
FOR EACH ROW
BEGIN
    SET NEW.created_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Semester table trigger: sets the audit user fields to the current user
DROP TRIGGER IF EXISTS on_semester_insert$$
CREATE TRIGGER on_semester_insert
BEFORE INSERT ON semester
FOR EACH ROW
BEGIN
    SET NEW.created_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Course table trigger: sets the audit user fields to the current user
DROP TRIGGER IF EXISTS on_course_insert$$
CREATE TRIGGER on_course_insert
BEFORE INSERT ON course
FOR EACH ROW
BEGIN
    SET NEW.created_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Section table trigger: sets the audit user fields to the current user
DROP TRIGGER IF EXISTS on_section_insert$$
CREATE TRIGGER on_section_insert
BEFORE INSERT ON section
FOR EACH ROW
BEGIN
    SET NEW.created_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Section audit table trigger: sets the audit user fields to the current user
DROP TRIGGER IF EXISTS on_section_audit_insert$$
CREATE TRIGGER on_section_audit_insert
BEFORE INSERT ON section_audit
FOR EACH ROW
BEGIN
    SET NEW.created_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Enrollment table trigger: sets the audit user fields to the current user
DROP TRIGGER IF EXISTS on_enrollment_insert$$
CREATE TRIGGER on_enrollment_insert
BEFORE INSERT ON enrollment
FOR EACH ROW
BEGIN
    SET NEW.created_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Grade_type table trigger: sets the audit user fields to the current user
DROP TRIGGER IF EXISTS on_grade_type_insert$$
CREATE TRIGGER on_grade_type_insert
BEFORE INSERT ON grade_type
FOR EACH ROW
BEGIN
    SET NEW.created_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Grade table trigger: sets the audit user fields to the current user
DROP TRIGGER IF EXISTS on_grade_insert$$
CREATE TRIGGER on_grade_insert
BEFORE INSERT ON grade
FOR EACH ROW
BEGIN
    SET NEW.created_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Grade audit table trigger: sets the audit user fields to the current user
DROP TRIGGER IF EXISTS on_grade_audit_insert$$
CREATE TRIGGER on_grade_audit_insert
BEFORE INSERT ON grade_audit
FOR EACH ROW
BEGIN
    SET NEW.created_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Section_room table trigger: sets the audit user fields to the current user
DROP TRIGGER IF EXISTS on_section_room_insert$$
CREATE TRIGGER on_section_room_insert
BEFORE INSERT ON section_room
FOR EACH ROW
BEGIN
    SET NEW.created_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$


-- The following INSERT triggers are used for data standardization 

-- This trigger sets the letter field in the grade table to uppercase on insertion  
DROP TRIGGER IF EXISTS insert_format_grade_letter$$
CREATE TRIGGER insert_format_grade_letter
BEFORE INSERT ON grade 
FOR EACH ROW 
BEGIN 
    SET NEW.letter = UPPER(NEW.letter);
END$$

-- This trigger sets the dow (Day of Week) field in the section table to uppercase on insertion  
DROP TRIGGER IF EXISTS insert_format_dow$$
CREATE TRIGGER insert_format_dow
BEFORE INSERT ON section
FOR EACH ROW
BEGIN
    SET NEW.dow = UPPER(NEW.dow);
END$$

-- This trigger sets only the first character of the term field in the semester table to uppercase on insertion
DROP TRIGGER IF EXISTS insert_format_term$$
CREATE TRIGGER insert_format_term
BEFORE INSERT ON semester
FOR EACH ROW
BEGIN
    SET NEW.term = CONCAT(UPPER(SUBSTRING(NEW.term, 1, 1)), LOWER(SUBSTRING(NEW.term, 2)));
END$$

DELIMITER ;
