-- 1) Count of courses offered by the institute but not taken by any student.
SELECT COUNT(*)
FROM course 
WHERE courseid NOT IN (SELECT DISTINCT courseid FROM taken);

-- 2) Retrieve the titles of books not adopted by any course.
SELECT book_title
FROM textbook 
where book_isbn NOT IN (SELECT DISTINCT book_isbn from book_adoption);

-- 3) Course with the maximum number of 'AA' grades.
SELECT c.title, COUNT(t.grade) AS AA_count
FROM taken t
JOIN course c ON t.courseid = c.courseid
WHERE t.grade = 'AA'
GROUP BY c.title
HAVING COUNT(t.grade) = (
    SELECT MAX(AA_count)
    FROM (
        SELECT COUNT(t2.grade) AS AA_count
        FROM taken t2
        WHERE t2.grade = 'AA'
        GROUP BY t2.courseid
    ) AS grade_counts
);


-- 4) Course with the maximum number of books prescribed.
SELECT c.title, COUNT(b.book_isbn) AS book_count
FROM course c
JOIN book_adoption b ON c.courseid = b.courseid
GROUP BY c.title
HAVING COUNT(b.book_isbn) = (
    SELECT MAX(book_count)
    FROM (
        SELECT COUNT(b2.book_isbn) AS book_count
        FROM book_adoption b2
        GROUP BY b2.courseid
    ) AS book_counts
);


-- 5) Department with the highest average credits.
SELECT dept_name, AVG(credits) AS avg_credits
FROM course
GROUP BY dept_name
HAVING AVG(credits) = (
    SELECT MAX(avg_credits)
    FROM (
        SELECT AVG(credits) AS avg_credits
        FROM course
        GROUP BY dept_name
    ) AS avg_credits_per_dept
);

-- 6) Student who has applied to the maximum number of colleges and the decision is "yes" in all cases.
SELECT s.sname, COUNT(a.cname) AS colleges_applied
FROM student s
JOIN apply a ON s.sid = a.sid
WHERE a.decision = 'yes'
GROUP BY s.sname
HAVING COUNT(a.cname) = (
    SELECT MAX(colleges_applied)
    FROM (
        SELECT COUNT(a2.cname) AS colleges_applied
        FROM apply a2
        WHERE a2.decision = 'yes'
        GROUP BY a2.sid
    ) AS colleges_count
);


-- 7) Student with the maximum GPA.
SELECT sname, gpa
FROM student
WHERE gpa = (
    SELECT MAX(gpa)
    FROM student
);

-- 8) Student who has applied to all colleges in the state 'Goa'.
SELECT s.sname
FROM student s
JOIN apply a ON s.sid = a.sid
JOIN college c ON a.cname = c.cname
WHERE c.state = 'Goa'
GROUP BY s.sname
HAVING COUNT(DISTINCT c.cname) = (SELECT COUNT(DISTINCT cname) FROM college WHERE state = 'Goa');

-- 9) Student who has the same grades in all common subjects as 'John Smith'.
SELECT distinct s2.sname
FROM student s1
JOIN taken t1 ON s1.sid = t1.sid
JOIN taken t2 ON t1.courseid = t2.courseid AND t1.grade=t2.grade
JOIN student s2 ON s2.sid=t2.sid
WHERE s1.sname = 'John Smith'
AND s2.sid!=s1.sid;


--10) For each course, find the student with the maximum grade.
SELECT c.title, s.sname, t.grade
FROM taken t
JOIN course c ON t.courseid = c.courseid
JOIN student s ON t.sid = s.sid
WHERE (t.courseid, t.grade) IN (
    SELECT courseid, MAX(grade)
    FROM taken
    GROUP BY courseid
);









































-- 1) Find the student(s) with the second highest GPA.
SELECT sname, gpa
FROM student
WHERE gpa = (
    SELECT MAX(gpa)
    FROM student
    WHERE gpa < (SELECT MAX(gpa) FROM student)
);

-- 2) List the students who have taken the most courses.
SELECT sname
FROM student
WHERE sid IN (
    SELECT sid
    FROM taken
    GROUP BY sid
    HAVING COUNT(courseid) = (
        SELECT MAX(course_count)
        FROM (
            SELECT COUNT(courseid) AS course_count
            FROM taken
            GROUP BY sid
        ) AS counts
    )
);


-- 3) Find the college(s) with the least number of students applying.
SELECT cname
FROM college
WHERE cname IN (
    SELECT cname
    FROM apply
    GROUP BY cname
    HAVING COUNT(sid) = (
        SELECT MIN(apply_count)
        FROM (
            SELECT COUNT(sid) AS apply_count
            FROM apply
            GROUP BY cname
        ) AS counts
    )
);


-- 4) Find the student(s) who have not applied to any college.
SELECT sname
FROM student
WHERE sid NOT IN (
    SELECT sid
    FROM apply
);


-- 5) Find courses that have at least one book prescribed but haven't been taken by any student.
SELECT title
FROM course
WHERE courseid IN (
    SELECT courseid
    FROM book_adoption
) AND courseid NOT IN (
    SELECT courseid
    FROM taken
);


-- 6) Find the student(s) with the most 'A' grades.
SELECT sname
FROM student
WHERE sid IN (
    SELECT sid
    FROM taken
    WHERE grade = 'A'
    GROUP BY sid
    HAVING COUNT(grade) = (
        SELECT MAX(a_count)
        FROM (
            SELECT COUNT(grade) AS a_count
            FROM taken
            WHERE grade = 'A'
            GROUP BY sid
        ) AS grade_counts
    )
);


-- 7) Find the course(s) that have been taken by the most students.
SELECT title
FROM course
WHERE courseid IN (
    SELECT courseid
    FROM taken
    GROUP BY courseid
    HAVING COUNT(sid) = (
        SELECT MAX(student_count)
        FROM (
            SELECT COUNT(sid) AS student_count
            FROM taken
            GROUP BY courseid
        ) AS course_counts
    )
);


-- 8) Find the department with the least average GPA among students who have taken courses from that department.
SELECT dept_name
FROM course
WHERE dept_name IN (
    SELECT dept_name
    FROM course c
    JOIN taken t ON c.courseid = t.courseid
    JOIN student s ON t.sid = s.sid
    GROUP BY dept_name
    HAVING AVG(s.gpa) = (
        SELECT MIN(avg_gpa)
        FROM (
            SELECT dept_name, AVG(s.gpa) AS avg_gpa
            FROM course c
            JOIN taken t ON c.courseid = t.courseid
            JOIN student s ON t.sid = s.sid
            GROUP BY dept_name
        ) AS gpa_counts
    )
);


-- 9) List the colleges that have at least one student with a GPA higher than 9.0 applying to them.
SELECT cname
FROM college
WHERE cname IN (
    SELECT cname
    FROM apply a
    JOIN student s ON a.sid = s.sid
    WHERE s.gpa > 9.0
);


-- 10) Find the student(s) who have taken every course offered by their department.
SELECT sname
FROM student s
WHERE NOT EXISTS (
    SELECT c.courseid
    FROM course c
    WHERE c.dept_name = (
        SELECT dept_name
        FROM course c2
        JOIN taken t ON c2.courseid = t.courseid
        WHERE t.sid = s.sid
        LIMIT 1
    ) AND c.courseid NOT IN (
        SELECT t.courseid
        FROM taken t
        WHERE t.sid = s.sid
    )
);

