DELIMITER // 

-- The following trigger generates a user's username and campus email upon insertion into the user table
DROP TRIGGER IF EXISTS insert_user_username//
CREATE TRIGGER insert_user_username
	BEFORE INSERT ON user 
	FOR EACH ROW 
BEGIN 
	DECLARE base_username  VARCHAR(8);	
    DECLARE previous_username  INT;  
    DECLARE username_end  INT;
    DECLARE username_end_str  VARCHAR(3);
    DECLARE done  TINYINT DEFAULT 0;
    
    -- continue handler if no rows are found when seraching for usernames in the database are like the base username
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    -- checks to see if the last name has less than 4 characters  
    IF LENGTH(NEW.last_name) < 4 THEN
		SET base_username = LOWER(CONCAT(LEFT(NEW.first_name, 2), NEW.last_name));				-- joins the first 2 letters of first name and the full last name and sets it to lowercase 
        
    ELSE
		SET base_username = LOWER(CONCAT(LEFT(NEW.first_name, 2), LEFT(NEW.last_name, 4)));		-- joins the first 2 letters of first name and first 4 letters in the last name and sets it to lowercase 
        
	END IF;
    
    -- looks for usernames in the database with the same base and orders it by the highest number
    SET done = 0;
    SELECT MAX(CAST(SUBSTRING(username, LENGTH(base_username) + 1) AS UNSIGNED))
    INTO previous_username
    FROM user
    WHERE username LIKE CONCAT(base_username, '%');


    
    IF done = 1 OR previous_username IS NULL THEN												-- if no rows are found, set the variable to 1
		SET username_end = 1;
	ELSE 																						-- else add 1 to the highest username found in the database
		SET username_end = previous_username + 1;
	END IF;
    
    SET username_end_str = RIGHT(CONCAT('00', username_end), 2);								-- ensures that single digit numbers have a 0 before it and converts the last 2 digits into a string
    SET NEW.username = CONCAT(base_username, username_end_str);									-- adds the 2 digits to the base username 
    SET NEW.campus_email = CONCAT(NEW.username, '@wsc.edu');									-- adds the email portion to the generated username 
    
END// 
DELIMITER ;
