-- The following code is used to test that the grade_audit table populates with every INSERT, UPDATE and DELETE on the grade table

INSERT INTO grade
    (letter, enrollment_id, type, created, created_userid, updated, updated_userid)
VALUES
    ('A', 1001, 5, NOW(), 1, NOW(), 1);

UPDATE grade
SET
    letter = 'C'
WHERE id = 619;   

DELETE FROM grade
WHERE id = 619;   -- same id as above

SELECT * FROM grade_audit
ORDER BY id;



