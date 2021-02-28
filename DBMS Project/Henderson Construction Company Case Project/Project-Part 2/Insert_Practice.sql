/* Payroll Management System Tables */

/* Table EMPLOYEE */

INSERT INTO EMPLOYEE VALUES(390054489, 'Worker', 'James', 'E', 'james.worker@henderson.com', 
       '11-16-1983', 'Hispanic', 'Male', 'Married', '2');
INSERT INTO EMPLOYEE VALUES(275506921, 'Henderson', 'Mary', 'A', 'mary.henderson@henderson.com',
       '05-11-1977', 'Caucasian', 'Female', 'Married', '5');

/* Table ADDRESS */

INSERT INTO ADDRESS VALUES(123001, '1253 Chopping Block Lane', 'Knockemstiff', '80286');
INSERT INTO ADDRESS VALUES(123002, '1381 Walter Lane', 'Knockemstiff', '80286');

/* Table STATE */

INSERT INTO STATE VALUES(1, 'Indiana', 'IN');
INSERT INTO STATE VALUES(2, 'Minnesota', 'MN');

/* Table PROJECT */

INSERT INTO PROJECT VALUES(335005, 'Replacement of single-span two-lane bridge', 'Pike County', 'YES');
INSERT INTO PROJECT VALUES(335006, 'Repairing the ledge of the two-lane bridge', 'Pike County', 'YES');

/* Table PROJECTROLE */

INSERT INTO PROJECTROLE VALUES(390054489, 335005, 'Labor');
INSERT INTO PROJECTROLE VALUES(390054489, 335005, 'Mason');


/* Table STATETAX */

INSERT INTO STATETAX VALUES(885529, 2.93, '23.43');
INSERT INTO STATETAX VALUES(885530, 2.93, '36.88');


/* Table FEDERALTAX */

INSERT INTO FEDERALTAX VALUES(10111152, 19.56, '156.20');
INSERT INTO FEDERALTAX VALUES(10111153, 19.56, '177.67');

/* Table JOBTYPE */

INSERT INTO JOBTYPE VALUES(100, 'Replacement of single-span two-lane bridge', 'LAB', 'Labor', 15.00,
       13.75, 3.00);
INSERT INTO JOBTYPE VALUES(101, 'Paying salaries to workers', 'ACC', 'Accountancy', 20.00,
       15.75, 5.00);

/* Table TIMESHEET */

INSERT INTO TIMESHEET VALUES(1001, '20-OCT-18', 25.00, 1.00);
INSERT INTO TIMESHEET VALUES(1002, '20-OCT-18', 40.00, 4.00);

/* Table PAYPERIOD */

INSERT INTO PAYPERIOD VALUES(9001, '9-OCT-18', '20-OCT-18', '9-OCT-18', '16-OCT-18');
INSERT INTO PAYPERIOD VALUES(9002, '9-OCT-18', '20-OCT-18', '9-OCT-18', '16-OCT-18');


/* Table EEOCLASSIFICATION */

INSERT INTO EEOCLASSIFICATION VALUES('2', 'Yes', 'Hispanic');
INSERT INTO EEOCLASSIFICATION VALUES('5', 'No', 'Non-Minority(White)');


/* Inventory System Tables */

/* Table PROJECT */

INSERT INTO PROJECT VALUES(335005, 'Replacement of single-span two-lane bridge', 'Pike County', 'YES');
INSERT INTO PROJECT VALUES(335006, 'Repairing the ledge of the two-lane bridge', 'Pike County', 'YES');

/* Table INVENTORYITEM */

INSERT INTO INVENTORYITEM VALUES(501, '10-MAY-11', 'Good');
INSERT INTO INVENTORYITEM VALUES(502, '14-NOV-12', 'Bad');


/* Table MAINTENANCE */

INSERT INTO MAINTENANCE VALUES(201, '22-SEP-18', '22-OCT-18', 'Not Clean', 'Need to be cleaned soon');
INSERT INTO MAINTENANCE VALUES(202, '5-SEP-18', '5-NOV-18', 'Clean', 'Cleaning not required');

/* Table INVENORYTRACKING */

INSERT INTO INVENTORYTRACKING VALUES(2001, '18-OCT-18', 'Pike County');
INSERT INTO INVENTORYTRACKING VALUES(2002, '19-OCT-18', 'Head Office');

/* Table ITEMCATEGORY */

INSERT INTO ITEMCATEGORY VALUES(10, 'Screwdriver', 'Stainless with yellow handle', 'Stanley', '2010', 'held by handle');
INSERT INTO ITEMCATEGORY VALUES(11, 'Stapler', 'Stainless with blue outer body', 'Staples', '4TZ', 'held with thumb on outer body');


/* Table SUPPLIER */

INSERT INTO SUPPLIER VALUES(1111, 'Joe Cememts');
INSERT INTO SUPPLIER VALUES(1112, 'Indiana Pliers');


/* Table ADDRESS */

INSERT INTO ADDRESS VALUES(123001, '1253 Chopping Block Lane', 'Knockemstiff', '80286');
INSERT INTO ADDRESS VALUES(123002, '1381 Walter Lane', 'Knockemstiff', '80286');

