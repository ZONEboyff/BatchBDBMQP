1)Total Number of Students with GPA Less than 7.0
SELECT COUNT(*) AS average_gpa_students FROM student WHERE gpa < 7.0;

2)Find the total number of colleges located in the state of Karnataka.
SELECT COUNT(*) AS total_colleges_karnataka FROM college WHERE state = 'Karnataka';

3)Total Enrollment Across All Colleges
SELECT SUM(enrollment) AS total_enrollment_all FROM college;

4)Retrieve the count of students whose GPA is between 7.0 and 9.0.
SELECT COUNT(*) AS high_gpa_students FROM student WHERE gpa BETWEEN 7.0 AND 9.0;

5)Count the total number of applicants for the Electrical major.
SELECT COUNT(*) AS electrical_applicants FROM apply WHERE major = 'Electrical';

6)Find the total number of distinct grades obtained by students.
SELECT COUNT(DISTINCT grade) AS distinct_grades FROM taken;

7)Retrieve the count of courses that have more than 3 credits.
SELECT COUNT(*) AS courses_above_3_credits FROM course WHERE credits > 3;

8)Count the total number of books published by Cengage Learning.
SELECT COUNT(*) AS cengage_books FROM textbook WHERE publisher = 'Cengage Learning';

9)Count the total number of students who attended high schools with a size greater than 20,000.
SELECT COUNT(*) AS large_sizehs_students FROM student WHERE sizehs > 20000;

10)Find the total number of courses offered in the Humanities department.
SELECT COUNT(*) AS total_humanities_courses FROM course WHERE dept_name = 'Humanities';





1) Find the total number of students in the database.
SELECT COUNT(*) AS total_students FROM student;


2) Find the total number of college in 'GOA' state.
SELECT COUNT(*) AS total_colleges_goa FROM college WHERE state = 'Goa';


3) Find the total number of college in 'GOA' state with enrollment greater than 1000.
SELECT COUNT(*) AS colleges_goa_enrollment_gt_1000 FROM college WHERE state = 'Goa' AND enrollment > 1000;


4) Retrieve the number of students with GPA> 3.6
SELECT COUNT(*) AS students_with_decent_gpa FROM student WHERE gpa > 3.6;


5)Retrieve the total number of applicants for CS major
SELECT COUNT(*) AS total_cs_applicants FROM apply WHERE major = 'Computer Science';


6) Find the maximum grade, minimum grade obtained by any student in the db
SELECT MAX(grade) AS min_grade, MIN(grade) AS max_grade FROM taken;


7) Retrieve the total number of books prescribed for the course titled 'DBMPQ'
SELECT COUNT(*) AS total_books_dbmpq FROM book_adoption WHERE courseid = (SELECT courseid FROM course WHERE title = 'DBMPQ');


8) Retrieve the maximum and the minimum grade obtained for the course 'DBMPQ'.
SELECT MAX(grade) AS min_grade_dbmpq, MIN(grade) AS max_grade_dbmpq FROM taken WHERE courseid = (SELECT courseid FROM course WHERE title = 'DBMPQ');


9)Find the total number of credits completed by the student AAA
SELECT SUM(c.credits) AS total_credits_completed FROM taken t JOIN course c ON t.courseid = c.courseid WHERE t.sid = (SELECT sid FROM student WHERE sname = 'AAA');


10)Find out the count of courses which are offered by the institute but not taken by any student
SELECT COUNT(*) AS courses_not_taken FROM course WHERE courseid NOT IN (SELECT DISTINCT courseid FROM taken);

ALTER TABLE student
ADD birthday DATE;
UPDATE student SET birthday = '2001-05-20' WHERE sid = 1;
UPDATE student SET birthday = '2002-06-15' WHERE sid = 2;
UPDATE student SET birthday = '2001-09-10' WHERE sid = 3;
UPDATE student SET birthday = '2002-01-22' WHERE sid = 4;
UPDATE student SET birthday = '2003-11-30' WHERE sid = 5;
UPDATE student SET birthday = '2001-03-14' WHERE sid = 6;
UPDATE student SET birthday = '2002-07-25' WHERE sid = 7;
UPDATE student SET birthday = '2003-08-08' WHERE sid = 8;
UPDATE student SET birthday = '2001-12-01' WHERE sid = 9;
UPDATE student SET birthday = '2003-02-10' WHERE sid = 10;
UPDATE student SET birthday = '2004-04-18' WHERE sid = 11;
UPDATE student SET birthday = '2002-10-05' WHERE sid = 12;
UPDATE student SET birthday = '2001-07-11' WHERE sid = 13;


11) Retrieve the number of students who were born in December.
SELECT COUNT(*) AS birthday_in_December FROM student WHERE MONTH(birthday)=12;

12) Find the total enrolment in the state of GOA
SELECT SUM(enrollment) AS total_enrollment_goa FROM college WHERE state = 'Goa';


13) Find the total and average credits for the "CS" dept.
SELECT SUM(credits) AS total_credits_cs, AVG(credits) AS average_credits_cs FROM course WHERE dept_name = 'Computer';

14) Find out the number of books authored by "Korth".
SELECT COUNT(*) AS total_books_korth FROM textbook WHERE author = 'Korth';


15) Find out the total number of courses offered by the "CS" department
SELECT COUNT(*) AS total_cs_courses FROM course WHERE dept_name = 'Computer';




