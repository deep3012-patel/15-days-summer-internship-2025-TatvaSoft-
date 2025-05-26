CREATE TABLE student (
  Firstname VARCHAR(255),
  Lastname VARCHAR(255),
  Enroll INT,
  Branch VARCHAR(50)
);
INSERT INTO student(Firstname, Lastname, Enroll, Branch)
VALUES
('Deep', 'Tailor', 02, 'IT'),
('Harsh', 'Nagdev', 04, 'IT'),
('Deven', 'Patel', 07, 'IT'),
('Renish', 'Suriya', 02, 'CSD'),
('Sarthak', 'Patel', 54, 'IOT'),
('Yash', 'Vohra', 70, 'IT'),
('Harsh', 'Ujjainiya', 44, 'CP'),
('Harsh', 'Mavani', 18, 'CSD'),
('Grishma', 'Darji', 16, 'IOT'),
('jay', 'Gorasiya', 74, 'IT'),
('Roshan', 'thummar', 56, 'CSD');

SELECT Firstname,Enroll FROM student;

SELECT * FROM student;



ALTER TABLE student ADD Department VARCHAR(255);

UPDATE student
SET Department = CASE
    WHEN Branch IN ('IOT', 'IT') THEN 'Information Technology'
    WHEN Branch IN ('CP', 'CSD') THEN 'Computer Engineering'
    ELSE Department
END;




DELETE FROM student WHERE enroll='16';
ALTER TABLE student RENAME COLUMN Branch TO Stream;

SELECT * FROM student WHERE Enroll=4;
SELECT * FROM student WHERE Enroll<30;
SELECT * FROM student WHERE Enroll<=30;
SELECT * FROM student WHERE Enroll>30;
SELECT * FROM student WHERE Enroll>=30;
SELECT * FROM student WHERE Enroll!=4;
SELECT * FROM student WHERE Firstname LIKE 'D%';
SELECT * FROM student WHERE Firstname LIKE 'Deep%';
SELECT * FROM student WHERE Firstname ILIKE 'Dee%';
SELECT * FROM student ORDER BY Enroll DESC;
SELECT * FROM student LIMIT 10;
SELECT * FROM student OFFSET 5 LIMIT 10; 


SELECT COUNT(*) FROM student;
SELECT AVG(Enroll) FROM student;
SELECT MAX(Enroll), MIN(Enroll) FROM student;

CREATE TABLE department (
  dept_id SERIAL PRIMARY KEY,
  dept_name VARCHAR(255) UNIQUE NOT NULL
);

INSERT INTO department (dept_name)
VALUES
('Information Technology'),
('Computer Engineering');

ALTER TABLE student ADD COLUMN dept_id INT;

UPDATE student
SET dept_id = CASE
    WHEN Department = 'Information Technology' THEN 1
    WHEN Department = 'Computer Engineering' THEN 2
END;

ALTER TABLE student
ADD CONSTRAINT fk_dept
FOREIGN KEY (dept_id) REFERENCES department(dept_id);


INNER JOIN
SELECT s.firstname, s.enroll, d.dept_name
FROM student s
INNER JOIN department d ON s.dept_id = d.dept_id;

LEFT JOIN
SELECT s.firstname, d.dept_name
FROM student s
LEFT JOIN department d ON s.dept_id = d.dept_id;

RIGHT JOIN
SELECT s.firstname, d.dept_name
FROM student s
RIGHT JOIN department d ON s.dept_id = d.dept_id;

IN Clause
SELECT * FROM student
WHERE Branch IN ('IT', 'CSD');

SELECT * FROM student
WHERE Branch NOT IN ('CP');

between
SELECT * FROM student
WHERE Enroll BETWEEN 10 AND 50;


like $ ilike 
SELECT * FROM student
WHERE Firstname LIKE 'H%';

SELECT * FROM student
WHERE Lastname ILIKE '%patel';

is null & is not null 
SELECT * FROM student
WHERE Department IS NULL;

SELECT * FROM student
WHERE Department IS NOT NULL;

DISTINCT, GROUP BY, HAVING
SELECT Branch, COUNT(*) FROM student
GROUP BY Branch;

SELECT Branch, COUNT(*) FROM student
GROUP BY Branch
HAVING COUNT(*) > 2;









