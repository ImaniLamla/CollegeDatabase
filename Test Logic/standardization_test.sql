-- The following code is used to test the data standardization triggers on the database

-- Tests data standardization for the letter field in the grade table
INSERT INTO grade
    (letter, enrollment_id, type, created, created_userid, updated, updated_userid)
VALUES
    ('a', 1, 7, NOW(), 1, NOW(), 1);

UPDATE grade
SET letter = 'c'
WHERE id = 621; -- from previous insert

SELECT * FROM grade_audit
ORDER BY id;


-- Tests data standardization for the dow field in the section table
INSERT INTO section (
    semester_id, course_id, instructor_id, dow, start_time, end_time, created_userid, updated_userid
) VALUES (
    1, 1, 1, 'mwf', '09:00:00', '10:15:00', 1, 1
);

SET @last_insert_id = LAST_INSERT_ID();

UPDATE section
SET dow = 'tf'
WHERE id = @last_insert_id;

SELECT * FROM section
WHERE id = @last_insert_id;


-- Tests data standardization for the term field in the semester table
INSERT INTO semester (
    term, year, created_userid, updated_userid
) VALUES (
    'fall', 2024, 1, 1
);

SET @last_insert_id = LAST_INSERT_ID();

UPDATE semester
SET term = 'spring'
WHERE id = @last_insert_id;

SELECT * FROM semester
WHERE id = @last_insert_id;
