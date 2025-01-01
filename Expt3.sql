SELECT sid,sname,gpa 
FROM student
WHERE gpa>3.6;

SELECT sname,major FROM student JOIN apply ON student.sid = apply.sid;

INSERT INTO student (sid, sname, gpa, sizehs) VALUES
(11, 'Darron', 5.6, 900),
(12, 'Sameer', 8.7, 400),
(13, 'Sarah', 9.4, 800);

INSERT INTO apply (sid, cname, major, decision) VALUES
(11, 'Stanford', 'Computer Science', 'NO'),
(12, 'KALE', 'Electrical', 'YES'),
(11, 'Stanford', 'Electrical', 'YES'),
(13, 'Stanford', 'Computer Science', 'YES');

SELECT sname,gpa,decision FROM student JOIN apply ON student.sid = apply.sid WHERE cname='Stanford' AND sizehs<1000 ;

SELECT cname FROM student JOIN apply ON student.sid = apply.sid WHERE major='Computer Science' AND sizehs>=20000 ;

SELECT *
FROM college
JOIN apply ON college.cname = apply.cname
JOIN student ON apply.sid = student.sid
ORDER BY gpa DESC,enrollment ASC;

SELECT sname,gpa,college.cname,enrollment FROM college JOIN apply ON college.cname = apply.cname JOIN student ON apply.sid = student.sid ORDER BY gpa DESC,enrollment ASC;

SELECT *
FROM students
CROSS JOIN college;

INSERT INTO apply (sid, cname, major, decision) VALUES
(9, 'Stanford', 'Biology', 'NO'),
(10, 'Stanford', 'Bioscience', 'YES');

SELECT student.sname
FROM student
JOIN apply ON student.sid = apply.sid
WHERE apply.major LIKE 'Bio%';

SELECT apply.cname,apply.major
FROM college
JOIN apply ON college.cname = apply.cname;

INSERT INTO apply (sid, cname, major, decision) VALUES
(5, 'MIT', 'Computer Science', 'NO'),
(9, 'MIT', 'Electrical', 'YES'),
(10, 'MIT', 'Electrical', 'YES'),
(2, 'MIT', 'Computer Science', 'YES');

SELECT sname FROM student JOIN apply ON student.sid = apply.sid WHERE cname='MIT' AND decision='yes' AND major='Computer Science';

-- Database Management Systems (DBMS)
INSERT INTO textbook (book_isbn, book_title, author, publisher) VALUES
(113, 'Advanced DB Systems', 'Raghu Ramakrishnan', 'McGraw-Hill'),
(114, 'Database Concepts', 'Abraham Silberschatz', 'McGraw-Hill'),
(115, 'Fundamentals of DBMS', 'Ramez Elmasri', 'Pearson');

-- Computer Science (CS)
INSERT INTO textbook (book_isbn, book_title, author, publisher) VALUES
(116, 'Introduction to Algorithms', 'Thomas H. Cormen', 'MIT Press'),
(117, 'AI: A Modern Approach', 'Stuart Russell', 'Pearson'),
(118, 'Computer Networks', 'Andrew S. Tanenbaum', 'Pearson'),
(119, 'Operating Systems', 'Abraham Silberschatz', 'Wiley');

-- Mathematics
INSERT INTO textbook (book_isbn, book_title, author, publisher) VALUES
(120, 'Calculus: Early Transc.', 'James Stewart', 'Cengage Learning'),
(121, 'Linear Algebra', 'Gilbert Strang', 'Cengage Learning'),
(122, 'Discrete Math & Appl.', 'Kenneth H. Rosen', 'McGraw-Hill');

-- Physics
INSERT INTO textbook (book_isbn, book_title, author, publisher) VALUES
(123, 'Physics for Scientists', 'Raymond A. Serway', 'Cengage Learning'),
(124, 'Fundamentals of Physics', 'David Halliday', 'Wiley'),
(125, 'Feynman Lectures', 'Richard P. Feynman', 'Addison-Wesley');

-- History
INSERT INTO textbook (book_isbn, book_title, author, publisher) VALUES
(126, 'History of Western Soc.', 'John P. McKay', 'Bedford/St. Martin\'s'),
(127, 'Guns, Germs, & Steel', 'Jared Diamond', 'W.W. Norton & Co.'),
(128, 'Ancient World History', 'Susan Wise Bauer', 'W.W. Norton & Co.');

-- Assign books to DBMPQ course
INSERT INTO book_adoption (book_isbn, courseid) VALUES
(113, 1),  -- Advanced DB Systems
(114, 1),  -- Database Concepts
(115, 1);  -- Fundamentals of DBMS

-- Assign books to CS112 course
INSERT INTO book_adoption (book_isbn, courseid) VALUES
(116, 2),  -- Introduction to Algorithms
(117, 2),  -- AI: A Modern Approach
(118, 2),  -- Computer Networks
(119, 2);  -- Operating Systems

-- Assign books to MATH101 course
INSERT INTO book_adoption (book_isbn, courseid) VALUES
(120, 3),  -- Calculus: Early Transc.
(121, 3),  -- Linear Algebra
(122, 3);  -- Discrete Math & Appl.

-- Assign books to PHYS101 course
INSERT INTO book_adoption (book_isbn, courseid) VALUES
(123, 4),  -- Physics for Scientists
(124, 4),  -- Fundamentals of Physics
(125, 4);  -- Feynman Lectures

-- Assign books to HIST201 course
INSERT INTO book_adoption (book_isbn, courseid) VALUES
(126, 5),  -- History of Western Soc.
(127, 5),  -- Guns, Germs, & Steel
(128, 5);  -- Ancient World History

SELECT book_title
FROM textbook
JOIN book_adoption ON textbook.book_isbn = book_adoption.book_isbn
JOIN course ON book_adoption.courseid = course.courseid
WHERE title='DBMPQ';

SELECT book_title
FROM textbook
JOIN book_adoption ON textbook.book_isbn = book_adoption.book_isbn
JOIN course ON book_adoption.courseid = course.courseid
WHERE dept_name='Computer';

-- Pratik (sid = 1)
INSERT INTO taken (sid, courseid, grade) VALUES
(1, 2, 'A'), -- CS112
(1, 3, 'B'); -- MATH101

-- Anjali (sid = 2)
INSERT INTO taken (sid, courseid, grade) VALUES
(2, 4, 'A'), -- PHYS101
(2, 5, 'B'); -- HIST201

-- Rahul (sid = 3)
INSERT INTO taken (sid, courseid, grade) VALUES
(3, 1, 'C'), -- DBMPQ
(3, 4, 'B'); -- PHYS101

-- Sneha (sid = 4)
INSERT INTO taken (sid, courseid, grade) VALUES
(4, 2, 'A'), -- CS112
(4, 3, 'A'); -- MATH101

-- Ravi (sid = 5)
INSERT INTO taken (sid, courseid, grade) VALUES
(5, 1, 'D'), -- DBMPQ
(5, 5, 'C'); -- HIST201

-- Bhola (sid = 6)
INSERT INTO taken (sid, courseid, grade) VALUES
(6, 3, 'B'), -- MATH101
(6, 4, 'A'); -- PHYS101

-- Vikram (sid = 7)
INSERT INTO taken (sid, courseid, grade) VALUES
(7, 2, 'B'), -- CS112
(7, 5, 'A'); -- HIST201

-- Chatur (sid = 8)
INSERT INTO taken (sid, courseid, grade) VALUES
(8, 1, 'C'), -- DBMPQ
(8, 3, 'D'); -- MATH101

-- Sahil (sid = 9)
INSERT INTO taken (sid, courseid, grade) VALUES
(9, 2, 'B'), -- CS112
(9, 4, 'C'); -- PHYS101

-- Ritika (sid = 10)
INSERT INTO taken (sid, courseid, grade) VALUES
(10, 3, 'A'), -- MATH101
(10, 5, 'B'); -- HIST201

INSERT INTO taken (sid, courseid) VALUES
(11, 4); -- PHYS101

-- Sameer (sid = 12)
INSERT INTO taken (sid, courseid) VALUES
(12, 2); -- CS112

-- Sarah (sid = 13)
INSERT INTO taken (sid, courseid) VALUES
(13, 3); -- MATH101

SELECT student.sname
FROM student
JOIN taken ON student.sid = taken.sid
WHERE taken.grade = 'AA';

SELECT student.sname,course.title,grade
FROM student
JOIN taken ON student.sid = taken.sid
JOIN course ON taken.courseid = course.courseid;

SELECT course.title AS course_title, textbook.book_title
FROM course
JOIN book_adoption ON course.courseid = book_adoption.courseid
JOIN textbook ON book_adoption.book_isbn = textbook.book_isbn
WHERE course.title = textbook.book_title;



