DELIMITER $$

-- The following triggers are used to populate the section_audit table for any INSERT, UPDATE and DELETE on the section table 

-- This trigger populates the section_audit table after a new record is inserted (this is to ensure the audit table has the section_id)
DROP TRIGGER IF EXISTS audit_section_insert$$
CREATE TRIGGER audit_section_insert
AFTER INSERT ON section
FOR EACH ROW
BEGIN
    INSERT INTO section_audit (section_id, semester_id, course_id, instructor_id, dow, start_time, end_time, created, created_userid, updated, updated_userid, audit_userid, audit_action)
    VALUES (NEW.id, NEW.semester_id, NEW.course_id, NEW.instructor_id, NEW.dow, NEW.start_time, NEW.end_time, NEW.created, NEW.created_userid, NEW.updated, NEW.updated_userid, SUBSTRING_INDEX(CURRENT_USER(), '@', 1), 'INSERT');
END$$

-- This trigger populates the section_audit table before a record is updated. 
DROP TRIGGER IF EXISTS audit_section_update$$
CREATE TRIGGER audit_section_update
BEFORE UPDATE ON section
FOR EACH ROW
BEGIN
    INSERT INTO section_audit (section_id, semester_id, course_id, instructor_id, dow, start_time, end_time, created, created_userid, updated, updated_userid, audit_userid, audit_action)
    VALUES (OLD.id, OLD.semester_id, OLD.course_id, OLD.instructor_id, OLD.dow, OLD.start_time, OLD.end_time, OLD.created, OLD.created_userid, OLD.updated, OLD.updated_userid, SUBSTRING_INDEX(CURRENT_USER(), '@', 1), 'UPDATE');
END$$

-- This trigger populates the section_audit table before a record is deleted. 
DROP TRIGGER IF EXISTS audit_section_delete$$
CREATE TRIGGER audit_section_delete
BEFORE DELETE ON section
FOR EACH ROW
BEGIN
    INSERT INTO section_audit (section_id, semester_id, course_id, instructor_id, dow, start_time, end_time, created, created_userid, updated, updated_userid, audit_userid, audit_action)
    VALUES (OLD.id, OLD.semester_id, OLD.course_id, OLD.instructor_id, OLD.dow, OLD.start_time, OLD.end_time, OLD.created, OLD.created_userid, OLD.updated, OLD.updated_userid, SUBSTRING_INDEX(CURRENT_USER(), '@', 1), 'DELETE');
END$$
DELIMITER ;
