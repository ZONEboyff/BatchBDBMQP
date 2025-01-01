-- 1) Write a procedure to get details of all students.
DELIMITER //

CREATE PROCEDURE GetAllStudentDetails()
BEGIN
    SELECT * FROM student;
END //

DELIMITER ;

CALL GetAllStudentDetails();

-- 2) Write a procedure which accepts 'sid' as parameter and display his details.
DELIMITER //

CREATE PROCEDURE GetOneStudentDetails(IN sid INT)
BEGIN
    SELECT * FROM student WHERE student.sid = sid;
END //

DELIMITER ;

CALL GetOneStudentDetails(3);

-- 3) Write a procedure which accepts 'cid' as parameter and display the name and no. of students who have taken that course.
DELIMITER //

CREATE PROCEDURE GetCourseDetails(IN cid INT)
BEGIN
    SELECT c.title, COUNT(t.sid) AS number_of_students 
    FROM course c 
    JOIN taken t ON c.courseid = t.courseid 
    WHERE c.courseid = cid 
    GROUP BY c.courseid;
END //

DELIMITER ;

CALL GetCourseDetails(2);

-- 4)Write a procedure which accepts sid as an input and finds the no of courses taken by the student(count). if count>5 and sizeHS >10000 then increase the GPA by 1 else if count<=5 and sizeHS <10000 then increase GPA by 0.5 and display the credits completed.
DELIMITER //

CREATE PROCEDURE UpdateGPAAndDisplayCredits(IN student_id INT)
BEGIN
    DECLARE course_count INT DEFAULT 0;
    DECLARE sizeHS INT DEFAULT 0;
    DECLARE current_gpa FLOAT(5,2);
    DECLARE completed_credits INT DEFAULT 0;

    SELECT COUNT(*) INTO course_count
    FROM taken
    WHERE sid = student_id;

    SELECT sizehs, gpa INTO sizeHS, current_gpa
    FROM student
    WHERE student.sid = student_id;

    IF course_count > 5 AND sizeHS > 10000 THEN
        SET current_gpa = current_gpa + 1;
    ELSEIF course_count <= 5 AND sizeHS < 10000 THEN
        SET current_gpa = current_gpa + 0.5;
        SELECT SUM(c.credits) AS completed_credits
        FROM course c
        JOIN taken t ON c.courseid = t.courseid
        WHERE t.sid = student_id;
    END IF;
    UPDATE student
    SET gpa = current_gpa
    WHERE sid = student_id;

    SELECT current_gpa AS 'Updated GPA';

END //

DELIMITER ;

CALL UpdateGPAAndDisplayCredits(2);

--5) Write a procedure which executes the same task as in procedure 4 but for all the students.
DELIMITER //

CREATE PROCEDURE UpdateGPAForAllStudents()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE course_count INT;
    DECLARE sizeHS INT;
    DECLARE current_gpa FLOAT(5,2);
    DECLARE student_id INT;
    
    DECLARE student_cursor CURSOR FOR SELECT sid, sizehs, gpa FROM student;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN student_cursor;

    read_loop: LOOP
        
        FETCH student_cursor INTO student_id, sizeHS, current_gpa;
        
        IF done THEN
            LEAVE read_loop;
        END IF;
        

        CALL UpdateGPAAndDisplayCredits(student_id);

    END LOOP;

    CLOSE student_cursor;

END //

DELIMITER ;

CALL UpdateGPAForAllStudents();

SELECT* FROM student;

