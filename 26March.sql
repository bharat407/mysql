use dac_dbt;
-- Execute the following query based on the Database created in section -1
-- 1. List the name, employee code and designationcode of each employee of the office
select empname,empcode,desigcode from emp;
-- 2. List all the departments and the budgets
select deptname,budget from dept;
-- 3. List the employees and their respective department names
select empcode,empname,deptname from emp,dept where emp.deptcode = dept.deptcode;
-- 4. List the employees who are not having any superior to work under
select empcode,empname from emp where supcode is null; 
-- 5. List the employees who are working directly under superior most employee of the
-- office. (Assume the superior most employee is the employee who does not have a
-- supervisor)
select empcode,empname from emp where supcode=(select empcode from emp where supcode is null);
-- 6. List the employee(s) who is senior most in the office.
select empcode,empname from emp where supcode is null; 
-- 7. List the employees who will retire from the office next.
select empcode,empname from emp where birthdate=(select min(birthdate) from emp);
-- 8. List the departments with the respective department managers
select empname as department_manager,deptname from emp,dept where emp.deptcode= dept.deptcode and emp.desigcode in (select desigcode from emp where desigcode =(select desigcode from desig where designame ='Manager')); 
-- 9. List the number of employees working for either ‘accounts’ or ‘personal’ or
-- ‘purchase’ departments
select count(*) as Total_employees from emp where  deptcode in (select deptcode from dept where deptname in ('Accounts','Personal','Purchase'));
select count(*) as Total_employees from emp join dept on emp.deptcode=dept.deptcode where dept.deptname in ('Accounts','Personal','Purchase');
-- 10. List the employees working for ‘accounts’ or ‘personal’ department
select empname,empcode from emp where  deptcode in (select deptcode from dept where deptname in ('Accounts','Personal'));
select  empname,empcode from emp join dept on emp.deptcode=dept.deptcode where dept.deptname in ('Accounts','Personal');
-- 11. List the employees working for ‘accounts’ and ‘personal’ department
select empname,empcode from emp where  deptcode in (select deptcode from dept where deptname in ('Accounts','Personal'));
select  empname,empcode from emp join dept on emp.deptcode=dept.deptcode where dept.deptname in ('Accounts','Personal');
-- 12. List the employees working for ‘accounts’ but not for ‘personal’ department
select  empname,empcode from emp join dept on emp.deptcode=dept.deptcode where dept.deptname in ('Accounts') and emp.empname not in (select empname from emp join dept on emp.deptcode= dept.deptcode where dept.deptname in ('Persoanl'));
-- 13. List the youngest employee of the office
select empcode,empname,birthdate from emp order by birthdate desc;
-- 14. List the employees who are drawing basic pay not equal to 12400.
select empcode,empname from emp where not (basicpay = 12400);
-- 15. List the employees who are drawing basic salary between 11000 and 12000.
select empcode,empname from emp where basicpay between 11000 and 12000 ;
-- 16. List the employees who are drawing basic salary not between 11000 and 12000
select empcode,empname from emp where basicpay not between 11000 and 12000 ;
-- 17. List the employees who got salary allowance between Rs.1000 to Rs.1500 in the
-- month of January 2012.
select empcode,empname from emp where empcode in (
select empcode from salary where allow between 1000 and 1500);
-- 18. List the employees whose name ends with ‘i’ or ‘y’.
select empcode,empname from emp where (empname)like '%i' or (empname) like '%y' ;
-- 19. List the employees who have atleast 25 years of experience
select empname,timestampdiff(year,joindate,curdate()) as experience  from emp where timestampdiff(year,joindate,curdate()) >=20;
-- 20. List the ‘Salesmen’ who have minimum 20 to 30 years of experience
select empname,desigcode,timestampdiff(year,joindate,curdate()) as experience  from emp where timestampdiff(year,joindate,curdate()) between 20 and 30 and joindate in
(select joindate from emp where desigcode=
(select desigcode from desig where designame='Sales Man'));
-- 21. List the basic salary and half of the basic salary for each employee.
select emp.empcode,empname,basic,basic/2 as half_basic from emp,salary where emp.empcode = salary.empcode; 
-- 22. List the employees and the latest take-home-pay of each employee. (Hint: Take-
-- home-pay = basic + allowance - deductions)
select empname,(basic + allow - deduct) as TakeHomeAway from salary,emp where emp.empcode = salary.empcode;
-- 23. List the employees and the latest take-home-pay of each employee of ‘Accounts’
-- department.
select empname,deptcode,(basic + allow - deduct) as TakeHomeAway from salary,emp where emp.empcode = salary.empcode and emp.deptcode in(select deptcode from dept where deptname='Accounts');
-- 24. List employees and their respective ages.
select empname,timestampdiff(year,birthdate,curdate()) as age 
from emp order by age desc;
-- 25. List all the ‘Accounts’ department employees, first ordered by their age and then
-- by their names.
select empcode,empname from emp where emp.deptcode in(select deptcode from dept where deptname = 'Accounts') order by  timestampdiff(year,birthdate,curdate())desc;
-- 26. List the number of employees directly reporting to ‘Reddy’
select count(*) from emp 
where supcode=
(select empcode from emp where empname='Reddy');
-- 27. List the employees who have at least one person working under him/her and the
-- number of their subordinates. 
-- List the employee with highest number of
-- subordinates first, next the person with next highest number of subordinates and
-- so on.
select empcode,empname,count(emp.supcode) as count from emp group by empcode,empname having count(emp.supcode)>=1 order by count(emp.supcode) asc;
-- 28. List the employees who have minimum 3 employees working under him/her.

-- 29. List the minimum and maximum salaries drawn in each grade code.
-- 30. List the employees with names of their supervisors (Hint: Use Join).
-- 31. List the number of officers reporting to each supervisor having more than 3
-- people working under them
-- 32. List the employees who have not got any promotion till now.
-- 33. List the employee with maximum number of promotions. Also list the number of
-- promotions that he/she got.
-- 34. List the employees who got promoted in the year 1991.
-- 35. List the department budget and the total salary drawn (by the employees of this
-- department).
-- 36. Display the employee names in full uppercase.
-- 37. List all the employees drawing salary higher than the salary drawn by ‘Jain’
-- 38. List all the employees who have higher salary than all the employees who draw
-- salary in the range of 11000 to 12000.
-- 39. List all the employees who have greater than average pay. Display the result in the
-- increasing order of the salary.
-- 40. List the employees who draws highest salary
-- 41. List all the employees other than the employees who draw highest salary
-- 42. List the employees who draw highest salary in each department
-- 43. List the employee(s) getting second highest salary
-- 44. List the employee(s) who are getting fifth highest salary.
-- 45. List the department name of the female employee who draws the highest salary
-- higher than any other female employee
-- 46. List all male employees who draw salary greater than at least on female employee
-- 47. List the departments in which average salary of employees is more than average
-- salary of the company
-- 48. List the employees drawing salary lesser than the average salary of employees
-- working for ‘accounts’ department