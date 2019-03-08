/*
branch table
*/

insert into branch(street, city, postcode, branch_ID, phone) values(
'colinton st.',
'Edinbutgh',
'EH11 5DT',
'901',
phone_type_table(phone_nested('branch','00712345678')));

insert into branch(street, city, postcode, branch_ID, phone) values(
'Market st.',
'Edinburgh',
'EH1 5AB',
'902',
phone_type_table(phone_nested('branch','01311235560')));

insert into branch(street, city, postcode, branch_ID, phone) values(
'Bridge st.',
'Glasglow',
'G18 1QQ',
'903',
phone_type_table(phone_nested('branch','01413214556')));

insert into branch(street, city, postcode, branch_ID, phone) values(
'Chao Yang st.',
'London',
'E11 W1',
'904',
phone_type_table(phone_nested('branch','07702346542')));

insert into branch(street, city, postcode, branch_ID, phone) values(
'Queen st.',
'Edinburgh',
'EH6 5EE',
'905',
phone_type_table(phone_nested('branch','07756734561')));

insert into branch(street, city, postcode, branch_ID, phone) values(
'RanTun st..',
'Edinburgh',
'EH4 5NE',
'906',
phone_type_table(phone_nested('branch','07734789541')));

insert into branch(street, city, postcode, branch_ID, phone) values(
'Marry st.',
'Edinburgh',
'EH1 4QH',
'907',
phone_type_table(phone_nested('branch','07765781234')));

insert into branch(street, city, postcode, branch_ID, phone) values(
'Ford st.',
'Edinburgh',
'EH8 2SE',
'908',
phone_type_table(phone_nested('branch','07798754671')));

insert into branch(street, city, postcode, branch_ID, phone) values(
'Horry st.',
'Edinburgh',
'EH12 2ER',
'909',
phone_type_table(phone_nested('branch','07712365438')));

insert into branch(street, city, postcode, branch_ID, phone) values(
'Royal Mill',
'Edinburgh',
'EH1 3AA',
'910',
phone_type_table(phone_nested('branch','01315786541')));

insert into branch(street, city, postcode, branch_ID, phone) values(
'King st.',
'Edinburgh',
'EH3 5AR',
'911',
phone_type_table(phone_nested('branch','013198745612')));

insert into branch(street, city, postcode, branch_ID, phone) values(
'Qinling St.',
'Zhengzhou',
'450001',
'912',
phone_type_table(phone_nested('branch','08618532109175')));

insert into branch(street, city, postcode, branch_ID, phone) values(
'Futian st.',
'Glasglow',
'450002',
'913',
phone_type_table(phone_nested('branch','00861324243123')));

insert into branch(street, city, postcode, branch_ID, phone) values(
'Wenhua st.',
'Beijing',
'400000',
'914',
phone_type_table(phone_nested('branch','00861234567')));

insert into branch(street, city, postcode, branch_ID, phone) values(
'Tianan st.',
'Edinburgh',
'EH1 1RR',
'915',
phone_type_table(phone_nested('branch','07741234281')));

insert into branch(street, city, postcode, branch_ID, phone) values(
'HuaWei st.',
'York',
'NH11 ER115',
'916',
phone_type_table(phone_nested('branch','01314324123')));

insert into branch(street, city, postcode, branch_ID, phone) values(
'Yahoo st.',
'Oxford',
'11ER 3BT',
'917',
phone_type_table(phone_nested('branch','01312314231')));

insert into branch(street, city, postcode, branch_ID, phone) values(
'Tianmao st.',
'Cambridge',
'CA1 AA3',
'918',
phone_type_table(phone_nested('branch','01316547345')));

insert into branch(street, city, postcode, branch_ID, phone) values(
'Taobao',
'Striling',
'ST1 ER3',
'919',
phone_type_table(phone_nested('branch','07341235781')));

insert into branch(street, city, postcode, branch_ID, phone) values(
'MeiTuan st.',
'Dumdee',
'3AD 4SE',
'920',
phone_type_table(phone_nested('branch','01234124365')));

/*
account table
*/

insert into Account(account_number, ACC_TYPE,balance, branch_id,interest_rate, limit_of_free_od, open_date) values(
1001,
'current',
'820.50',
(select ref(b) from branch b where b.branch_id = '901'),
'0.005',
800,
'01-May-15');

insert into Account(account_number, ACC_TYPE,balance, branch_id,interest_rate, limit_of_free_od, open_date) values(
1010,
'saving',
'3122.20',
(select ref(b) from branch b where b.branch_id = '901'),
0.02,
null,
'01-May-15');

insert into Account(account_number, ACC_TYPE,balance, branch_id,interest_rate, limit_of_free_od, open_date) values(
8002,
'current',
'820.50',
(select ref(b) from branch b where b.branch_id = '908'),
'0.005',
100,
'01-May-10');

insert into Account(account_number, ACC_TYPE,balance, branch_id,interest_rate, limit_of_free_od, open_date) values(
1234,
'current',
'1000.00',
(select ref(b) from branch b where b.branch_id = '901'),
'0.023',
600,
'14-June-1997');

insert into Account(account_number, ACC_TYPE,balance, branch_id,interest_rate, limit_of_free_od, open_date) values(
1101,
'saving',
'9876.54',
(select ref(b) from branch b where b.branch_id = '914'),
'0.023',
600,
'14-June-1997');

insert into Account(account_number, ACC_TYPE,balance, branch_id,interest_rate, limit_of_free_od, open_date) values(
1102,
'saving',
'1234.56',
(select ref(b) from branch b where b.branch_id = '909'),
'0.01',
10000,
'21-Feb-2000');

insert into Account(account_number, ACC_TYPE,balance, branch_id,interest_rate, limit_of_free_od, open_date) values(
1103,
'saving',
'123.45',
(select ref(b) from branch b where b.branch_id = '909'),
'0.003',
9999,
'16-Feb-2000');

insert into Account(account_number, ACC_TYPE,balance, branch_id,interest_rate, limit_of_free_od, open_date) values(
1104,
'saving',
'144.6',
(select ref(b) from branch b where b.branch_id = '907'),
'0.013',
444,
'2-March-2000');

insert into Account(account_number, ACC_TYPE,balance, branch_id,interest_rate, limit_of_free_od, open_date) values(
1105,
'current',
'1444',
(select ref(b) from branch b where b.branch_id = '909'),
'0.05',
100,
'4-April-2000');

insert into Account(account_number, ACC_TYPE,balance, branch_id,interest_rate, limit_of_free_od, open_date) values(
1106,
'saving',
'800.21',
(select ref(b) from branch b where b.branch_id = '914'),
'0.003',
2208,
'28-Feb-2010');

insert into Account(account_number, ACC_TYPE,balance, branch_id,interest_rate, limit_of_free_od, open_date) values(
1107,
'current',
'123',
(select ref(b) from branch b where b.branch_id = '915'),
'0.04',
450,
'21-Dec-2009');

insert into Account(account_number, ACC_TYPE,balance, branch_id,interest_rate, limit_of_free_od, open_date) values(
1108,
'saving',
'400',
(select ref(b) from branch b where b.branch_id = '903'),
'0.05',
600,
'21-Nov-2016');

insert into Account(account_number, ACC_TYPE,balance, branch_id,interest_rate, limit_of_free_od, open_date) values(
1109,
'current',
'7800',
(select ref(b) from branch b where b.branch_id = '904'),
'0.03',
null,
'1-Jan-2000');

insert into Account(account_number, ACC_TYPE,balance, branch_id,interest_rate, limit_of_free_od, open_date) values(
1110,
'saving',
'1234.56',
(select ref(b) from branch b where b.branch_id = '904'),
'0.01',
10000,
'21-Feb-2000');

insert into Account(account_number, ACC_TYPE,balance, branch_id,interest_rate, limit_of_free_od, open_date) values(
1111,
'saving',
'10000',
(select ref(b) from branch b where b.branch_id = '912'),
'0.09',
500,
'16-June-2009');

insert into Account(account_number, ACC_TYPE,balance, branch_id,interest_rate, limit_of_free_od, open_date) values(
1112,
'current',
'1220',
(select ref(b) from branch b where b.branch_id = '919'),
'0.002',
200,
'3-March-2018');

insert into Account(account_number, ACC_TYPE,balance, branch_id,interest_rate, limit_of_free_od, open_date) values(
1113,
'saving',
'88000',
(select ref(b) from branch b where b.branch_id = '907'),
'0.04',
1000,
'15-July-2019');

insert into Account(account_number, ACC_TYPE,balance, branch_id,interest_rate, limit_of_free_od, open_date) values(
1114,
'current',
'432.21',
(select ref(b) from branch b where b.branch_id = '911'),
'0.06',
100,
'30-May-2014');

insert into Account(account_number, ACC_TYPE,balance, branch_id,interest_rate, limit_of_free_od, open_date) values(
1115,
'current',
'3420000',
(select ref(b) from branch b where b.branch_id = '909'),
'0.01',
9000,
'15-Aug-1999');

insert into Account(account_number, ACC_TYPE,balance, branch_id,interest_rate, limit_of_free_od, open_date) values(
1116,
'saving',
'9888',
(select ref(b) from branch b where b.branch_id = '904'),
'0.08',
700,
'30-June-2003');

insert into Account(account_number, ACC_TYPE,balance, branch_id,interest_rate, limit_of_free_od, open_date) values(
1117,
'current',
'10000.00',
(select ref(b) from branch b where b.branch_id = '909'),
'0.012',
5000,
'14-Feb-2010');

insert into Account(account_number, ACC_TYPE,balance, branch_id,interest_rate, limit_of_free_od, open_date) values(
1118,
'saving',
'5600',
(select ref(b) from branch b where b.branch_id = '915'),
'0.014',
5000,
'13-May-1999');

insert into Account(account_number, ACC_TYPE,balance, branch_id,interest_rate, limit_of_free_od, open_date) values(
1119,
'current',
'9888',
(select ref(b) from branch b where b.branch_id = '914'),
'0.009',
8000,
'2-Aug-1998');

insert into Account(account_number, ACC_TYPE,balance, branch_id,interest_rate, limit_of_free_od, open_date) values(
1120,
'saving',
'2000',
(select ref(b) from branch b where b.branch_id = '916'),
'0.008',
4000,
'17-June-2007');

/* 
   **** 
 INSERT INTO JOB_TABLE 
 **** 
   */  
   INSERT INTO job_table (job_id, job_title, salary) VALUES ( 
 '000001',  
 'Head',  
 100000);  
   INSERT INTO job_table (job_id, job_title, salary) VALUES ( 
 '000002',  
 'Manager',  
 75000);  
   INSERT INTO job_table (job_id, job_title, salary) VALUES ( 
 '000003',  
 'Project Leader',  
 50000);  
   INSERT INTO job_table (job_id, job_title, salary) VALUES ( 
 '000004',  
 'Accountant',  
 35000);  
   INSERT INTO job_table (job_id, job_title, salary) VALUES ( 
 '000005',  
 'Cashier',  
 25000);  
  
 
/*
employee table
*/

insert into employee(NAME,ADDRESS,NINUM,PHONE,emp_id,join_date,branch_id,position,supervisor_id) values(
	name_type(
		'Mrs','Alisa','Smith'),
	address_type(
		'Colinton',
		'Edinburgh',
		'EH105TT'),
	'N1001',
	phone_type_table(phone_nested('Mobile','01312125555'),phone_nested('Mobile','07705623443'),phone_nested('Home','07907812345')),
	101,
	'01-Feb-06',
	(select ref(b) from branch b where b.branch_id = '901'),
	(select ref(j) from job_table j where j.job_title = 'Head'),
	(select ref(e) from employee e where e.emp_id = null)
);


insert into employee(NAME,ADDRESS,NINUM,PHONE,emp_id,join_date,branch_id,position,supervisor_id) values(
	name_type(
		'Mr','John','William'),
	address_type(
		'New',
		'Edinburgh',
		'EH24AB'),
	'N1010',
	phone_type_table(phone_nested('Mobile','01312031990'),phone_nested('Mobile','07902314551'),phone_nested('Home','07701234567')),
	105,
	'04-Mar-07',
	(select ref(b) from branch b where b.branch_id = '901'),
	(select ref(j) from job_table j where j.job_title = 'Manager'),
	(select ref(e) from employee e where e.emp_id = '101')
);


insert into employee(NAME,ADDRESS,NINUM,PHONE,emp_id,join_date,branch_id,position,supervisor_id) values(
	name_type(
		'Mr','Mark','Slack'),
	address_type(
		'Old',
		'Edinburgh',
		'EH94BB'),
	'N1120',
	phone_type_table(phone_nested('Mobile','01312102211'),phone_nested('Mobile',null),phone_nested('Home',null)),
	108,
	'01-Feb-10',
	(select ref(b) from branch b where b.branch_id = '901'),
	(select ref(j) from job_table j where j.job_title = 'Accountant'),
	(select ref(e) from employee e where e.emp_id = '105')
);


insert into employee(NAME,ADDRESS,NINUM,PHONE,emp_id,join_date,branch_id,position,supervisor_id) values(
	name_type(
		'Mr','WEIGUANG','RAN'),
	address_type(
		'ParkheadAvenue',
		'Edinburgh',
		'EH114SE'),
	'N1002',
	phone_type_table(phone_nested('Mobile','07702840687'),phone_nested('Mobile',null),phone_nested('Home',null)),
	666,
	'11-Nov-11',
	(select ref(b) from branch b where b.branch_id = '912'),
	(select ref(j) from job_table j where j.job_title = 'Manager'),
	(select ref(e) from employee e where e.emp_id = '101')
);

insert into employee(NAME,ADDRESS,NINUM,PHONE,emp_id,join_date,branch_id,position,supervisor_id) values(
	name_type(
		'Mr','Jack','Smith'),
	address_type(
		'Adam',
		'Edinburgh',
		'EH28XN'),
	'N1003',
	phone_type_table(phone_nested('Mobile','01311112223'),phone_nested('Mobile','0781209890'),phone_nested('Home',null)),
	105,
	'05-Feb-14',
	(select ref(b) from branch b where b.branch_id = '908'),
	(select ref(j) from job_table j where j.job_title = 'Leader'),
	(select ref(e) from employee e where e.emp_id = '801')
);

insert into employee(NAME,ADDRESS,NINUM,PHONE,emp_id,join_date,branch_id,position,supervisor_id) values(
	name_type(
		'Mrs','July','William'),
	address_type(
		'Old',
		'Glasglow',
		'GG14EE'),
	'N1004',
	phone_type_table(phone_nested('Mobile','01312341241'),phone_nested('Mobile',null),phone_nested('Home',null)),
	801,
	'04-Mar-07',
	(select ref(b) from branch b where b.branch_id = '908'),
	(select ref(j) from job_table j where j.job_title = 'manager'),
	(select ref(e) from employee e where e.emp_id = null)
);

insert into employee(NAME,ADDRESS,NINUM,PHONE,emp_id,join_date,branch_id,position,supervisor_id) values(
	name_type(
		'Mr','Peter','Bill'),
	address_type(
		'York',
		'Edinburgh',
		'EH43AB'),
	'N1005',
	phone_type_table(phone_nested('Mobile','01314512313'),phone_nested('Mobile',NULL),phone_nested('Home','07704567123')),
	206,
	'07-June-14',
	(select ref(b) from branch b where b.branch_id = '905'),
	(select ref(j) from job_table j where j.job_title = 'Account'),
	(select ref(e) from employee e where e.emp_id = '203')
);

insert into employee(NAME,ADDRESS,NINUM,PHONE,emp_id,join_date,branch_id,position,supervisor_id) values(
	name_type(
		'Mr','Bush','Simon'),
	address_type(
		'Shenzhen',
		'London',
		'11QE'),
	'N1007',
	phone_type_table(phone_nested('Mobile','01314512313'),phone_nested('Mobile','0790342153212'),phone_nested('Home','07700987651')),
	203,
	'04-Mar-07',
	(select ref(b) from branch b where b.branch_id = '905'),
	(select ref(j) from job_table j where j.job_title = 'Leader'),
	(select ref(e) from employee e where e.emp_id = 202)
);

insert into employee(NAME,ADDRESS,NINUM,PHONE,emp_id,join_date,branch_id,position,supervisor_id) values(
	name_type(
		'Mr','Yifu','Lai'),
	address_type(
		'Fountainpark',
		'Edinburgh',
		'EH11 5ER'),
	'N1008',
	phone_type_table(phone_nested('Mobile','013123412345'),phone_nested('Mobile',null),phone_nested('Home',null)),
	202,
	'13-Sep-12',
	(select ref(b) from branch b where b.branch_id = '905'),
	(select ref(j) from job_table j where j.job_title = 'Manager'),
	(select ref(e) from employee e where e.emp_id = 101)
);

insert into employee(NAME,ADDRESS,NINUM,PHONE,emp_id,join_date,branch_id,position,supervisor_id) values(
	name_type(
		'Mr','Shaozhuo','Li'),
	address_type(
		'Fountainpark',
		'Edinburgh',
		'EH115ER'),
	'N1009',
	phone_type_table(phone_nested('Mobile','013109712351'),phone_nested('Mobile','079043123512'),phone_nested('Home',null)),
	302,
	'04-Mar-07',
	(select ref(b) from branch b where b.branch_id = '911'),
	(select ref(j) from job_table j where j.job_title = 'Manager'),
	(select ref(e) from employee e where e.emp_id = 101)
);

insert into employee(NAME,ADDRESS,NINUM,PHONE,emp_id,join_date,branch_id,position,supervisor_id) values(
	name_type(
		'Mr','Yuli','Yang'),
	address_type(
		'Fountainpark',
		'Edinburgh',
		'EH115ER'),
	'N1011',
	phone_type_table(phone_nested('Mobile','013104412434'),phone_nested('Mobile',null),phone_nested('Home',null)),
	402,
	'15-Jan-14',
	(select ref(b) from branch b where b.branch_id = '912'),
	(select ref(j) from job_table j where j.job_title = 'Manager'),
	(select ref(e) from employee e where e.emp_id = 101)
);

insert into employee(NAME,ADDRESS,NINUM,PHONE,emp_id,join_date,branch_id,position,supervisor_id) values(
	name_type(
		'Mr','Kai','Fan'),
	address_type(
		'Fountainpark',
		'Edinburgh',
		'EH115ER'),
	'N1012',
	phone_type_table(phone_nested('Mobile','013109812312'),phone_nested('Mobile','079051234091'),phone_nested('Home',null)),
	502,
	'15-Mar-17',
	(select ref(b) from branch b where b.branch_id = '913'),
	(select ref(j) from job_table j where j.job_title = 'Manager'),
	(select ref(e) from employee e where e.emp_id = 101)
);

insert into employee(NAME,ADDRESS,NINUM,PHONE,emp_id,join_date,branch_id,position,supervisor_id) values(
	name_type(
		'Mr','Yue','Zhao'),
	address_type(
		'Fountainpark',
		'Edinburgh',
		'EH115ER'),
	'N1013',
	phone_type_table(phone_nested('Mobile','01310981243'),phone_nested('Mobile',null),phone_nested('Home',null)),
	602,
	'15-Dec-07',
	(select ref(b) from branch b where b.branch_id = '914'),
	(select ref(j) from job_table j where j.job_title = 'Manager'),
	(select ref(e) from employee e where e.emp_id = 101)
);

insert into employee(NAME,ADDRESS,NINUM,PHONE,emp_id,join_date,branch_id,position,supervisor_id) values(
	name_type(
		'Mrs','Lily','Wu'),
	address_type(
		'Mary',
		'Edinburgh',
		'EH45ET'),
	'N1014',
	phone_type_table(phone_nested('Mobile',null),phone_nested('Mobile',null),phone_nested('Home','071231324124')),
	203,
	'14-May-15',
	(select ref(b) from branch b where b.branch_id = '905'),
	(select ref(j) from job_table j where j.job_title = 'Cashier'),
	(select ref(e) from employee e where e.emp_id = 202)
);

insert into employee(NAME,ADDRESS,NINUM,PHONE,emp_id,join_date,branch_id,position,supervisor_id) values(
	name_type(
		'Mrs','Angela','Baby'),
	address_type(
		'Ford',
		'London',
		'15GR'),
	'N1015',
	phone_type_table(phone_nested('Mobile','00861351231241'),phone_nested('Mobile',null),phone_nested('Home',null)),
	204,
	'04-Mar-07',
	(select ref(b) from branch b where b.branch_id = '905'),
	(select ref(j) from job_table j where j.job_title = 'accountant'),
	(select ref(e) from employee e where e.emp_id = 202)
);

insert into employee(NAME,ADDRESS,NINUM,PHONE,emp_id,join_date,branch_id,position,supervisor_id) values(
	name_type(
		'Mrs','Nazha','Guli'),
	address_type(
		'Mercy',
		'Dumdee',
		'BE115RE'),
	'N1016',
	phone_type_table(phone_nested('Mobile','013109712314'),phone_nested('Mobile','07012341791'),phone_nested('Home','070124123589')),
	303,
	'05-July-16',
	(select ref(b) from branch b where b.branch_id = '911'),
	(select ref(j) from job_table j where j.job_title = 'Cashier'),
	(select ref(e) from employee e where e.emp_id = 302)
);

insert into employee(NAME,ADDRESS,NINUM,PHONE,emp_id,join_date,branch_id,position,supervisor_id) values(
	name_type(
		'Mrs','Ying','Han'),
	address_type(
		'Mill',
		'Cambridge',
		'NQ15ER'),
	'N1017',
	phone_type_table(phone_nested('Mobile','077123651234'),phone_nested('Mobile','07905123510'),phone_nested('Home',null)),
	304,
	'15-Aug-16',
	(select ref(b) from branch b where b.branch_id = '911'),
	(select ref(j) from job_table j where j.job_title = 'Accountant'),
	(select ref(e) from employee e where e.emp_id = 302)
);

insert into employee(NAME,ADDRESS,NINUM,PHONE,emp_id,join_date,branch_id,position,supervisor_id) values(
	name_type(
		'Mrs','Swift','Tayor'),
	address_type(
		'Wool',
		'Edinburgh',
		'EH43WE'),
	'N1018',
	phone_type_table(phone_nested('Mobile','0131018235123'),phone_nested('Mobile',null),phone_nested('Home',null)),
	403,
	'12-June-13',
	(select ref(b) from branch b where b.branch_id = '912'),
	(select ref(j) from job_table j where j.job_title = 'Cashier'),
	(select ref(e) from employee e where e.emp_id = 402)
);


/*
Customer table

*/

INSERT INTO customer_table (name, address, ni_num, phone, cust_id) VALUES ( 
    name_Type(
        'Mr', 
        'Jack',
        'Smith'), 
    address_Type(
        'Adam', 
        'Edinburgh', 
        'EH28XN'), 
    'N1003',
    phone_type_table(phone_nested('Mobile','01311112223'),phone_nested('Mobile','0781209890'),phone_nested('Home',null)),
    '1002'
); 


INSERT INTO customer_table (name, address, ni_num, phone, cust_id) VALUES ( 
    name_Type(
        'Mrs', 
        'Anna',
        'Smith'), 
    address_Type(
        'Adam', 
        'Edinburgh', 
        'EH16EA'), 
    'N1010',
    phone_type_table(phone_nested('Mobile','01314425567'),phone_nested('Mobile',null), phone_nested('Home', null)),
    '1003'
); 


INSERT INTO customer_table (name, address, ni_num, phone, cust_id) VALUES ( 
    name_Type(
        'Mr', 
        'Liam',
        'Bain'), 
    address_Type(
        'NEW', 
        'Edinburgh', 
        'EH28XN'), 
    'N1034',
    phone_type_table(phone_nested('Mobile','01314425567'),phone_nested('Mobile',null), phone_nested('Home',null)),
    '1098'
); 

INSERT INTO customer_table (name, address, ni_num, phone, cust_id) VALUES ( 
    name_Type(
        'Mr', 
        'Oliver',
        'RAN'), 
    address_Type(
        'ParkheadAvenue', 
        'Edinburgh', 
        'EH114SE'), 
    'N1201',
    phone_type_table(phone_nested('Mobile','013145123908'),phone_nested('Mobile','07702840687'), phone_nested('Home',null)),
    '1088'
); 

INSERT INTO customer_table (name, address, ni_num, phone, cust_id) VALUES ( 
    name_Type(
        'Mr', 
        'Mark',
        'Slack'), 
    address_Type(
        'Old', 
        'Edinburgh', 
        'EH94BB'), 
    'N1120',
    phone_type_table(phone_nested('Mobile','013145123908'),phone_nested('Mobile','07702840687'), phone_nested('Home',null)),
    '1004'
); 

INSERT INTO customer_table (name, address, ni_num, phone, cust_id) VALUES ( 
    name_Type(
        'Mr', 
        'WEIGUANG',
        'RAN'), 
    address_Type(
        'ParkheadAvenue', 
        'Edinburgh', 
        'EH114SE'), 
    'N1002',
    phone_type_table(phone_nested('Mobile','07702840687'),phone_nested('Mobile',null),phone_nested('Home',null)),
    '1005'
); 

INSERT INTO customer_table (name, address, ni_num, phone, cust_id) VALUES ( 
    name_Type(
        'Mrs', 
        'July',
        'William'), 
    address_Type(
        'Old', 
        'Glasglow', 
        'GG14EE'), 
    'N1004',
    phone_type_table(phone_nested('Mobile','01312341241'),phone_nested('Mobile',null),phone_nested('Home',null)),
    '1006'
); 

INSERT INTO customer_table (name, address, ni_num, phone, cust_id) VALUES ( 
    name_Type(
        'Mr', 
        'Peter',
        'Bill'), 
    address_Type(
        'York', 
        'Edinburgh', 
        'EH43AB'), 
    'N1005',
    phone_type_table(phone_nested('Mobile','01314512313'),phone_nested('Mobile',NULL),phone_nested('Home','07704567123')),
    '1007'
); 


INSERT INTO customer_table (name, address, ni_num, phone, cust_id) VALUES ( 
    name_Type(
        'Mr', 
        'Bush',
        'Simon'), 
    address_Type(
        'Shenzhen', 
        'London', 
        '11QE'), 
    'N1007',
    phone_type_table(phone_nested('Mobile','01314512313'),phone_nested('Mobile','0790342153212'),phone_nested('Home','07700987651')),
    '1008'
); 

INSERT INTO customer_table (name, address, ni_num, phone, cust_id) VALUES ( 
    name_Type(
        'Mr', 
        'Yifu',
        'Lai'), 
    address_Type(
        'Fountainpark', 
        'Edinburgh', 
        'EH11 5ER'), 
    'N1008',
    phone_type_table(phone_nested('Mobile','013123412345'),phone_nested('Mobile',null),phone_nested('Home',null)),
    '1009'
);

INSERT INTO customer_table (name, address, ni_num, phone, cust_id) VALUES ( 
    name_Type(
        'Mr', 
        'Kai',
        'Fan'), 
    address_Type(
        'Fountainpark', 
        'Edinburgh', 
        'EH115ER'), 
    'N1012',
    phone_type_table(phone_nested('Mobile','013109812312'),phone_nested('Mobile','079051234091'),phone_nested('Home',null)),
    '1010'
);

INSERT INTO customer_table (name, address, ni_num, phone, cust_id) VALUES ( 
    name_Type(
        'Mr', 
        'Yue',
        'Zhao'), 
    address_Type(
        'Fountainpark', 
        'Edinburgh', 
        'EH115ER'), 
    'N1013',
    phone_type_table(phone_nested('Mobile','01310981243'),phone_nested('Mobile',null),phone_nested('Home',null)),
    '1011'
);

INSERT INTO customer_table (name, address, ni_num, phone, cust_id) VALUES ( 
    name_Type(
        'Mrs', 
        'June',
        'Lucy'), 
    address_Type(
        'Old', 
        'Edinburgh', 
        'EH11BR'), 
    'N1088',
    phone_type_table(phone_nested('Mobile','01310981243'),phone_nested('Mobile',null),phone_nested('Home',null)),
    '1012'
);

INSERT INTO customer_table (name, address, ni_num, phone, cust_id) VALUES ( 
    name_Type(
        'Mrs', 
        'April',
        'Marry'), 
    address_Type(
        'King', 
        'Edinburgh', 
        'EH35ER'), 
    'N1078',
    phone_type_table(phone_nested('Mobile','013187564123'),phone_nested('Mobile',null),phone_nested('Home','0131239418571')),
    '1013'
);

INSERT INTO customer_table (name, address, ni_num, phone, cust_id) VALUES ( 
    name_Type(
        'Mrs', 
        'Millie',
        'Canny'), 
    address_Type(
        'Fred', 
        'Edinburgh', 
        'EH125DD'), 
    'N1079',
    phone_type_table(phone_nested('Mobile','013189172451'),phone_nested('Mobile',null),phone_nested('Home',null)),
    '1014'
);

INSERT INTO customer_table (name, address, ni_num, phone, cust_id) VALUES ( 
    name_Type(
        'Mrs', 
        'May',
        'Bery'), 
    address_Type(
        'Mill', 
        'Edinburgh', 
        'EH73TT'), 
    'N1080',
    phone_type_table(phone_nested('Mobile','013104123981'),phone_nested('Mobile','01312398173'),phone_nested('Home',null)),
    '1015'
);

INSERT INTO customer_table (name, address, ni_num, phone, cust_id) VALUES ( 
    name_Type(
        'Mrs', 
        'Lily',
        'Francesca'), 
    address_Type(
        'Fountainpark', 
        'Edinburgh', 
        'EH115ER'), 
    'N1081',
    phone_type_table(phone_nested('Mobile','013131287102'),phone_nested('Mobile',null),phone_nested('Home','0131982129312')),
    '1016'
);

INSERT INTO customer_table (name, address, ni_num, phone, cust_id) VALUES ( 
    name_Type(
        'Mr', 
        'Niuniu',
        'Bee'), 
    address_Type(
        'Queen', 
        'York', 
        'EE2S3'), 
    'N1082',
    phone_type_table(phone_nested('Mobile','01376212982'),phone_nested('Mobile','077123912831'),phone_nested('Home','08812309182')),
    '1017'
);

INSERT INTO customer_table (name, address, ni_num, phone, cust_id) VALUES ( 
    name_Type(
        'Mr', 
        'Frank',
        'David'), 
    address_Type(
        'Calvin', 
        'Glasglow', 
        'GG1TR2'), 
    'N1083',
    phone_type_table(phone_nested('Mobile','01318712312'),phone_nested('Mobile',null),phone_nested('Home','077012918212')),
    '1018'
);

INSERT INTO customer_table (name, address, ni_num, phone, cust_id) VALUES ( 
    name_Type(
        'Mr', 
        'Neil',
        'Fed'), 
    address_Type(
        'Zhengzhou', 
        'Henan', 
        '4500001'), 
    'N1084',
    phone_type_table(phone_nested('Mobile','00881351238123'),phone_nested('Mobile','008812371234141'),phone_nested('Home','0701287126412')),
    '1019'
);

INSERT INTO customer_table (name, address, ni_num, phone, cust_id) VALUES ( 
    name_Type(
        'Mrs', 
        'Timi',
        'Cram'), 
    address_Type(
        'Ticket', 
        'Edinburgh', 
        'EH55EE'), 
    'N1085',
    phone_type_table(phone_nested('Mobile','013109128231'),phone_nested('Mobile','070123129812'),phone_nested('Home','0128231001244')),
    '1020'
);

/*Customer account table
*/
INSERT INTO customer_account (cust_id, account_number) VALUES (
    (SELECT REF(c) FROM customer c WHERE cust_id = '1002'),
    (SELECT REF(a) FROM account a WHERE account_number = '1002')
);

INSERT INTO customer_account (cust_id, account_number) VALUES (
    (SELECT REF(c) FROM customer c WHERE cust_id = '1002'),
    (SELECT REF(a) FROM account a WHERE account_number = '1010')
);

INSERT INTO customer_account (cust_id, account_number) VALUES (
    (SELECT REF(c) FROM customer c WHERE cust_id = '1003'),
    (SELECT REF(a) FROM account a WHERE account_number = '1010')
);

INSERT INTO customer_account (cust_id, account_number) VALUES (
    (SELECT REF(c) FROM customer c WHERE cust_id = '1004'),
    (SELECT REF(a) FROM account a WHERE account_number = '8002')
);

INSERT INTO customer_account (cust_id, account_number) VALUES (
    (SELECT REF(c) FROM customer c WHERE cust_id = '1005'),
    (SELECT REF(a) FROM account a WHERE account_number = '1114')
);

INSERT INTO customer_account (cust_id, account_number) VALUES (
    (SELECT REF(c) FROM customer c WHERE cust_id = '1006'),
    (SELECT REF(a) FROM account a WHERE account_number = '1115')
);

INSERT INTO customer_account (cust_id, account_number) VALUES (
    (SELECT REF(c) FROM customer c WHERE cust_id = '1007'),
    (SELECT REF(a) FROM account a WHERE account_number = '1116')
);

INSERT INTO customer_account (cust_id, account_number) VALUES (
    (SELECT REF(c) FROM customer c WHERE cust_id = '1008'),
    (SELECT REF(a) FROM account a WHERE account_number = '1117')
);

INSERT INTO customer_account (cust_id, account_number) VALUES (
    (SELECT REF(c) FROM customer c WHERE cust_id = '1009'),
    (SELECT REF(a) FROM account a WHERE account_number = '1118')
);

INSERT INTO customer_account (cust_id, account_number) VALUES (
    (SELECT REF(c) FROM customer c WHERE cust_id = '1010'),
    (SELECT REF(a) FROM account a WHERE account_number = '1119')
);

INSERT INTO customer_account (cust_id, account_number) VALUES (
    (SELECT REF(c) FROM customer c WHERE cust_id = '1011'),
    (SELECT REF(a) FROM account a WHERE account_number = '1020')
);

INSERT INTO customer_account (cust_id, account_number) VALUES (
    (SELECT REF(c) FROM customer c WHERE cust_id = '1017'),
    (SELECT REF(a) FROM account a WHERE account_number = '1234')
);

INSERT INTO customer_account (cust_id, account_number) VALUES (
    (SELECT REF(c) FROM customer c WHERE cust_id = '1018'),
    (SELECT REF(a) FROM account a WHERE account_number = '1111')
);

INSERT INTO customer_account (cust_id, account_number) VALUES (
    (SELECT REF(c) FROM customer c WHERE cust_id = '1019'),
    (SELECT REF(a) FROM account a WHERE account_number = '1112')
);

INSERT INTO customer_account (cust_id, account_number) VALUES (
    (SELECT REF(c) FROM customer c WHERE cust_id = '1019'),
    (SELECT REF(a) FROM account a WHERE account_number = '1113')
);

INSERT INTO customer_account (cust_id, account_number) VALUES (
    (SELECT REF(c) FROM customer c WHERE cust_id = '1020'),
    (SELECT REF(a) FROM account a WHERE account_number = '1114')
);

INSERT INTO customer_account (cust_id, account_number) VALUES (
    (SELECT REF(c) FROM customer c WHERE cust_id = '1012'),
    (SELECT REF(a) FROM account a WHERE account_number = '1114')
);

INSERT INTO customer_account (cust_id, account_number) VALUES (
    (SELECT REF(c) FROM customer c WHERE cust_id = '1013'),
    (SELECT REF(a) FROM account a WHERE account_number = '1234')
);

INSERT INTO customer_account (cust_id, account_number) VALUES (
    (SELECT REF(c) FROM customer c WHERE cust_id = '1014'),
    (SELECT REF(a) FROM account a WHERE account_number = '1115')
);

INSERT INTO customer_account (cust_id, account_number) VALUES (
    (SELECT REF(c) FROM customer c WHERE cust_id = '1015'),
    (SELECT REF(a) FROM account a WHERE account_number = '1116')
);

/*end
*/