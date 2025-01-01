-- 1) Create 2 users stud1, stud2 and stud3.
CREATE USER 'stud1'@'localhost' IDENTIFIED BY 'stud1444';
CREATE USER 'stud2'@'localhost' IDENTIFIED BY 'stud2444';
CREATE USER 'stud3'@'localhost' IDENTIFIED BY 'stud3444';

SELECT User, Host FROM mysql.user WHERE User = 'stud1' AND Host = 'localhost';
SELECT User, Host FROM mysql.user WHERE User = 'stud2' AND Host = 'localhost';
SELECT User, Host FROM mysql.user WHERE User = 'stud3' AND Host = 'localhost';


-- 2) Give all privileges on the view created in question 1(expt7)to stud1.
GRANT ALL PRIVILEGES ON PRATIK.student_courses TO 'stud1'@'localhost';

sudo /opt/lampp/bin/mysql -u stud1 -p

SHOW GRANTS FOR 'stud3'@'host';

-- 3) Give select and update privilege on sname and GPA attribute of student table to stud2 with grant option.
CREATE VIEW stud2_access AS
SELECT sname,gpa
FROM student;

GRANT SELECT(sname,gpa), UPDATE ON student TO 'stud2'@'localhost' WITH GRANT OPTION;

sudo /opt/lampp/bin/mysql -u stud2 -p

SHOW GRANTS FOR 'stud3'@'host';

-- 4) Let stud2 grant these privileges to stud1.

sudo /opt/lampp/bin/mysql -u stud2 -p
GRANT SELECT, UPDATE ON stud2_access TO 'stud1'@'localhost';

-- 5) Grant all privileges on all the databases on the mysql server to stud3.
GRANT ALL PRIVILEGES ON *.* TO 'stud3'@'localhost' WITH GRANT OPTION;


-- 6) Login and check the privileges.
sudo /opt/lampp/bin/mysql -u stud3 -p
SHOW GRANTS FOR 'stud3'@'host';


-- 7) Revoke the view privileges from stud1.
REVOKE ALL PRIVILEGES ON PRATIK.student_courses FROM 'stud1'@'localhost';

-- 8) Provide a list of various privileges available to the user.
SHOW PRIVILEGES;

