/* Question1
*/

SELECT  e.name.title || '. ' || 
	e.name.firstName || ' ' || 
	e.name.surname || ' is living in ' || 
	e.address.city
AS 	"Employees: 'ar' and  Edinburgh"
FROM 	employee e 
WHERE 	INSTR(e.name.firstname,'ar')>0
AND 	e.address.city = 'Edinburgh';

/*question2
*/
SELECT    
    a.branch_id.branch_id AS "Branch ID",
    a.branch_id.city AS "Address",
    count(a.acc_type) AS "Number of savingsaccounts"
FROM 
    account a
WHERE
    acc_type = 'saving'
GROUP BY
    a.acc_type, a.branch_id.city, a.branch_id.branch_id
ORDER BY 
    a.branch_id.branch_id ASC;
    
/*Question3
*/
ALTER TYPE person_type
ADD MEMBER FUNCTION print_name RETURN STRING,
ADD MEMBER FUNCTION print_address RETURN STRING CASCADE; 
/

CREATE OR REPLACE TYPE BODY person_type AS 
MEMBER FUNCTION print_name RETURN STRING IS 
    BEGIN
        RETURN name.title || '. ' || name.firstname || ' ' || name.surname;
    END print_name; 

MEMBER FUNCTION print_address RETURN STRING IS 
    BEGIN
        RETURN address.street || ', ' || address.city || ', ' || address.postcode;
    END print_address; 
END; 
/ 
    

SELECT 
        c.account_number.branch_id.branch_id AS branchID, 
        c.cust_id.print_name() AS names, 
        c.account_number.balance AS balance       
    FROM ( 
        SELECT 
            c.account_number.branch_id.branch_id AS branch_id, 
            c.account_number.acc_type AS acc_type, 
            MAX (c.account_number.balance) AS max_balance
            FROM 
                customer_account c
            WHERE 
                c.account_number.acc_type = 'saving' 
            GROUP BY c.account_number.branch_id.branch_id, c.account_number.acc_type
        ) balance
    JOIN customer_account c 
    ON 
        c.account_number.branch_id.branch_id = balance.branch_id
    AND 
        c.account_number.acc_type = balance.acc_type 
    AND 
        c.account_number.balance = balance.max_balance
    LEFT JOIN customer_account t2
    ON t2.cust_id.cust_id = c.cust_id.cust_ID
    AND t2.account_number.acc_type = 'Basic';
    
/*Question4
*/
CREATE OR REPLACE TYPE BODY person_type AS 
MEMBER FUNCTION print_name RETURN STRING IS 
    BEGIN
        RETURN name.title || '. ' || name.firstname || ' ' || name.surname;
    END print_name; 

MEMBER FUNCTION print_address RETURN STRING IS 
    BEGIN
        RETURN address.street || ', ' || address.city || ', ' || address.postcode;
    END print_address; 
END; 
/ 
    
    
SELECT     
    'Emp ID: ' || e.emp_id || ',  ' ||
    e.print_name()   AS employee, 
    c.account_number.account_number AS "Account Number",
    e.supervisor_id.print_name() AS "Supervisor",
    e.supervisor_id.position.job_title AS "Supervisor Job Title" 
FROM 
    employee e, customer_account c
WHERE 
    c.cust_id.name.firstname = e.name.firstname
AND 
    c.cust_id.name.surname = e.name.surname
AND 
    e.supervisor_id.position.job_title = 'Manager'
ORDER BY 
    e.emp_id ASC;
    
/*Question 5
*/

SELECT 
    c.account_number.branch_id.branch_id AS branch_id, 
    c.cust_id.print_name() AS full_name, 
    c.account_number.limit_of_free_OD AS free_od
    FROM ( 
        SELECT c.account_number.branch_id.branch_id AS branch_id, 
            MAX(c.account_number.limit_of_free_OD) AS maxOD
            FROM customer_account c 
            GROUP BY c.account_number.branch_id.branch_id
        ) maxOD, customer_account c
        WHERE c.account_number.limit_of_free_OD = maxOD.maxOD AND
         c.account_number.branch_id.branch_id = maxOD.branch_id
         ORDER BY c.account_number.branch_id.branch_id ASC;
         
/*Question 6
*/

 SELECT  
    c.print_name() as fullname,
    t.phone_value as phonenumber
FROM 
    (SELECT c.cust_id AS cust_id, count(t.phone_version) AS mob_count, phone_version AS phone_version
    FROM customer c, table(c.phone) t 
    WHERE t.phone_version = 'Mobile'     
    AND t.phone_value LIKE '0750%'
    GROUP BY c.cust_id, phone_version) phone_nums, customer c, table(c.phone) t
WHERE c.cust_id = phone_nums.cust_id
AND t.phone_version = phone_nums.phone_version
AND t.phone_version = 'Mobile'
AND phone_nums.mob_count > 0
ORDER BY c.cust_id; 


/*Quetion 7
*/

SELECT 
    COUNT(e.print_name()) as number_of_employees,  
    (SELECT e.supervisor_id.print_name() FROM employee_table e WHERE e.supervisor_id.name.Surname = 'Smith') AS supervisor_by_Mr_Smith
    FROM employee_table e
    WHERE
        e.supervisor_id.name.firstname = 'Jack' AND
        e.supervisor_id.name.surname = 'Smith'
        
    GROUP BY e.supervisor_id.print_name() ;

SELECT 
    COUNT(e.print_name()) as number_of_employees,  
    (SELECT e.supervisor_id.print_name() FROM employee_table e WHERE e.supervisor_id.name.firstname = 'Jones') AS supervisor_by_Mrs_Jones
    FROM employee_table e
    WHERE
        e.supervisor_id.name.firstname = 'Jones' AND
        e.supervisor_id.name.surname = 'Wills'
        
    GROUP BY e.supervisor_id.print_name() ;


/*Question 8
*/

CREATE OR REPLACE TYPE BODY employee_info_Type AS 
member function awardStar return varchar2 is 
    medal varchar2(20);  
    years number;
    emps number;
    begin
        select count(*)
        into   emps
        from   employee e
        where  Deref(e.supervisor_ID).emp_ID = self.emp_ID;
        
       years := trunc(months_between(to_date('19-03-19','dd-mm-yyyy'),self.join_Date))/12;
        
        if years > 12 AND emps > 6 then
            medal := 'Gold Medal';
            elsif years > 8 AND emps > 3 then
            medal := 'Silver Medal';
            elsif years > 4 then
            medal := 'Bronze Medal';
            else
            medal := 'No Medal Awarded';
        end if;        
        return medal;
    end awardStar;
    
    member function years_at_company RETURN varchar2 IS 
    years number; 
    begin
        years := trunc(months_between(to_date('19-03-19','dd-mm-yyyy'),self.join_Date))/12;
        return years; 
    end years_at_company;  
    
    member function count_supervised RETURN varchar2 IS 
    emps number; 
    begin 
        select count(*)
        into   emps
        from   employee e
        where  Deref(e.supervisor_ID).emp_ID = self.emp_ID;
        
        return emps; 
    end count_supervised;
end;
/
SELECT 
    e.emp_id AS "EmployeeID" , 
    e.print_name() AS "Employee Full Name" ,
    e.years_at_company() AS "Years",
    e.count_supervised() || ' people' AS "Supervises", 
    e.awardStar() AS "Awarded Medal"
FROM 
    employee e 
WHERE
    e.awardStar() != 'No Medal Awarded';