-- 1) Retrieve the total number of colleges in each state.
SELECT state, COUNT(*) AS total_colleges 
FROM college 
GROUP BY state;

-- 2) Find out the total number of students who applied for each major.
SELECT major, COUNT(*) AS total_applicants 
FROM apply 
GROUP BY major;

-- 3) For each college, find out how many students have applied.
SELECT cname, COUNT(DISTINCT sid) AS total_students 
FROM apply 
GROUP BY cname;

-- 4) For each student, count the number of colleges they applied to.
SELECT a.sid, s.sname, 
COUNT(DISTINCT a.cname) AS colleges_applied 
FROM apply a 
JOIN student s ON a.sid = s.sid 
GROUP BY a.sid, s.sname;

-- 5) For each college, count the number of students who have applied with a decision of 'yes'.
SELECT cname, COUNT(DISTINCT sid) AS total_students_accepted 
FROM apply 
WHERE decision = 'yes' 
GROUP BY cname;

-- 6) Find the average GPA of students who applied for each major.
SELECT major, AVG(s.gpa) AS average_gpa 
FROM apply a 
JOIN student s ON a.sid = s.sid 
GROUP BY major;

-- 7) Retrieve the number of students who have taken more than 1 course.
SELECT t.sid, s.sname, 
COUNT(t.courseid) AS courses_taken 
FROM taken t 
JOIN student s ON t.sid = s.sid 
GROUP BY t.sid, s.sname 
HAVING COUNT(t.courseid) > 1;

-- 8) For each course, retrieve the count of prescribed books.
SELECT b.courseid, c.title, COUNT(b.book_isbn) AS total_books 
FROM book_adoption b 
JOIN course c ON b.courseid = c.courseid 
GROUP BY b.courseid, c.title;

-- 9) Retrieve the total credits for each department, but only include departments with total credits greater than 5.
SELECT dept_name, SUM(credits) AS total_credits 
FROM course 
GROUP BY dept_name 
HAVING total_credits > 5;

-- 10) For each course, count the number of students who received a grade of 'D'.
SELECT t.courseid, c.title, COUNT(*) AS count_d 
FROM taken t 
JOIN course c ON t.courseid = c.courseid 
WHERE t.grade = 'D' 
GROUP BY t.courseid, c.title;

-- 1) Retrieve the state and the total number of colleges in every state.
SELECT state, COUNT(*) AS total_colleges 
FROM college 
GROUP BY state;

-- 2) Find out the total number of students applied for a major offered by a college (per major per college).
SELECT cname, major, COUNT(*) AS total_students 
FROM apply 
GROUP BY cname, major;

-- 3) For each student find out the number of colleges applied.
SELECT a.sid, s.sname, COUNT(DISTINCT a.cname) AS colleges_applied 
FROM apply a 
JOIN student s ON a.sid = s.sid 
GROUP BY a.sid, s.sname;

-- 4) For each student find out the number of colleges applied where the decision is yes.
SELECT a.sid, s.sname, COUNT(DISTINCT a.cname) AS colleges_applied_yes 
FROM apply a 
JOIN student s ON a.sid = s.sid 
WHERE a.decision = 'yes' 
GROUP BY a.sid, s.sname;

-- 5) Find the names of students who have applied to different majors in the same college.
SELECT a1.sid, s.sname 
FROM apply a1 
JOIN apply a2 ON a1.sid = a2.sid AND a1.cname = a2.cname AND a1.major <> a2.major 
JOIN student s ON a1.sid = s.sid 
GROUP BY a1.sid, s.sname;

-- 6) Find the total number of courses offered by each college.
SELECT cname, COUNT(*) AS total_courses 
FROM course 
GROUP BY cname;

-- 7) For each student, retrieve the number of courses he has taken and also the maximum and minimum grade obtained.
SELECT t.sid, s.sname, COUNT(t.courseid) AS courses_taken, MAX(t.grade) AS min_grade, MIN(t.grade) AS max_grade 
FROM taken t 
JOIN student s ON t.sid = s.sid 
GROUP BY t.sid, s.sname;

-- 8) For each course, retrieve the count of prescribed books.
SELECT b.courseid, c.title, COUNT(b.book_isbn) AS total_books 
FROM book_adoption b 
JOIN course c ON b.courseid = c.courseid 
GROUP BY b.courseid, c.title;

-- 9) What is the average GPA of students applied for 'CS' major.
SELECT AVG(s.gpa) AS average_gpa 
FROM apply a 
JOIN student s ON a.sid = s.sid 
WHERE a.major = 'Computer Science';

-- 10) For each course, count the number of students who have got grade 'AA'.
SELECT t.courseid, c.title, COUNT(*) AS count_aa 
FROM taken t 
JOIN course c ON t.courseid = c.courseid 
WHERE t.grade = 'AA' 
GROUP BY t.courseid, c.title;

-- 11) For each course retrieve the number of students.
SELECT t.courseid, c.title, COUNT(DISTINCT t.sid) AS total_students 
FROM taken t 
JOIN course c ON t.courseid = c.courseid 
GROUP BY t.courseid, c.title;

-- 12) What is the total credits for each department.
SELECT dept_name, SUM(credits) AS total_credits 
FROM course 
GROUP BY dept_name;

-- 13) Retrieve the count of books used by more than one course.
SELECT book_isbn, COUNT(DISTINCT courseid) AS course_count 
FROM book_adoption 
GROUP BY book_isbn 
HAVING course_count > 1;

-- 14) Retrieve the courses with more than 3 books prescribed.
SELECT b.courseid, c.title, COUNT(b.book_isbn) AS total_books 
FROM book_adoption b 
JOIN course c ON b.courseid = c.courseid 
GROUP BY b.courseid, c.title 
HAVING COUNT(b.book_isbn) > 3;

-- 15) Find the topper in every course.
SELECT t.courseid, c.title, s.sname, MIN(t.grade) AS topper_grade 
FROM taken t 
JOIN student s ON t.sid = s.sid 
JOIN course c ON t.courseid = c.courseid 
GROUP BY c.title;

