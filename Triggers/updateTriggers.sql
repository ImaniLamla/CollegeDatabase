DELIMITER $$

-- The following code contains update triggers on the database
    
-- Building table trigger: sets the audit user field to current user on update
DROP TRIGGER IF EXISTS on_building_update$$
CREATE TRIGGER on_building_update
BEFORE UPDATE ON building
FOR EACH ROW
BEGIN
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Course table trigger: sets the audit user field to current user on update
DROP TRIGGER IF EXISTS on_course_update$$
CREATE TRIGGER on_course_update
BEFORE UPDATE ON course
FOR EACH ROW
BEGIN
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Department table trigger: sets the audit user field to current user on update
DROP TRIGGER IF EXISTS on_department_update$$
CREATE TRIGGER on_department_update
BEFORE UPDATE ON department
FOR EACH ROW
BEGIN
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Employee table trigger: sets the audit user field to current user on update
DROP TRIGGER IF EXISTS on_employee_update$$
CREATE TRIGGER on_employee_update
BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Enrollment table trigger: sets the audit user field to current user on update
DROP TRIGGER IF EXISTS on_enrollment_update$$
CREATE TRIGGER on_enrollment_update
BEFORE UPDATE ON enrollment
FOR EACH ROW
BEGIN
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Grade table trigger: sets the audit user field to current user on update
DROP TRIGGER IF EXISTS on_grade_update$$
CREATE TRIGGER on_grade_update
BEFORE UPDATE ON grade
FOR EACH ROW
BEGIN
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Grade audit table trigger: sets the audit user field to current user on update
DROP TRIGGER IF EXISTS on_grade_audit_update$$
CREATE TRIGGER on_grade_audit_update
BEFORE UPDATE ON grade_audit
FOR EACH ROW
BEGIN
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Grade_type table trigger: sets the audit user field to current user on update
DROP TRIGGER IF EXISTS on_grade_type_update$$
CREATE TRIGGER on_grade_type_update
BEFORE UPDATE ON grade_type
FOR EACH ROW
BEGIN
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Role table trigger: sets the audit user field to current user on update
DROP TRIGGER IF EXISTS on_role_update$$
CREATE TRIGGER on_role_update
BEFORE UPDATE ON role
FOR EACH ROW
BEGIN
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Room table trigger: sets the audit user field to current user on update
DROP TRIGGER IF EXISTS on_room_update$$
CREATE TRIGGER on_room_update
BEFORE UPDATE ON room
FOR EACH ROW
BEGIN
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Section table trigger: sets the audit user field to current user on update
DROP TRIGGER IF EXISTS on_section_update$$
CREATE TRIGGER on_section_update
BEFORE UPDATE ON section
FOR EACH ROW
BEGIN
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Section audit table trigger: sets the audit user field to current user on update
DROP TRIGGER IF EXISTS on_section_audit_update$$
CREATE TRIGGER on_section_audit_update
BEFORE UPDATE ON section_audit
FOR EACH ROW
BEGIN
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Section_room table trigger: sets the audit user field to current user on update
DROP TRIGGER IF EXISTS on_section_room_update$$
CREATE TRIGGER on_section_room_update
BEFORE UPDATE ON section_room
FOR EACH ROW
BEGIN
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Semester table trigger: sets the audit user field to current user on update
DROP TRIGGER IF EXISTS on_semester_update$$
CREATE TRIGGER on_semester_update
BEFORE UPDATE ON semester
FOR EACH ROW
BEGIN
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Status table trigger: sets the audit user field to current user on update
DROP TRIGGER IF EXISTS on_status_update$$
CREATE TRIGGER on_status_update
BEFORE UPDATE ON status
FOR EACH ROW
BEGIN
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- Student table trigger: sets the audit user field to current user on update
DROP TRIGGER IF EXISTS on_student_update$$
CREATE TRIGGER on_student_update
BEFORE UPDATE ON student
FOR EACH ROW
BEGIN
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$

-- User table trigger: sets the audit user field to current user on update
DROP TRIGGER IF EXISTS on_user_update$$
CREATE TRIGGER on_user_update
BEFORE UPDATE ON user
FOR EACH ROW
BEGIN
    SET NEW.updated_userid = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
END$$


-- The following update triggers are used for data standardization

-- This trigger sets the letter field in the grade table to uppercase when updated
DROP TRIGGER IF EXISTS update_format_grade_letter$$
CREATE TRIGGER update_format_grade_letter
BEFORE UPDATE ON grade
FOR EACH ROW
BEGIN
    SET NEW.letter = UPPER(NEW.letter);
END$$

-- This trigger sets the dow (Day of Week) field in the section table to uppercase when updated
DROP TRIGGER IF EXISTS update_format_dow$$
CREATE TRIGGER update_format_dow
BEFORE UPDATE ON section
FOR EACH ROW
BEGIN
    SET NEW.dow = UPPER(NEW.dow);
END$$

-- This trigger sets only the first letter of the term field in the semester table to uppercase when updated
DROP TRIGGER IF EXISTS update_format_term$$
CREATE TRIGGER update_format_term
BEFORE UPDATE ON semester
FOR EACH ROW
BEGIN
    SET NEW.term = CONCAT(UPPER(SUBSTRING(NEW.term, 1, 1)), LOWER(SUBSTRING(NEW.term, 2)));
END$$

DELIMITER ;
