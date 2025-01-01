
-- 1) Create a view containing the information about all students belonging to CSE department along with the various courses they have taken. check if view is updatable.
CREATE VIEW student_courses AS  
SELECT student.sid, sname, title
FROM student 
JOIN taken ON student.sid = taken.sid 
JOIN course ON taken.courseid = course.courseid
WHERE course.dept_name = 'Computer';

SELECT* FROM student_courses;

SELECT table_name,is_updatable 
FROM information_schema.views
WHERE table_name = 'student_courses'; 
--Updatable

-- 2) Create a view to store the number of students applied to each college and check if the view is updatable
CREATE VIEW number_of_students AS
SELECT cname, COUNT(sid) AS number_of_students
FROM apply
GROUP BY cname;

SELECT* FROM number_of_students;

SELECT table_name,is_updatable  
FROM information_schema.views 
WHERE table_name = 'number_of_students';
--Not updateble as aggregate functions are used;

-- 3) Create a view for every course and display the courseid, course title, credits,dept offering tha course, various textbooks used for that course, their authors and check if the view is updatable
CREATE VIEW course_and_books AS
SELECT c.courseid, c.title, c.credits, c.dept_name, t.book_title, t.author
FROM course c
JOIN book_adoption b ON c.courseid = b.courseid
JOIN textbook t ON b.book_isbn = t.book_isbn;

SELECT* FROM course_and_books;

SELECT table_name,is_updatable  
FROM information_schema.views 
WHERE table_name = 'course_and_books';

--Updatable


-- 4) Using the view created above create another view to store the no. of textbooks adopted for every course.
CREATE VIEW number_of_textbooks AS
SELECT courseid, COUNT(book_title) AS number_of_textbooks
FROM course_and_books
GROUP BY courseid;


-- 5) Using the view created in question 4 create another view to store the no. of authors per textbook.
CREATE VIEW number_of_authors_per_textbook AS
SELECT book_title, COUNT(DISTINCT author) AS number_of_authors
FROM course_and_books
GROUP BY book_title;

-- 6) Create a temporary table to store the details of colleges located at Goa along with student applied to those colleges.
CREATE TEMPORARY TABLE goa_students AS
SELECT c.cname, s.sname
FROM college c
JOIN apply a ON c.cname = a.cname
JOIN student s ON a.sid = s.sid
WHERE c.state = 'Goa';


-- 7) Using the temporary table above find the students applied to all colleges at Goa.
SELECT s.sname
FROM goa_students s
GROUP BY s.sname
HAVING COUNT(DISTINCT s.cname) = (
    SELECT COUNT(DISTINCT c.cname)
    FROM college c
    WHERE c.state = 'Goa'
);


-- 8) Using the views created above answer the following questions
--1. Find the course with maximum no. of textbooks prescribed for it.
SELECT courseid, number_of_textbooks
FROM number_of_textbooks
WHERE number_of_textbooks = (
    SELECT MAX(number_of_textbooks)
    FROM number_of_textbooks
);

--2. Find the textbook with more than two authors.
SELECT book_title, COUNT(DISTINCT author) AS number_of_authors
FROM course_and_books
GROUP BY book_title
HAVING COUNT(DISTINCT author) > 2;






