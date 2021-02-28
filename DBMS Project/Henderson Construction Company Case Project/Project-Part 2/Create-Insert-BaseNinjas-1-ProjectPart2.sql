/* ******************************************************************************/
/*	Oracle CREATE - INSERT script 1 for Base Ninjas- Part 2 Project             */
/* ******************************************************************************/

/*	Payroll Management System Tables    */
CREATE TABLE EMPLOYEE(
	EmployeeID			    Int				NOT NULL,
	LastName			    Char(30)		NOT NULL,
	FirstName			    Char(30)		NOT NULL,
	MiddleInitial           Char(1)         NOT NULL,
    EmailID                 Char(30)        NOT NULL,
    DateOfBirth             Char(12)        NOT NULL,
    Ethnicity				Char(12)    	NOT NULL,
    Gender                  Char(10)        NOT NULL,
    MartitalStatus          Char(10)        NOT NULL,
    EEOCode                 Char(5)         NOT NULL,
	CONSTRAINT 			    Employee_PK 	PRIMARY KEY(EmployeeID)
);

CREATE TABLE ADDRESS(
    AddressID               Int             NOT NULL,
    AddressLine             Char(35)		NOT NULL,
    City                    Char(35)		NOT NULL,
    ZIP                     Char(10)		NOT NULL,
    CONSTRAINT 			    Address_PK 	PRIMARY KEY(AddressID)
);

CREATE TABLE STATE(
    StateID                 Int		        NOT NULL,
    StateName               Char(10)		NOT NULL,
    Abbreviation            Char(2)		    DEFAULT 'IN',
    CONSTRAINT 			    State_PK 	    PRIMARY KEY(StateID)
);

CREATE TABLE PROJECT(
	ProjectID			    Int				NOT NULL,
	ProjectDescription	    Char(50)		NOT NULL,
	SiteName		        Char(30)		NOT NULL,
    IsStateProject		    Char(3)		    NOT NULL,
    CONSTRAINT 			    Project_PK 	PRIMARY KEY(ProjectID)
);

CREATE TABLE PROJECTROLE(
	EmployeeID			    Int				NOT NULL,
    ProjectID			    Int				NOT NULL,
	Role            	    Char(30)		NOT NULL,
    CONSTRAINT 			    Projectrole_Employee_FK FOREIGN KEY(EmployeeID) REFERENCES EMPLOYEE(EmployeeID),
    CONSTRAINT 			    Project_Projectrole_FK 	FOREIGN KEY(ProjectID) REFERENCES PROJECT(ProjectID)
);
    
CREATE TABLE STATETAX(
	StateTaxId			    Int				NOT NULL,
	Percentage              Numeric(5,2)	NOT NULL,
    MaxDeduction            char(10)        NOT NULL,
    CONSTRAINT 			    StateTax_PK 	PRIMARY KEY(StateTaxID)
);
    
CREATE TABLE FEDERALTAX(
	FederalTaxId		    Int				NOT NULL,
	Percentage              Numeric(5,2)    NOT NULL,
    MaxDeduction            char(10)        NOT NULL,
    CONSTRAINT 			    FederalTax_PK PRIMARY KEY(FederalTaxID)
);
    
CREATE TABLE JOBTYPE(
	JobTypeID			    Int				NOT NULL,
	JobDescription	        Char(50)		NOT NULL,
    JobSkillCode	        Char(10)		NOT NULL,
	JobClassification	    Char(20)		NOT NULL,
    StatePayRate		    Numeric(9,2)	NOT NULL,
    NonStatePayRate         Numeric(9,2)	NOT NULL,
    Fringe                  Numeric(9,2)    DEFAULT '3.00',
    CONSTRAINT 			    JobType_PK    PRIMARY KEY(JobTypeID)
);

CREATE TABLE TIMESHEET(
	TimesheetID			    Int				NOT NULL,
	TimesheetDate	        Date    		NOT NULL,
	HoursWorked	            Numeric(9,2)	NOT NULL,
    HoursOvertime	        Numeric(9,2)	NOT NULL,
    CONSTRAINT 			    Timesheet_PK  PRIMARY KEY(TimesheetID)
);

CREATE TABLE PAYPERIOD(
	PayPeriodID			    Int				NOT NULL,
	WeekOf	                Date		    NOT NULL,
    PayDate	                Date		    NOT NULL,
    StartDate               Date		    NOT NULL,
	EndDate	                Date        	NOT NULL,
    CONSTRAINT 			    PayPeriod_PK  PRIMARY KEY(PayperiodID)
);

CREATE TABLE EEOCLASSIFICATION(
    EEOCode                 Char(5)         NOT NULL,
    MinorityYesNo           Char(3)         NOT NULL,
    EEODescription          Char(20)        NOT NULL
);


/* INSERT Statements */

/* Table STATE */

INSERT INTO STATE VALUES(1, 'Indiana', 'IN');
INSERT INTO STATE VALUES(2, 'Minnesota', 'MN');

/* Table ADDRESS */

INSERT INTO ADDRESS VALUES(123001, '1253 Chopping Block Lane', 'Knockemstiff', '80286');
INSERT INTO ADDRESS VALUES(123002, '1381 Walter Lane', 'Knockemstiff', '80286');

/* Table EEOCLASSIFICATION */

INSERT INTO EEOCLASSIFICATION VALUES('2', 'Yes', 'Hispanic');
INSERT INTO EEOCLASSIFICATION VALUES('5', 'No', 'Non-Minority(White)');

/* Table EMPLOYEE */

INSERT INTO EMPLOYEE VALUES(390054489, 'Worker', 'James', 'E', 'james.worker@henderson.com', 
       '11-16-1983', 'Hispanic', 'Male', 'Married', '2');
INSERT INTO EMPLOYEE VALUES(275506921, 'Henderson', 'Mary', 'A', 'mary.henderson@henderson.com',
       '05-11-1977', 'Caucasian', 'Female', 'Married', '5');


/* Table PROJECT */

INSERT INTO PROJECT VALUES(335005, 'Replacement of single-span two-lane bridge', 'Pike County', 'YES');
INSERT INTO PROJECT VALUES(335006, 'Repairing the ledge of the two-lane bridge', 'Pike County', 'YES');

/* Table PROJECTROLE */

INSERT INTO PROJECTROLE VALUES(390054489, 335005, 'Labor');
INSERT INTO PROJECTROLE VALUES(390054489, 335005, 'Mason');

/* Table JOBTYPE */

INSERT INTO JOBTYPE VALUES(100, 'Replacement of single-span two-lane bridge', 'LAB', 'Labor', 15.00,
       13.75, 3.00);
INSERT INTO JOBTYPE VALUES(101, 'Paying salaries to workers', 'ACC', 'Accountancy', 20.00,
       15.75, 5.00);

/* Table TIMESHEET */

INSERT INTO TIMESHEET VALUES(1001, '20-OCT-18', 25.00, 1.00);
INSERT INTO TIMESHEET VALUES(1002, '20-OCT-18', 40.00, 4.00);

/* Table STATETAX */

INSERT INTO STATETAX VALUES(885529, 2.93, '23.43');
INSERT INTO STATETAX VALUES(885530, 2.93, '36.88');

/* Table PAYPERIOD */

INSERT INTO PAYPERIOD VALUES(9001, '9-OCT-18', '20-OCT-18', '9-OCT-18', '16-OCT-18');
INSERT INTO PAYPERIOD VALUES(9002, '9-OCT-18', '20-OCT-18', '9-OCT-18', '16-OCT-18');

/* Table FEDERALTAX */

INSERT INTO FEDERALTAX VALUES(10111152, 19.56, '156.20');
INSERT INTO FEDERALTAX VALUES(10111153, 19.56, '177.67');
