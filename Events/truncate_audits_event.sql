DELIMITER // 

-- The following events will delete records from the section_audit and grade_audit tables that are over a month old starting Dec. 3
	
CREATE EVENT monthly_delete_grade_audit_rows 
ON SCHEDULE EVERY 1 MONTH 
STARTS '2025-12-03' 
DO BEGIN 
	DELETE FROM  grade_audit WHERE audit_timestamp < NOW() - INTERVAL 1 MONTH; 
END //

CREATE EVENT monthly_delete_section_audit_rows 
ON SCHEDULE EVERY 1 MONTH 
STARTS '2025-12-03' 
DO BEGIN 
	DELETE FROM  section_audit WHERE audit_timestamp < NOW() - INTERVAL 1 MONTH; 
END //
DELIMITER ;
