CREATE TABLE course (
    courseid INT PRIMARY KEY,
    title VARCHAR(25) NOT NULL,
    dept_name VARCHAR(20),
    credits TINYINT,
    cname VARCHAR(25)
);

INSERT INTO course (courseid, title, dept_name, credits, cname) 
VALUES (1, 'CS111', 'Computer', 3, 'GEC');

INSERT INTO course (courseid, title, dept_name, credits, cname) 
VALUES (2, 'CS112', 'Computer', 3, 'GEC');

INSERT INTO course (courseid, title, dept_name, credits, cname) 
VALUES (3, 'MATH101', 'Mathematics', 4, 'Science');

INSERT INTO course (courseid, title, dept_name, credits, cname) 
VALUES (4, 'PHYS101', 'Physics', 4, 'Science');

INSERT INTO course (courseid, title, dept_name, credits, cname) 
VALUES (5, 'HIST201', 'History', 3, 'Humanities');

CREATE TABLE taken (
    sid INT,
    courseid INT,
    grade INT,
    CONSTRAINT fk_taken_sid FOREIGN KEY (sid) REFERENCES student(sid),
    CONSTRAINT fk_taken_courseid FOREIGN KEY (courseid) REFERENCES course(courseid)
);

CREATE TABLE text (
    book_isbn INT PRIMARY KEY,
    book_title VARCHAR(25) NOT NULL,
    author VARCHAR(10)
);

CREATE TABLE book_adoption (
    book_isbn INT,
    courseid INT,
    CONSTRAINT fk_book_adoption_book_isbn FOREIGN KEY (book_isbn) REFERENCES text(book_isbn),
    CONSTRAINT fk_book_adoption_courseid FOREIGN KEY (courseid) REFERENCES course(courseid)
);

ALTER TABLE text
MODIFY COLUMN author VARCHAR(20);

ALTER TABLE text
ADD COLUMN publisher VARCHAR(20);

ALTER TABLE taken
ADD CONSTRAINT pk_taken PRIMARY KEY (sid,courseid);

ALTER TABLE book_adoption
ADD CONSTRAINT pk_book_adoption PRIMARY KEY (book_isbn, courseid);

ALTER TABLE course
ADD CONSTRAINT UNIQUE(title);

ALTER TABLE student
RENAME COLUMN sid TO roll_no;

ALTER TABLE text
RENAME TO textbook;

ALTER TABLE taken
MODIFY COLUMN grade VARCHAR(2);

ALTER TABLE taken
MODIFY COLUMN grade VARCHAR(2) DEFAULT 'AA';

ALTER TABLE student
DROP bdate;

mysqldump -u root -p DBMSPRATIK > PRATIKBACKUP

CREATE DATABASE dummydb;

/opt/lampp/bin/mysql -u root -p dummydb < PRATIKBACKUP 

DROP DATABASE dummydb;

CREATE TABLE dummystud AS SELECT* FROM student;

DELETE FROM dummystud;
desc dummystud;

DROP TABLE dummystud;

UPDATE course
SET title = 'DBMPQ'
WHERE title = 'CS111';

INSERT INTO dummystud
SELECT*
FROM student;

ALTER TABLE apply
ADD CONSTRAINT fk_apply_sid FOREIGN KEY (sid) REFERENCES student(sid);

ALTER TABLE apply
ADD CONSTRAINT fk_apply_cname FOREIGN KEY (cname) REFERENCES college(cname);




