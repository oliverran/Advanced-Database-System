/*

****
DROP EVERYTHING
****

*/

DROP TYPE name_Type FORCE; 
DROP TYPE address_Type FORCE;
DROP TYPE branch_type FORCE; 
DROP TYPE person_type FORCE; 
DROP TYPE job_Type FORCE; 
DROP TYPE employee_info_type FORCE; 
DROP TYPE customer_type FORCE; 
DROP TYPE account_type FORCE; 
DROP TYPE phone_nested FORCE;
DROP TYPE phone_type_table FORCE;
DROP TABLE job_table; 
DROP TABLE employee_table; 
DROP TABLE account_table;
DROP TABLE branch_table; 
DROP TABLE customer_table; 
DROP TABLE customer_account;

/*

****
CREATE TYPES
****

*/

CREATE TYPE name_Type AS OBJECT (
    title VARCHAR2(5), 
    firstname VARCHAR2(20), 
    surname VARCHAR2(20))
    FINAL; 
/ 


CREATE TYPE phone_nested AS OBJECT (
    phone_version VARCHAR2(20), 
    phone_value VARCHAR2(20))
    FINAL; 
/

CREATE TYPE phone_type_table AS TABLE OF phone_nested;
/

CREATE TYPE address_Type AS OBJECT (
    street VARCHAR2(20), 
    city VARCHAR2(20), 
    postcode VARCHAR2(8))
    NOT FINAL; 
/

CREATE TYPE branch_type UNDER address_Type (
    branch_id VARCHAR2(6), 
    phone phone_type_table)
    FINAL; 
/    


CREATE TYPE person_Type AS OBJECT(
    name name_Type,
    address address_Type, 
    ni_num VARCHAR2(6),
    phone phone_type_table)
    NOT FINAL; 
/   

CREATE TYPE job_Type AS OBJECT(
    job_id VARCHAR2(6), 
    job_title VARCHAR2(20), 
    salary INTEGER)
    FINAL; 
/    

CREATE TYPE employee_info_Type UNDER person_Type (
    emp_id VARCHAR2(6),
    join_date DATE,
    branch_id REF branch_type, 
    position REF job_Type,
    supervisor_id REF employee_info_type)
    FINAL;
/    

CREATE TYPE customer_Type UNDER person_Type (
    cust_id VARCHAR2(6))
    FINAL;
/  

CREATE TYPE account_Type AS OBJECT (
    account_number INT, 
    acc_Type VARCHAR2(8), 
    balance INT, 
    branch_id ref branch_Type, 
    interest_rate VARCHAR2(6), 
    limit_of_free_OD INT, 
    open_date DATE)
    FINAL; 
/  

/*

****
CREATE TABLES
****

*/
CREATE TYPE name_Type AS OBJECT (
    title VARCHAR2(5), 
    firstname VARCHAR2(20), 
    surname VARCHAR2(20))
    FINAL; 
/ 


CREATE TYPE phone_nested AS OBJECT (
    phone_version VARCHAR2(20), 
    phone_value VARCHAR2(20))
    FINAL; 
/

CREATE TYPE phone_type_table AS TABLE OF phone_nested;
/

CREATE TYPE address_Type AS OBJECT (
    street VARCHAR2(20), 
    city VARCHAR2(20), 
    postcode VARCHAR2(8))
    NOT FINAL; 
/

CREATE TYPE branch_type UNDER address_Type (
    branch_id VARCHAR2(6), 
    phone phone_type_table)
    FINAL; 
/    


CREATE TYPE person_Type AS OBJECT(
    name name_Type,
    address address_Type, 
    ni_num VARCHAR2(6),
    phone phone_type_table)
    NOT FINAL; 
/   

CREATE TYPE job_Type AS OBJECT(
    job_id VARCHAR2(6), 
    job_title VARCHAR2(20), 
    salary INTEGER)
    FINAL; 
/    

CREATE TYPE employee_info_Type UNDER person_Type (
    emp_id VARCHAR2(6),
    join_date DATE,
    branch_id REF branch_type, 
    position REF job_Type,
    supervisor_id REF employee_info_type)
    FINAL;
/    

CREATE TYPE customer_Type UNDER person_Type (
    cust_id VARCHAR2(6))
    FINAL;
/  

CREATE TYPE account_Type AS OBJECT (
    account_number INT, 
    acc_Type VARCHAR2(8), 
    balance INT, 
    branch_id ref branch_Type, 
    interest_rate VARCHAR2(4), 
    limit_of_free_OD INT, 
    open_date DATE)
    FINAL; 
/  




CREATE TABLE job_table OF job_type(
    CONSTRAINT jobID_const PRIMARY KEY (job_id), 
    CONSTRAINT jobtitle CHECK (job_title IS NOT NULL),
    CONSTRAINT salary CHECK (salary IS NOT NULL)); 

CREATE TABLE employee OF employee_info_Type (
    CONSTRAINT empID PRIMARY KEY (emp_id), 
    CONSTRAINT ninum UNIQUE (ni_num),  
    CONSTRAINT branchID CHECK(branch_id IS NOT NULL), 
    CONSTRAINT phonenumber CHECK (phone IS NOT NULL),
    CONSTRAINT joindate CHECK (join_date IS NOT NULL), 
    CONSTRAINT position CHECK (position IS NOT NULL), 
    CONSTRAINT surname CHECK (name.surname IS NOT NULL))
    NESTED TABLE phone STORE AS emp_phone_nested_table; 

CREATE TABLE account OF account_type (
    CONSTRAINT accountnumber PRIMARY KEY(account_number), 
    CONSTRAINT ACCTYPE CHECK(acc_type IS NOT NULL), 
    CONSTRAINT branch_id CHECK (branch_id IS NOT NULL), 
    CONSTRAINT opendate CHECK (open_date IS NOT NULL));
    
CREATE TABLE branch OF branch_type (
    CONSTRAINT branch_id_constr PRIMARY KEY(branch_id), 
    CONSTRAINT city_const CHECK(city IS NOT NULL), 
    CONSTRAINT phone_const CHECK(phone IS NOT NULL), 
    CONSTRAINT street_const CHECK(street IS NOT NULL), 
    CONSTRAINT postcode_const CHECK(postcode IS NOT NULL))
    NESTED TABLE phone STORE AS branch_phone_nested_table;     
 
CREATE TABLE customer OF customer_type (
    CONSTRAINT cust_id_const PRIMARY KEY(cust_id), 
    CONSTRAINT name_const CHECK(name IS NOT NULL), 
    CONSTRAINT address_city_const CHECK(address.city IS NOT NULL), 
    CONSTRAINT ninum_constr UNIQUE (ni_num))
    NESTED TABLE phone STORE AS cust_phone_nested_table; 
    
CREATE TABLE customer_Account (
    cust_id REF customer_Type SCOPE IS customer, 
    account_number REF account_Type SCOPE IS account);
    
    
SHOW ERROR;

ALTER TYPE employee_info_Type
ADD MEMBER FUNCTION awardStar RETURN VARCHAR2,
ADD MEMBER FUNCTION years_at_company RETURN VARCHAR2, 
ADD MEMBER FUNCTION  count_supervised RETURN VARCHAR2 CASCADE; 


CREATE OR REPLACE TYPE BODY employee_info_Type AS 
member function awardStar return varchar2 is 
    medal varchar2(20);  
    years number;
    emps number;
    begin
        select count(*)
        into   emps
        from   employee_table e
        where  Deref(e.supervisor_ID).emp_ID = self.emp_ID;
        
        years := trunc(months_between(sysDate,self.join_Date))/12;
        
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
        years := trunc(months_between(sysDate,self.join_Date))/12;
        return years; 
    end years_at_company;  
    
    member function count_supervised RETURN varchar2 IS 
    emps number; 
    begin 
        select count(*)
        into   emps
        from   employee_table e
        where  Deref(e.supervisor_ID).emp_ID = self.emp_ID;
        
        return emps; 
    end count_supervised;
end;
/

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

ALTER TYPE branch_type
ADD MEMBER FUNCTION print_address RETURN STRING CASCADE; 
/

CREATE OR REPLACE TYPE BODY branch_type AS
MEMBER FUNCTION print_address RETURN STRING IS 
    BEGIN
        RETURN self.street || ' ' || self.city || ', ' || self.postcode;
    END print_address; 
END; 
/ 

show error;
