-- 1) Create tables
CREATE TABLE college (
  cname varchar(25) PRIMARY KEY,
  state varchar(20) NOT NULL,
  enrollment int
);

CREATE TABLE student (
  sid int PRIMARY KEY,
  sname varchar(25) NOT NULL,
  gpa float(5,2),
  sizehs int,
  bdate date
);

CREATE TABLE apply (
  sid int,
  cname varchar(25),
  major varchar(30),
  decision varchar(10),
  PRIMARY KEY (sid, cname, major)
);

-- 2) Insert data
INSERT INTO college VALUES ("PCCE", "Goa", 300);
INSERT INTO college VALUES ("DBCE", "Goa", 10500);
INSERT INTO college VALUES ("AITDE", "Goa", 200);
INSERT INTO college VALUES ("KALE", "Karnataka", 11000);

INSERT INTO student (sid, sname, gpa, sizehs, bdate) VALUES 
(1, "Pratik", 8.9, 15000, '2004-06-18'),
(2, "Anjali", 9.2, 22000, '2003-04-12'),
(3, "Rahul", 8.5, 16000, '2004-09-23'),
(4, "Sneha", 9.0, 23000, '2003-11-30'),
(5, "Ravi", 6.3, 13500, '2004-01-15'),
(6, "Bhola", 9.4, 24000, '2003-07-08'),
(7, "Vikram", 8.7, 12000, '2004-03-05'),
(8, "Chatur", 5.1, 21000, '2003-12-19'),
(9, "Sahil", 8.7, 12500, '2004-05-25'),
(10, "Ritika", 7.3, 25000, '2003-10-10');

INSERT INTO apply (sid, cname, major, decision) VALUES 
(2, "PCCE", "Electrical", "yes"),
(1, "DBCE", "Computer Science", "no"),
(3, "AITDE", "Mechanical", "yes"),
(4, "KALE", "Civil", "no"),
(5, "PCCE", "Electronics", "yes"),
(6, "DBCE", "Information Technology", "no"),
(7, "AITDE", "Chemical", "yes"),
(8, "KALE", "Aeronautical", "no"),
(9, "PCCE", "Biomedical", "yes"),
(10, "DBCE", "Environmental", "no"),
(1, "AITDE", "Electrical", "yes"),
(2, "KALE", "Computer Science", "no"),
(3, "PCCE", "Mechanical", "yes"),
(4, "DBCE", "Civil", "no"),
(5, "AITDE", "Electronics", "yes");

-- 3a) Select from college
SELECT * FROM college;

-- 3b) Select from student
SELECT * FROM student;

-- 3c) Select specific columns from student
SELECT sname, gpa FROM student;

-- 3d) Select students with GPA greater than 7.0
SELECT * FROM student WHERE gpa > 7.0;

-- 3e)
SELECT cname FROM college WHERE enrollment > 10000;

-- 3f)
SELECT cname FROM student WHERE gpa > 5.0 AND sizehs > 20000;

-- 3g)
SELECT*
FROM student 
WHERE sid IN (SELECT sid from apply where major='Computer Science');

-- 3h)
SELECT sid, cname
FROM apply
WHERE major = "Electrical" AND decision = "yes";

-- 3i)
SELECT * FROM college WHERE enrollment > 10000 AND state = "Goa";

-- 3j)
SELECT DISTINCT state FROM college;

-- 3k)
SELECT DISTINCT *
FROM student 
WHERE sid IN (SELECT sid FROM apply WHERE decision = 'no');

-- 3l)
SELECT sname
FROM student
WHERE LENGTH(sname) = 6;

-- 3m)
SELECT sname
FROM student
WHERE sname LIKE '%a';

-- 3n)
SELECT sname
FROM student
WHERE sname LIKE 'B%' OR sname LIKE 'C%';

-- 3o)
SELECT sname
FROM student
WHERE sname >= 'A' AND sname < 'D';

-- 3p)
SELECT*
FROM student
ORDER BY gpa ASC;

-- 3q)
SELECT*
FROM student
ORDER BY gpa ASC, sizehs ASC;

-- 3r)
SELECT*
FROM student
ORDER BY bdate DESC;

-- 3s)
SELECT sname
FROM student
WHERE DATEDIFF(CURRENT_DATE(),bdate)/365.25 > 20;

-- 3t)
DELETE FROM college
WHERE enrollment < 500;

-- 3u)
SELECT sname
FROM student
WHERE MONTH(bdate) = 11;


