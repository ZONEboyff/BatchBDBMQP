-- 1)Create 4 tables with attributes mentioned in the brackets:
--tablel(al), table2(a2), table3(a3), table4(a4,b4)
--Create a trigger on tablel to insert, delete, update tables table2, table3, table4 respectively. Whenever we insert a value in table1(al) the same value should be inserted in table2; if the number is present in table3, it should be deleted from table3 and if the number is present in table4(a4) then b4 should be updated(incremented by 1).

CREATE TABLE table1 (
    a1 INT PRIMARY KEY
);

CREATE TABLE table2 (
    a2 INT PRIMARY KEY
);

CREATE TABLE table3 (
    a3 INT PRIMARY KEY
);

CREATE TABLE table4 (
    a4 INT PRIMARY KEY,
    b4 INT DEFAULT 0
);

DELIMITER //

CREATE TRIGGER insert_into_table2
AFTER INSERT ON table1
FOR EACH ROW
BEGIN
    INSERT INTO table2 (a2) VALUES (NEW.a1);
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER delete_from_table3_if_exists
AFTER INSERT ON table1
FOR EACH ROW
BEGIN
    DELETE FROM table3 WHERE a3 = NEW.a1;
END //

DELIMITER ;


DELIMITER //

CREATE TRIGGER update_b4_in_table4
AFTER INSERT ON table1
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM table4 WHERE a4 = NEW.a1) THEN
        UPDATE table4 SET b4 = b4 + 1 WHERE a4 = NEW.a1;
    END IF;
END //

DELIMITER ;

SELECT* FROM table1;
SELECT* FROM table2;
SELECT* FROM table3;
SELECT* FROM table4;

INSERT INTO table1 (a1) VALUES (1);

SELECT* FROM table1;
SELECT* FROM table2;
SELECT* FROM table3;
SELECT* FROM table4;

--2) Create a table stud_course with student id, number of courses he has taken, the max grade he has obtained. Create another table course_stud with courseid and the no of students who have taken that course. Whenever we delete/insert an entry from the taken respective changes must be done to newly created tables.
CREATE TABLE stud_course (
    sid INT PRIMARY KEY,
    num_courses INT,
    max_grade CHAR(2)
);

CREATE TABLE course_stud (
    courseid INT PRIMARY KEY,
    num_students INT
);

INSERT INTO stud_course (sid, num_courses, max_grade)
SELECT 
    sid,
    COUNT(courseid) AS num_courses,
    MIN(grade) AS max_grade
FROM 
    taken
GROUP BY 
    sid;

INSERT INTO course_stud (courseid, num_students)
SELECT 
    courseid,
    COUNT(sid) AS num_students
FROM 
    taken
GROUP BY 
    courseid;


DELIMITER //

CREATE TRIGGER after_insert_taken
AFTER INSERT ON taken
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM stud_course WHERE sid = NEW.sid) THEN
        UPDATE stud_course
        SET 
            num_courses = num_courses + 1,
            max_grade = GREATEST(max_grade, NEW.grade)
        WHERE 
            sid = NEW.sid;
    ELSE
        INSERT INTO stud_course (sid, num_courses, max_grade)
        VALUES (NEW.sid, 1, NEW.grade);
    END IF;

    IF EXISTS (SELECT 1 FROM course_stud WHERE courseid = NEW.courseid) THEN
        UPDATE course_stud
        SET 
            num_students = num_students + 1
        WHERE 
            courseid = NEW.courseid;
    ELSE
        INSERT INTO course_stud (courseid, num_students)
        VALUES (NEW.courseid, 1);
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER after_delete_taken
AFTER DELETE ON taken
FOR EACH ROW
BEGIN
    DECLARE new_max_grade CHAR(2);

    IF EXISTS (SELECT 1 FROM stud_course WHERE sid = OLD.sid) THEN
        UPDATE stud_course
        SET num_courses = num_courses - 1
        WHERE sid = OLD.sid;

        IF (SELECT num_courses FROM stud_course WHERE sid = OLD.sid) = 0 THEN
            DELETE FROM stud_course WHERE sid = OLD.sid;
        ELSE
            
            SELECT MAX(grade) INTO new_max_grade FROM taken WHERE sid = OLD.sid;
            UPDATE stud_course
            SET max_grade = new_max_grade
            WHERE sid = OLD.sid;
        END IF;
    END IF;

    IF EXISTS (SELECT 1 FROM course_stud WHERE courseid = OLD.courseid) THEN
        UPDATE course_stud
        SET num_students = num_students - 1
        WHERE courseid = OLD.courseid;

        IF (SELECT num_students FROM course_stud WHERE courseid = OLD.courseid) = 0 THEN
            DELETE FROM course_stud WHERE courseid = OLD.courseid;
        END IF;
    END IF;
END //

DELIMITER ;

SELECT* FROM stud_course;
SELECT* FROM course_stud;

INSERT INTO taken (sid, courseid, grade) VALUES (1, 6, 'B');

SELECT* FROM stud_course;
SELECT* FROM course_stud;












