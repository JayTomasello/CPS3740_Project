-- Lab 1
CREATE VIEW vLab1_tomaselj AS
SELECT * FROM dreamhome.Room WHERE type IN ('double', 'family') AND price < 50 ORDER BY price ASC;

-- Lab 2
-- Question 1
select fname, salary, sex from dreamhome.Staff
    where branchno = (select branchno from dreamhome.Branch
        where city!='London');

-- Question 3
CREATE VIEW vLab2_tomaselj AS
SELECT b.city, count(b.city) AS count, max(s.salary) AS max_salary, min(s.salary) min_salary
    FROM dreamhome.Staff s, dreamhome.Branch b
    WHERE s.branchNo = b.branchNo
    GROUP BY s.branchNo
    ORDER BY count ASC;

-- Lab 3
SELECT b.city, CONCAT(s.fname,' ',s.lname) AS name, MAX(s.salary) AS salary
    FROM dreamhome.Staff s, dreamhome.Branch b
    WHERE s.branchNo = b.branchNo
    GROUP BY b.city
    HAVING salary = MAX(salary)
    ORDER BY salary ASC;

SELECT b.city, CONCAT(s.fname,' ',s.lname) AS name, MAX(s.salary) AS salary
    FROM dreamhome.Staff s, dreamhome.Branch b
    WHERE s.branchNo = b.branchNo
    GROUP BY s.branchNo, b.city
    HAVING salary = MAX(salary)
    ORDER BY salary ASC;

SELECT b.city, CONCAT(s.fname,' ', s.lname) AS name, s.salary
    FROM dreamhome.Staff s, dreamhome.Branch b
    WHERE s.branchNo = b.branchNo AND s.salary IN (SELECT MAX(salary) FROM Staff GROUP BY branchNo)
    GROUP BY b.city
    HAVING salary = MAX(salary)
    ORDER BY salary ASC;

-- Correct?
CREATE VIEW vLab3_tomaselj AS
    SELECT b.city, CONCAT(s.fname, ' ', s.lname) AS name, s.salary
        FROM dreamhome.Staff s, dreamhome.Branch b
        WHERE s.branchNo = b.branchNo AND s.salary IN (SELECT MAX(salary) FROM dreamhome.Staff GROUP BY branchNo)
        GROUP BY b.city
        ORDER BY salary ASC;

select b.city, CONCAT(s.fname,' ', s.lname) AS name, MAX(s.salary) AS salary
    FROM dreamhome.Staff s, dreamhome.Branch b
    where (fname, salary) in 
        (select CONCAT(s.fname,' ', s.lname) AS name, MAX(s.salary) AS salary from dreamhome.Staff s);

select b.city, CONCAT(s.fname,' ', s.lname) AS name, MAX(s.salary) AS salary from dreamhome.Staff s, dreamhome.Branch b where max(s.salary) = ANY
    (select salary from Staff where branchNo='B003');

SELECT b.city, CONCAT(s.fname,' ',s.lname) AS name, MAX(s.salary) as salary
    FROM dreamhome.Staff s, dreamhome.Branch b
    WHERE s.branchNo = b.branchNo
    GROUP BY b.city
    HAVING MAX(s.salary)
    ORDER BY salary ASC;

select salary, branchNo from Staff where salary >
    (select salary from Staff where branchNo='B003');
