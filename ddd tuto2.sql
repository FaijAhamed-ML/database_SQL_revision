
CREATE TABLE Department(
	deptNo int PRIMARY KEY,
	dname varchar(120),
	location varchar(256) CHECK(location IN ('Colombo','Kandy','Galle')),
	mgrID varchar(20),
	);
	
CREATE TABLE Employee (
	eid varchar(20) PRIMARY KEY,
	ename varchar(120) NOT NULL,
	salary int CHECK (salary>0),
	dept int ,
	phone varchar(15),
	);

INSERT INTO Employee (eid, ename, salary, dept, phone) VALUES
('E0001', 'Kumari', 45000, 3, '0112123456'),
('E0002', 'Anushka', 63000, 1, '0112123457'),
('E0003', 'Anura', 27000, 2, '0112123458'),
('E0004', 'Niranjala', 36000, 3, '0112123459'),
('E0005', 'Sampath', 50000, 1, '0112123450');

INSERT INTO Department (deptNo, dname, location, mgrID) VALUES
(1, 'Administration', 'Colombo', 'E0002'),
(2, 'Sales', 'Kandy', 'E0002'),
(3, 'Finance', 'Colombo', 'E0005');

ALTER TABLE Employee ADD CONSTRAINT fk_emp_dept FOREIGN KEY (dept) REFERENCES Department(deptNo);
ALTER TABLE Department ADD CONSTRAINT fk_dept_mgr FOREIGN KEY (mgrID) REFERENCES Employee(eid);

ALTER TABLE Employee ADD bdate DATE;
UPDATE Employee SET salary = 35000 WHERE ename = 'Kumari';

SELECT ename, salary FROM Employee ORDER BY ename ASC;

SELECT ename FROM Employee WHERE salary > 50000;

SELECT ename, dept FROM Employee;