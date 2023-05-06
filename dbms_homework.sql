-- Homework Questions

-- Question 1 (Complete)
CREATE VIEW vHW_1_tomaselj AS
    SELECT city, COUNT(*) AS number_of_staff 
        FROM dreamhome.Staff2 s, dreamhome.Branch b 
        WHERE s.branchNo = b.branchNo 
        GROUP BY city 
        HAVING number_of_staff > 1 
        ORDER BY number_of_staff DESC;

-- Question 2 (Complete)
CREATE VIEW vHW_2_tomaselj AS
    SELECT city, COUNT(*) AS COUNT, SUM(r.price) AS cost 
        FROM dreamhome.Hotel h, dreamhome.Room r 
        WHERE h.hotelno = r.hotelno AND r.price < 70 
        GROUP BY city 
        ORDER BY cost DESC;

-- Question 3 (Complete)
CREATE VIEW vHW_3_tomaselj AS
    SELECT p.name AS Project_name, CONCAT(fname, ' ', lname) AS Staff_name, b.city AS Branch_city 
        FROM dreamhome.Project p, dreamhome.Staff2 s, dreamhome.Branch b, dreamhome.Working w
        WHERE s.branchNo = b.branchNo  
        AND s.staffNo = w.staffNo 
        AND p.pcode = w.pcode 
        GROUP BY Project_name, Staff_name 
        HAVING COUNT(w.pcode) > 1
        ORDER BY p.name DESC;

-- Question 4 (Complete)
CREATE VIEW vHW_4_tomaselj AS
    SELECT sex, CONCAT(fname, ' ', lname) AS name, TIMESTAMPDIFF(YEAR, DOB, CURDATE()) AS age, salary
        FROM dreamhome.Staff2
        WHERE sex = 'F' AND salary = (SELECT MIN(salary) FROM dreamhome.Staff2 WHERE sex = 'F')
        UNION
        SELECT sex, CONCAT(fname, ' ', lname) AS name, TIMESTAMPDIFF(YEAR, DOB, CURDATE()) AS age, salary
        FROM dreamhome.Staff2
        WHERE sex = 'M' AND salary = (SELECT MIN(salary) FROM dreamhome.Staff2 WHERE sex = 'M');

-- Question 5 (Complete)
CREATE VIEW vHW_5_tomaselj AS
    SELECT e.fname AS E_fname, e.salary AS E_salary, TIMESTAMPDIFF(YEAR, e.DOB, CURDATE()) AS E_age, 
        m.fname AS M_fname, m.salary AS M_salary, TIMESTAMPDIFF(YEAR, m.DOB, CURDATE()) AS M_age
        FROM dreamhome.Staff2 e, dreamhome.Staff2 m 
        WHERE e.superno = m.staffNo AND TIMESTAMPDIFF(YEAR, e.DOB, CURDATE()) > TIMESTAMPDIFF(YEAR, m.DOB, CURDATE()) AND e.salary < m.salary;
