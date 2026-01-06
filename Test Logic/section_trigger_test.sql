
-- INSERT test - should populate created_userid via trigger
INSERT INTO section (semester_id, course_id, instructor_id, dow, start_time, end_time, created_userid, updated_userid)
VALUES (1, 1, 1, 'mwf', '09:00:00', '10:30:00', 1, 1);

SET @section_id = (SELECT id FROM section ORDER BY id DESC LIMIT 1);

-- Verify the insert and check created_userid was set by trigger
SELECT * 
FROM section 
WHERE id = @section_id
ORDER BY id DESC LIMIT 1;

-- UPDATE test - should populate updated_userid via trigger
UPDATE section 
SET end_time = '11:30:00'
WHERE id = @section_id;

-- Verify the update and check updated_userid was set by trigger
SELECT * 
FROM section 
WHERE id = @section_id
ORDER BY id DESC LIMIT 1;

-- DELETE test - before deleting, note the ID
SET @section_id = (SELECT id FROM section WHERE semester_id = 1 AND course_id = 1 AND dow = 'MWF' ORDER BY id DESC LIMIT 1);

DELETE FROM section 
WHERE id = @section_id;

-- Verify the delete
SELECT *
FROM section 
WHERE id = @section_id
ORDER BY id DESC LIMIT 1;

SELECT * FROM section_audit;




