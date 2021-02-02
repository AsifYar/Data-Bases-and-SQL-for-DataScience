-- Retrieve all employees whose address is in Elgin,IL
Select * from EMPLOYEES WHERE ADDRESS LIKE '%Elgin,IL';

--Retrieve all employees who were born during the 1970's.
select * from EMPLOYEES 
WHERE B_DATE LIKE '197%'

-- Retrieve all employees in department 5 whose salary is between 60000 and 70000.

select *  from EMPLOYEES 
where (SALARY BETWEEN 60000 and 70000)  and DEP_ID = 5 ;


--Retrieve a list of employees ordered by department ID.
select *  from EMPLOYEES 
order by  DEP_ID

-- Retrieve a list of employees ordered in descending order by department ID and 
--within each department ordered alphabetically in descending order by last name.
select *  from EMPLOYEES 
order by  DEP_ID  , L_NAME desc

--For each department ID retrieve the number of employees in the department.

select DEP_ID, COUNT(*) as total
from EMPLOYEES
group by DEP_ID;

--For each department retrieve the number of employees in the department, and 
--the average employees salary in the department.

select DEP_ID, COUNT(*) as total, AVG(SALARY) as Avg_Salary
from EMPLOYEES
group by DEP_ID;

-- Label the computed columns in the result set of the previous Query
--as NUM_EMPLOYEES and AVG_SALARY.

select DEP_ID, COUNT(*) as NUM_EMPLOYEES, AVG(SALARY) as AVG_SALARY
from EMPLOYEES
group by DEP_ID;

--In previous Query order the result set by Average Salary.
select DEP_ID, COUNT(*) as NUM_EMPLOYEES, AVG(SALARY) as AVG_SALARY
from EMPLOYEES
group by DEP_ID
ORDER BY AVG_SALARY;

--In the previous Query limit the result to departments with fewer than 4 employees.

select DEP_ID, COUNT(*) as NUM_EMPLOYEES, AVG(SALARY) as AVG_SALARY
from EMPLOYEES
group by DEP_ID
Having COUNT(*) < 4
ORDER BY AVG_SALARY;

--instead of department ID use department name. Retrieve a list of employees 
--ordered by department name, and within each department ordered alphabetically 
--in descending order by last name.

select D.DEP_NAME , E.* 
from DEPARTMENTS as D, EMPLOYEES as E
where E.DEP_ID = D.DEPT_ID_DEP 
order by D.DEP_NAME, E.L_NAME desc
