DELIMITER // 

-- insert trigger on grade table to populate the audit table, used an AFTER so that the audit table can populate with the grade_id
DROP TRIGGER IF EXISTS grade_after_insert//
CREATE TRIGGER grade_after_insert
AFTER INSERT ON grade 
FOR EACH ROW 
BEGIN 
    INSERT INTO grade_audit
        (grade_id,
         letter,
         enrollment_id,
         type,
         created,
         created_userid,
         updated,
         updated_userid,
         audit_userid,
         audit_action)
    VALUES
        (NEW.id,
         NEW.letter,
         NEW.enrollment_id,
         NEW.type,
         NEW.created,
         NEW.created_userid,
         NEW.updated,
         NEW.updated_userid,
         SUBSTRING_INDEX(CURRENT_USER(), '@', 1),   
         'INSERT');
END // 

-- update trigger on grade table to populate the audit table
DROP TRIGGER IF EXISTS grade_before_update//
CREATE TRIGGER grade_before_update
BEFORE UPDATE ON grade 
FOR EACH ROW 
BEGIN 
    INSERT INTO grade_audit
        (grade_id,
         letter,
         enrollment_id,
         type,
         created,
         created_userid,
         updated,
         updated_userid,
         audit_userid,
         audit_action)
    VALUES
        (OLD.id,
         OLD.letter,
         OLD.enrollment_id,
         OLD.type,
         OLD.created,
         OLD.created_userid,
         OLD.updated,
         OLD.updated_userid,
         SUBSTRING_INDEX(CURRENT_USER(), '@', 1),
        'UPDATE');
END // 

-- delete trigger on grade table to populate the audit table
DROP TRIGGER IF EXISTS grade_before_delete//
CREATE TRIGGER grade_before_delete
BEFORE DELETE ON grade 
FOR EACH ROW 
BEGIN 
    INSERT INTO grade_audit
        (grade_id,
         letter,
         enrollment_id,
         type,
         created,
         created_userid,
         updated,
         updated_userid,
         audit_userid,
         audit_action)
    VALUES
        (OLD.id,
         OLD.letter,
         OLD.enrollment_id,
         OLD.type,
         OLD.created,
         OLD.created_userid,
         OLD.updated,
         OLD.updated_userid,
         SUBSTRING_INDEX(CURRENT_USER(), '@', 1), 
         'DELETE');
END // 

DELIMITER ;
