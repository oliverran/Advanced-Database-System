--------------------------------------------------------
--  File created - Friday-March-08-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table EMPLOYEE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."EMPLOYEE" OF "SYSTEM"."EMPLOYEE_INFO_TYPE" 
 OIDINDEX  ( PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ) 
 PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 NESTED TABLE TREAT("ADDRESS" AS "BRANCH_TYPE")."PHONE" STORE AS "SYSNT4qBTGmMXR2GK18Rwzkqlig=="
 (PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ) RETURN AS VALUE
 NESTED TABLE "PHONE" STORE AS "EMP_PHONE_NESTED_TABLE"
 (PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ) RETURN AS VALUE;
REM INSERTING into SYSTEM.EMPLOYEE
SET DEFINE OFF;
Insert into SYSTEM.EMPLOYEE (NAME,ADDRESS,NI_NUM,PHONE,EMP_ID,JOIN_DATE,BRANCH_ID,POSITION,SUPERVISOR_ID) values (SYSTEM.NAME_TYPE('Mrs', 'Alisa', 'Smith'),SYSTEM.ADDRESS_TYPE('Colinton', 'Edinburgh', 'EH105TT'),'N1001',SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED('Mobile', '01312125555'), SYSTEM.PHONE_NESTED('Mobile', '07705623443'), SYSTEM.PHONE_NESTED('Home', '07907812345')),'101',to_date('01-FEB-06','DD-MON-RR'),'SYSTEM.BRANCH_TYPE(''colinton st.'', ''Edinbutgh'', ''EH11 5DT'', ''901'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''branch'', ''00712345678'')))','SYSTEM.JOB_TYPE(''001'', ''Head'', 100000)',null);
Insert into SYSTEM.EMPLOYEE (NAME,ADDRESS,NI_NUM,PHONE,EMP_ID,JOIN_DATE,BRANCH_ID,POSITION,SUPERVISOR_ID) values (SYSTEM.NAME_TYPE('Mr', 'John', 'William'),SYSTEM.ADDRESS_TYPE('New', 'Edinburgh', 'EH24AB'),'N1010',SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED('Mobile', '01312031990'), SYSTEM.PHONE_NESTED('Mobile', '07902314551'), SYSTEM.PHONE_NESTED('Home', '07701234567')),'105',to_date('04-MAR-07','DD-MON-RR'),'SYSTEM.BRANCH_TYPE(''colinton st.'', ''Edinbutgh'', ''EH11 5DT'', ''901'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''branch'', ''00712345678'')))','SYSTEM.JOB_TYPE(''002'', ''Manager'', 75000)','SYSTEM.EMPLOYEE_INFO_TYPE(SYSTEM.NAME_TYPE(''Mrs'', ''Alisa'', ''Smith''), SYSTEM.ADDRESS_TYPE(''Colinton'', ''Edinburgh'', ''EH105TT''), ''N1001'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''Mobile'', ''01312125555''), SYSTEM.PHONE_NESTED(''Mobile'', ''07705623443''), SYSTEM.PHONE_NESTED(''Home'', ''07907812345'')), ''101'', ''2006-02-01 00:00:00.0'', ''oracle.sql.REF@b1e47e0'', ''oracle.sql.REF@559e46cc'', NULL)');
Insert into SYSTEM.EMPLOYEE (NAME,ADDRESS,NI_NUM,PHONE,EMP_ID,JOIN_DATE,BRANCH_ID,POSITION,SUPERVISOR_ID) values (SYSTEM.NAME_TYPE('Mr', 'Mark', 'Slack'),SYSTEM.ADDRESS_TYPE('Old', 'Edinburgh', 'EH94BB'),'N1120',SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED('Mobile', '01312102211'), SYSTEM.PHONE_NESTED('Mobile', NULL), SYSTEM.PHONE_NESTED('Home', NULL)),'108',to_date('01-FEB-10','DD-MON-RR'),'SYSTEM.BRANCH_TYPE(''colinton st.'', ''Edinbutgh'', ''EH11 5DT'', ''901'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''branch'', ''00712345678'')))','SYSTEM.JOB_TYPE(''004'', ''Accountant'', 35000)','SYSTEM.EMPLOYEE_INFO_TYPE(SYSTEM.NAME_TYPE(''Mr'', ''John'', ''William''), SYSTEM.ADDRESS_TYPE(''New'', ''Edinburgh'', ''EH24AB''), ''N1010'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''Mobile'', ''01312031990''), SYSTEM.PHONE_NESTED(''Mobile'', ''07902314551''), SYSTEM.PHONE_NESTED(''Home'', ''07701234567'')), ''105'', ''2007-03-04 00:00:00.0'', ''oracle.sql.REF@b1e47e0'', ''oracle.sql.REF@7a6942e4'', ''oracle.sql.REF@eabe4139'')');
Insert into SYSTEM.EMPLOYEE (NAME,ADDRESS,NI_NUM,PHONE,EMP_ID,JOIN_DATE,BRANCH_ID,POSITION,SUPERVISOR_ID) values (SYSTEM.NAME_TYPE('Mr', 'WEIGUANG', 'RAN'),SYSTEM.ADDRESS_TYPE('ParkheadAvenue', 'Edinburgh', 'EH114SE'),'N1002',SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED('Mobile', '07702840687'), SYSTEM.PHONE_NESTED('Mobile', NULL), SYSTEM.PHONE_NESTED('Home', NULL)),'666',to_date('11-NOV-11','DD-MON-RR'),'SYSTEM.BRANCH_TYPE(''Qinling St.'', ''Zhengzhou'', ''450001'', ''912'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''branch'', ''08618532109175'')))','SYSTEM.JOB_TYPE(''002'', ''Manager'', 75000)','SYSTEM.EMPLOYEE_INFO_TYPE(SYSTEM.NAME_TYPE(''Mrs'', ''Alisa'', ''Smith''), SYSTEM.ADDRESS_TYPE(''Colinton'', ''Edinburgh'', ''EH105TT''), ''N1001'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''Mobile'', ''01312125555''), SYSTEM.PHONE_NESTED(''Mobile'', ''07705623443''), SYSTEM.PHONE_NESTED(''Home'', ''07907812345'')), ''101'', ''2006-02-01 00:00:00.0'', ''oracle.sql.REF@b1e47e0'', ''oracle.sql.REF@559e46cc'', NULL)');
Insert into SYSTEM.EMPLOYEE (NAME,ADDRESS,NI_NUM,PHONE,EMP_ID,JOIN_DATE,BRANCH_ID,POSITION,SUPERVISOR_ID) values (SYSTEM.NAME_TYPE('Mrs', 'July', 'William'),SYSTEM.ADDRESS_TYPE('Old', 'Glasglow', 'GG14EE'),'N1004',SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED('Mobile', '01312341241'), SYSTEM.PHONE_NESTED('Mobile', NULL), SYSTEM.PHONE_NESTED('Home', NULL)),'801',to_date('04-MAR-07','DD-MON-RR'),'SYSTEM.BRANCH_TYPE(''Ford st.'', ''Edinburgh'', ''EH8 2SE'', ''908'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''branch'', ''07798754671'')))','SYSTEM.JOB_TYPE(''002'', ''Manager'', 75000)',null);
Insert into SYSTEM.EMPLOYEE (NAME,ADDRESS,NI_NUM,PHONE,EMP_ID,JOIN_DATE,BRANCH_ID,POSITION,SUPERVISOR_ID) values (SYSTEM.NAME_TYPE('Mr', 'Jack', 'Smith'),SYSTEM.ADDRESS_TYPE('Adam', 'Edinburgh', 'EH28XN'),'N1003',SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED('Mobile', '01311112223'), SYSTEM.PHONE_NESTED('Mobile', '0781209890'), SYSTEM.PHONE_NESTED('Home', NULL)),'802',to_date('05-FEB-14','DD-MON-RR'),'SYSTEM.BRANCH_TYPE(''Ford st.'', ''Edinburgh'', ''EH8 2SE'', ''908'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''branch'', ''07798754671'')))','SYSTEM.JOB_TYPE(''003'', ''Project Leader'', 50000)','SYSTEM.EMPLOYEE_INFO_TYPE(SYSTEM.NAME_TYPE(''Mrs'', ''July'', ''William''), SYSTEM.ADDRESS_TYPE(''Old'', ''Glasglow'', ''GG14EE''), ''N1004'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''Mobile'', ''01312341241''), SYSTEM.PHONE_NESTED(''Mobile'', NULL), SYSTEM.PHONE_NESTED(''Home'', NULL)), ''801'', ''2007-03-04 00:00:00.0'', ''oracle.sql.REF@e8914567'', ''oracle.sql.REF@7a6942e4'', NULL)');
Insert into SYSTEM.EMPLOYEE (NAME,ADDRESS,NI_NUM,PHONE,EMP_ID,JOIN_DATE,BRANCH_ID,POSITION,SUPERVISOR_ID) values (SYSTEM.NAME_TYPE('Mr', 'Peter', 'Bill'),SYSTEM.ADDRESS_TYPE('York', 'Edinburgh', 'EH43AB'),'N1005',SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED('Mobile', '01314512313'), SYSTEM.PHONE_NESTED('Mobile', NULL), SYSTEM.PHONE_NESTED('Home', '07704567123')),'206',to_date('07-JUN-14','DD-MON-RR'),'SYSTEM.BRANCH_TYPE(''Queen st.'', ''Edinburgh'', ''EH6 5EE'', ''905'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''branch'', ''07756734561'')))','SYSTEM.JOB_TYPE(''004'', ''Accountant'', 35000)',null);
Insert into SYSTEM.EMPLOYEE (NAME,ADDRESS,NI_NUM,PHONE,EMP_ID,JOIN_DATE,BRANCH_ID,POSITION,SUPERVISOR_ID) values (SYSTEM.NAME_TYPE('Mr', 'Bush', 'Simon'),SYSTEM.ADDRESS_TYPE('Shenzhen', 'London', '11QE'),'N1007',SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED('Mobile', '01314512313'), SYSTEM.PHONE_NESTED('Mobile', '0790342153212'), SYSTEM.PHONE_NESTED('Home', '07700987651')),'203',to_date('04-MAR-07','DD-MON-RR'),'SYSTEM.BRANCH_TYPE(''Queen st.'', ''Edinburgh'', ''EH6 5EE'', ''905'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''branch'', ''07756734561'')))','SYSTEM.JOB_TYPE(''003'', ''Project Leader'', 50000)',null);
Insert into SYSTEM.EMPLOYEE (NAME,ADDRESS,NI_NUM,PHONE,EMP_ID,JOIN_DATE,BRANCH_ID,POSITION,SUPERVISOR_ID) values (SYSTEM.NAME_TYPE('Mr', 'Yifu', 'Lai'),SYSTEM.ADDRESS_TYPE('Fountainpark', 'Edinburgh', 'EH11 5ER'),'N1008',SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED('Mobile', '013123412345'), SYSTEM.PHONE_NESTED('Mobile', NULL), SYSTEM.PHONE_NESTED('Home', NULL)),'202',to_date('13-SEP-12','DD-MON-RR'),'SYSTEM.BRANCH_TYPE(''Queen st.'', ''Edinburgh'', ''EH6 5EE'', ''905'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''branch'', ''07756734561'')))','SYSTEM.JOB_TYPE(''002'', ''Manager'', 75000)','SYSTEM.EMPLOYEE_INFO_TYPE(SYSTEM.NAME_TYPE(''Mrs'', ''Alisa'', ''Smith''), SYSTEM.ADDRESS_TYPE(''Colinton'', ''Edinburgh'', ''EH105TT''), ''N1001'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''Mobile'', ''01312125555''), SYSTEM.PHONE_NESTED(''Mobile'', ''07705623443''), SYSTEM.PHONE_NESTED(''Home'', ''07907812345'')), ''101'', ''2006-02-01 00:00:00.0'', ''oracle.sql.REF@b1e47e0'', ''oracle.sql.REF@559e46cc'', NULL)');
Insert into SYSTEM.EMPLOYEE (NAME,ADDRESS,NI_NUM,PHONE,EMP_ID,JOIN_DATE,BRANCH_ID,POSITION,SUPERVISOR_ID) values (SYSTEM.NAME_TYPE('Mr', 'Shaozhuo', 'Li'),SYSTEM.ADDRESS_TYPE('Fountainpark', 'Edinburgh', 'EH115ER'),'N1009',SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED('Mobile', '013109712351'), SYSTEM.PHONE_NESTED('Mobile', '079043123512'), SYSTEM.PHONE_NESTED('Home', NULL)),'302',to_date('04-MAR-07','DD-MON-RR'),'SYSTEM.BRANCH_TYPE(''King st.'', ''Edinburgh'', ''EH3 5AR'', ''911'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''branch'', ''013198745612'')))','SYSTEM.JOB_TYPE(''002'', ''Manager'', 75000)','SYSTEM.EMPLOYEE_INFO_TYPE(SYSTEM.NAME_TYPE(''Mrs'', ''Alisa'', ''Smith''), SYSTEM.ADDRESS_TYPE(''Colinton'', ''Edinburgh'', ''EH105TT''), ''N1001'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''Mobile'', ''01312125555''), SYSTEM.PHONE_NESTED(''Mobile'', ''07705623443''), SYSTEM.PHONE_NESTED(''Home'', ''07907812345'')), ''101'', ''2006-02-01 00:00:00.0'', ''oracle.sql.REF@b1e47e0'', ''oracle.sql.REF@559e46cc'', NULL)');
Insert into SYSTEM.EMPLOYEE (NAME,ADDRESS,NI_NUM,PHONE,EMP_ID,JOIN_DATE,BRANCH_ID,POSITION,SUPERVISOR_ID) values (SYSTEM.NAME_TYPE('Mr', 'Yuli', 'Yang'),SYSTEM.ADDRESS_TYPE('Fountainpark', 'Edinburgh', 'EH115ER'),'N1011',SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED('Mobile', '013104412434'), SYSTEM.PHONE_NESTED('Mobile', NULL), SYSTEM.PHONE_NESTED('Home', NULL)),'402',to_date('15-JAN-14','DD-MON-RR'),'SYSTEM.BRANCH_TYPE(''Qinling St.'', ''Zhengzhou'', ''450001'', ''912'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''branch'', ''08618532109175'')))','SYSTEM.JOB_TYPE(''002'', ''Manager'', 75000)','SYSTEM.EMPLOYEE_INFO_TYPE(SYSTEM.NAME_TYPE(''Mrs'', ''Alisa'', ''Smith''), SYSTEM.ADDRESS_TYPE(''Colinton'', ''Edinburgh'', ''EH105TT''), ''N1001'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''Mobile'', ''01312125555''), SYSTEM.PHONE_NESTED(''Mobile'', ''07705623443''), SYSTEM.PHONE_NESTED(''Home'', ''07907812345'')), ''101'', ''2006-02-01 00:00:00.0'', ''oracle.sql.REF@b1e47e0'', ''oracle.sql.REF@559e46cc'', NULL)');
Insert into SYSTEM.EMPLOYEE (NAME,ADDRESS,NI_NUM,PHONE,EMP_ID,JOIN_DATE,BRANCH_ID,POSITION,SUPERVISOR_ID) values (SYSTEM.NAME_TYPE('Mr', 'Kai', 'Fan'),SYSTEM.ADDRESS_TYPE('Fountainpark', 'Edinburgh', 'EH115ER'),'N1012',SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED('Mobile', '013109812312'), SYSTEM.PHONE_NESTED('Mobile', '079051234091'), SYSTEM.PHONE_NESTED('Home', NULL)),'502',to_date('15-MAR-17','DD-MON-RR'),'SYSTEM.BRANCH_TYPE(''Futian st.'', ''Glasglow'', ''450002'', ''913'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''branch'', ''00861324243123'')))','SYSTEM.JOB_TYPE(''002'', ''Manager'', 75000)','SYSTEM.EMPLOYEE_INFO_TYPE(SYSTEM.NAME_TYPE(''Mrs'', ''Alisa'', ''Smith''), SYSTEM.ADDRESS_TYPE(''Colinton'', ''Edinburgh'', ''EH105TT''), ''N1001'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''Mobile'', ''01312125555''), SYSTEM.PHONE_NESTED(''Mobile'', ''07705623443''), SYSTEM.PHONE_NESTED(''Home'', ''07907812345'')), ''101'', ''2006-02-01 00:00:00.0'', ''oracle.sql.REF@b1e47e0'', ''oracle.sql.REF@559e46cc'', NULL)');
Insert into SYSTEM.EMPLOYEE (NAME,ADDRESS,NI_NUM,PHONE,EMP_ID,JOIN_DATE,BRANCH_ID,POSITION,SUPERVISOR_ID) values (SYSTEM.NAME_TYPE('Mr', 'Yue', 'Zhao'),SYSTEM.ADDRESS_TYPE('Fountainpark', 'Edinburgh', 'EH115ER'),'N1013',SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED('Mobile', '01310981243'), SYSTEM.PHONE_NESTED('Mobile', NULL), SYSTEM.PHONE_NESTED('Home', NULL)),'602',to_date('15-DEC-07','DD-MON-RR'),'SYSTEM.BRANCH_TYPE(''Wenhua st.'', ''Beijing'', ''400000'', ''914'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''branch'', ''00861234567'')))','SYSTEM.JOB_TYPE(''002'', ''Manager'', 75000)','SYSTEM.EMPLOYEE_INFO_TYPE(SYSTEM.NAME_TYPE(''Mrs'', ''Alisa'', ''Smith''), SYSTEM.ADDRESS_TYPE(''Colinton'', ''Edinburgh'', ''EH105TT''), ''N1001'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''Mobile'', ''01312125555''), SYSTEM.PHONE_NESTED(''Mobile'', ''07705623443''), SYSTEM.PHONE_NESTED(''Home'', ''07907812345'')), ''101'', ''2006-02-01 00:00:00.0'', ''oracle.sql.REF@b1e47e0'', ''oracle.sql.REF@559e46cc'', NULL)');
Insert into SYSTEM.EMPLOYEE (NAME,ADDRESS,NI_NUM,PHONE,EMP_ID,JOIN_DATE,BRANCH_ID,POSITION,SUPERVISOR_ID) values (SYSTEM.NAME_TYPE('Mrs', 'Lily', 'Wu'),SYSTEM.ADDRESS_TYPE('Mary', 'Edinburgh', 'EH45ET'),'N1014',SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED('Mobile', NULL), SYSTEM.PHONE_NESTED('Mobile', NULL), SYSTEM.PHONE_NESTED('Home', '071231324124')),'107',to_date('14-MAY-15','DD-MON-RR'),'SYSTEM.BRANCH_TYPE(''colinton st.'', ''Edinbutgh'', ''EH11 5DT'', ''901'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''branch'', ''00712345678'')))','SYSTEM.JOB_TYPE(''005'', ''Cashier'', 25000)','SYSTEM.EMPLOYEE_INFO_TYPE(SYSTEM.NAME_TYPE(''Mrs'', ''Alisa'', ''Smith''), SYSTEM.ADDRESS_TYPE(''Colinton'', ''Edinburgh'', ''EH105TT''), ''N1001'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''Mobile'', ''01312125555''), SYSTEM.PHONE_NESTED(''Mobile'', ''07705623443''), SYSTEM.PHONE_NESTED(''Home'', ''07907812345'')), ''101'', ''2006-02-01 00:00:00.0'', ''oracle.sql.REF@b1e47e0'', ''oracle.sql.REF@559e46cc'', NULL)');
Insert into SYSTEM.EMPLOYEE (NAME,ADDRESS,NI_NUM,PHONE,EMP_ID,JOIN_DATE,BRANCH_ID,POSITION,SUPERVISOR_ID) values (SYSTEM.NAME_TYPE('Mrs', 'Angela', 'Baby'),SYSTEM.ADDRESS_TYPE('Ford', 'London', '15GR'),'N1015',SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED('Mobile', '00861351231241'), SYSTEM.PHONE_NESTED('Mobile', NULL), SYSTEM.PHONE_NESTED('Home', NULL)),'204',to_date('04-MAR-07','DD-MON-RR'),'SYSTEM.BRANCH_TYPE(''Queen st.'', ''Edinburgh'', ''EH6 5EE'', ''905'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''branch'', ''07756734561'')))','SYSTEM.JOB_TYPE(''004'', ''Accountant'', 35000)','SYSTEM.EMPLOYEE_INFO_TYPE(SYSTEM.NAME_TYPE(''Mr'', ''Yifu'', ''Lai''), SYSTEM.ADDRESS_TYPE(''Fountainpark'', ''Edinburgh'', ''EH11 5ER''), ''N1008'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''Mobile'', ''013123412345''), SYSTEM.PHONE_NESTED(''Mobile'', NULL), SYSTEM.PHONE_NESTED(''Home'', NULL)), ''202'', ''2012-09-13 00:00:00.0'', ''oracle.sql.REF@2d394cf7'', ''oracle.sql.REF@7a6942e4'', ''oracle.sql.REF@eabe4139'')');
Insert into SYSTEM.EMPLOYEE (NAME,ADDRESS,NI_NUM,PHONE,EMP_ID,JOIN_DATE,BRANCH_ID,POSITION,SUPERVISOR_ID) values (SYSTEM.NAME_TYPE('Mrs', 'Nazha', 'Guli'),SYSTEM.ADDRESS_TYPE('Mercy', 'Dumdee', 'BE115RE'),'N1016',SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED('Mobile', '013109712314'), SYSTEM.PHONE_NESTED('Mobile', '07012341791'), SYSTEM.PHONE_NESTED('Home', '070124123589')),'303',to_date('05-JUL-16','DD-MON-RR'),'SYSTEM.BRANCH_TYPE(''King st.'', ''Edinburgh'', ''EH3 5AR'', ''911'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''branch'', ''013198745612'')))','SYSTEM.JOB_TYPE(''005'', ''Cashier'', 25000)','SYSTEM.EMPLOYEE_INFO_TYPE(SYSTEM.NAME_TYPE(''Mr'', ''Shaozhuo'', ''Li''), SYSTEM.ADDRESS_TYPE(''Fountainpark'', ''Edinburgh'', ''EH115ER''), ''N1009'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''Mobile'', ''013109712351''), SYSTEM.PHONE_NESTED(''Mobile'', ''079043123512''), SYSTEM.PHONE_NESTED(''Home'', NULL)), ''302'', ''2007-03-04 00:00:00.0'', ''oracle.sql.REF@53a04f0d'', ''oracle.sql.REF@7a6942e4'', ''oracle.sql.REF@eabe4139'')');
Insert into SYSTEM.EMPLOYEE (NAME,ADDRESS,NI_NUM,PHONE,EMP_ID,JOIN_DATE,BRANCH_ID,POSITION,SUPERVISOR_ID) values (SYSTEM.NAME_TYPE('Mrs', 'Ying', 'Han'),SYSTEM.ADDRESS_TYPE('Mill', 'Cambridge', 'NQ15ER'),'N1017',SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED('Mobile', '077123651234'), SYSTEM.PHONE_NESTED('Mobile', '07905123510'), SYSTEM.PHONE_NESTED('Home', NULL)),'304',to_date('15-AUG-16','DD-MON-RR'),'SYSTEM.BRANCH_TYPE(''King st.'', ''Edinburgh'', ''EH3 5AR'', ''911'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''branch'', ''013198745612'')))','SYSTEM.JOB_TYPE(''004'', ''Accountant'', 35000)','SYSTEM.EMPLOYEE_INFO_TYPE(SYSTEM.NAME_TYPE(''Mr'', ''Shaozhuo'', ''Li''), SYSTEM.ADDRESS_TYPE(''Fountainpark'', ''Edinburgh'', ''EH115ER''), ''N1009'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''Mobile'', ''013109712351''), SYSTEM.PHONE_NESTED(''Mobile'', ''079043123512''), SYSTEM.PHONE_NESTED(''Home'', NULL)), ''302'', ''2007-03-04 00:00:00.0'', ''oracle.sql.REF@53a04f0d'', ''oracle.sql.REF@7a6942e4'', ''oracle.sql.REF@eabe4139'')');
Insert into SYSTEM.EMPLOYEE (NAME,ADDRESS,NI_NUM,PHONE,EMP_ID,JOIN_DATE,BRANCH_ID,POSITION,SUPERVISOR_ID) values (SYSTEM.NAME_TYPE('Mrs', 'Swift', 'Tayor'),SYSTEM.ADDRESS_TYPE('Wool', 'Edinburgh', 'EH43WE'),'N1018',SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED('Mobile', '0131018235123'), SYSTEM.PHONE_NESTED('Mobile', NULL), SYSTEM.PHONE_NESTED('Home', NULL)),'403',to_date('12-JUN-13','DD-MON-RR'),'SYSTEM.BRANCH_TYPE(''Qinling St.'', ''Zhengzhou'', ''450001'', ''912'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''branch'', ''08618532109175'')))','SYSTEM.JOB_TYPE(''005'', ''Cashier'', 25000)','SYSTEM.EMPLOYEE_INFO_TYPE(SYSTEM.NAME_TYPE(''Mr'', ''Yuli'', ''Yang''), SYSTEM.ADDRESS_TYPE(''Fountainpark'', ''Edinburgh'', ''EH115ER''), ''N1011'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''Mobile'', ''013104412434''), SYSTEM.PHONE_NESTED(''Mobile'', NULL), SYSTEM.PHONE_NESTED(''Home'', NULL)), ''402'', ''2014-01-15 00:00:00.0'', ''oracle.sql.REF@1e314178'', ''oracle.sql.REF@7a6942e4'', ''oracle.sql.REF@eabe4139'')');
Insert into SYSTEM.EMPLOYEE (NAME,ADDRESS,NI_NUM,PHONE,EMP_ID,JOIN_DATE,BRANCH_ID,POSITION,SUPERVISOR_ID) values (SYSTEM.NAME_TYPE('Mrs', 'Gaga', 'Lady'),SYSTEM.ADDRESS_TYPE('nill', 'Edinburgh', 'EH64WE'),'N1019',SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED('Mobile', '013512601921'), SYSTEM.PHONE_NESTED('Mobile', NULL), SYSTEM.PHONE_NESTED('Home', NULL)),'404',to_date('16-JUN-15','DD-MON-RR'),'SYSTEM.BRANCH_TYPE(''Futian st.'', ''Glasglow'', ''450002'', ''913'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''branch'', ''00861324243123'')))','SYSTEM.JOB_TYPE(''005'', ''Cashier'', 25000)','SYSTEM.EMPLOYEE_INFO_TYPE(SYSTEM.NAME_TYPE(''Mr'', ''Yuli'', ''Yang''), SYSTEM.ADDRESS_TYPE(''Fountainpark'', ''Edinburgh'', ''EH115ER''), ''N1011'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''Mobile'', ''013104412434''), SYSTEM.PHONE_NESTED(''Mobile'', NULL), SYSTEM.PHONE_NESTED(''Home'', NULL)), ''402'', ''2014-01-15 00:00:00.0'', ''oracle.sql.REF@1e314178'', ''oracle.sql.REF@7a6942e4'', ''oracle.sql.REF@eabe4139'')');
Insert into SYSTEM.EMPLOYEE (NAME,ADDRESS,NI_NUM,PHONE,EMP_ID,JOIN_DATE,BRANCH_ID,POSITION,SUPERVISOR_ID) values (SYSTEM.NAME_TYPE('Mrs', 'Billie', 'Lemon'),SYSTEM.ADDRESS_TYPE('Hero', 'Glawsgow', 'E12R12'),'N1020',SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED('Mobile', '013151461321'), SYSTEM.PHONE_NESTED('Mobile', NULL), SYSTEM.PHONE_NESTED('Home', NULL)),'405',to_date('16-AUG-15','DD-MON-RR'),'SYSTEM.BRANCH_TYPE(''Wenhua st.'', ''Beijing'', ''400000'', ''914'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''branch'', ''00861234567'')))','SYSTEM.JOB_TYPE(''005'', ''Cashier'', 25000)','SYSTEM.EMPLOYEE_INFO_TYPE(SYSTEM.NAME_TYPE(''Mr'', ''Yuli'', ''Yang''), SYSTEM.ADDRESS_TYPE(''Fountainpark'', ''Edinburgh'', ''EH115ER''), ''N1011'', SYSTEM.PHONE_TYPE_TABLE(SYSTEM.PHONE_NESTED(''Mobile'', ''013104412434''), SYSTEM.PHONE_NESTED(''Mobile'', NULL), SYSTEM.PHONE_NESTED(''Home'', NULL)), ''402'', ''2014-01-15 00:00:00.0'', ''oracle.sql.REF@1e314178'', ''oracle.sql.REF@7a6942e4'', ''oracle.sql.REF@eabe4139'')');
--------------------------------------------------------
--  DDL for Index EMPID
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."EMPID" ON "SYSTEM"."EMPLOYEE" ("EMP_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007007
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007007" ON "SYSTEM"."EMPLOYEE" ("SYS_NC0001600017$") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007008
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007008" ON "SYSTEM"."EMPLOYEE" ("SYS_NC0001300014$") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007009
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007009" ON "SYSTEM"."EMPLOYEE" ("SYS_NC_OID$") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index NINUM
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."NINUM" ON "SYSTEM"."EMPLOYEE" ("NI_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table EMPLOYEE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."EMPLOYEE" ADD CONSTRAINT "NINUM" UNIQUE ("NI_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."EMPLOYEE" ADD UNIQUE ("SYS_NC_OID$")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."EMPLOYEE" ADD UNIQUE (TREAT("ADDRESS" AS "BRANCH_TYPE")."PHONE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."EMPLOYEE" ADD UNIQUE ("PHONE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."EMPLOYEE" ADD CONSTRAINT "EMPID" PRIMARY KEY ("EMP_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."EMPLOYEE" ADD CONSTRAINT "SURNAME" CHECK (name.surname IS NOT NULL) ENABLE;
  ALTER TABLE "SYSTEM"."EMPLOYEE" ADD CONSTRAINT "POSITION" CHECK (position IS NOT NULL) ENABLE;
  ALTER TABLE "SYSTEM"."EMPLOYEE" ADD CONSTRAINT "JOINDATE" CHECK (join_date IS NOT NULL) ENABLE;
  ALTER TABLE "SYSTEM"."EMPLOYEE" ADD CONSTRAINT "PHONENUMBER" CHECK (phone IS NOT NULL) ENABLE;
  ALTER TABLE "SYSTEM"."EMPLOYEE" ADD CONSTRAINT "BRANCHID" CHECK (branch_id IS NOT NULL) ENABLE;