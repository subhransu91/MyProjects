DROP TABLE PROJECTROLE;

DROP TABLE EMPLOYEE;

DROP TABLE ADDRESS;

CREATE TABLE ADDRESS( 
    AddressID               Int             NOT NULL, 
    AddressLine             Char(35)		NOT NULL, 
    City                    Char(35)		NOT NULL, 
    ZIP                     Char(10)		NOT NULL,
    StateID                 Int		        NOT NULL,                 
    CONSTRAINT 			    Address_PK 	PRIMARY KEY(AddressID),
    CONSTRAINT              Address_State_FK FOREIGN KEY(StateID) REFERENCES State(StateID)
);

CREATE TABLE EMPLOYEE( 
	EmployeeID			    Int				NOT NULL, 
	LastName			    Char(30)		NOT NULL, 
	FirstName			    Char(30)		NOT NULL, 
	MiddleInitial           Char(1)         NOT NULL, 
    EmailID                 Char(30)        NOT NULL, 
	Phone					Char(15)		NOT NULL,
    DateOfBirth             Char(12)        NOT NULL, 
    Ethnicity				Char(12)    	NOT NULL, 
    Gender                  Char(10)        NOT NULL, 
    MartitalStatus          Char(10)        NOT NULL, 
    SSN                     Int             NOT NULL,
    AddressID               Int             NOT NULL,
	CONSTRAINT 			    Employee_PK 	PRIMARY KEY(EmployeeID),
	CONSTRAINT              Address_FK FOREIGN KEY(AddressID) REFERENCES Address(AddressID)
);

CREATE TABLE PROJECTROLE( 
	EmployeeID			    Int				NOT NULL, 
    ProjectID			    Int				NOT NULL, 
	Role            	    Char(30)		NOT NULL, 
    CONSTRAINT 			    Projectrole_Employee_FK FOREIGN KEY(EmployeeID) REFERENCES EMPLOYEE(EmployeeID), 
    CONSTRAINT 			    Project_Projectrole_FK 	FOREIGN KEY(ProjectID) REFERENCES PROJECT(ProjectID) 
);

INSERT INTO ADDRESS VALUES(123001, '1253 Chopping Block Lane', 'Knockemstiff', '80286', 1);
INSERT INTO ADDRESS VALUES(123002, '1381 Walter Lane', 'Knockemstiff', '80286', 1);

INSERT INTO EMPLOYEE VALUES(390054489, 'Worker', 'James', 'E', 'james.worker@henderson.com', '555-4897',
       '11-16-1983', 'Hispanic', 'Male', 'Married', 390054489, 123001);
INSERT INTO EMPLOYEE VALUES(275506921, 'Henderson', 'Mary', 'A', 'mary.henderson@henderson.com', '555-5565',
       '05-11-1977', 'Caucasian', 'Female', 'Married', 390054489, 123002);

INSERT INTO PROJECTROLE VALUES(390054489, 335005, 'Labor');
INSERT INTO PROJECTROLE VALUES(390054489, 335005, 'Mason');

DROP TABLE PROJECTROLE;

DROP TABLE PROJECT;

CREATE TABLE PROJECT( 
	ProjectID			    Int				NOT NULL, 
	ProjectDescription	    Char(50)		NOT NULL, 
	SiteName		        Char(30)		NOT NULL, 
    IsStateProject		    Char(3)		    NOT NULL, 
    AddressID               Int             NOT NULL,
    CONSTRAINT 			    Project_PK 	PRIMARY KEY(ProjectID),
    CONSTRAINT              Project_Address_FK FOREIGN KEY(AddressID) REFERENCES Address(AddressID)
);

CREATE TABLE PROJECTROLE( 
	EmployeeID			    Int				NOT NULL, 
    ProjectID			    Int				NOT NULL, 
	Role            	    Char(30)		NOT NULL, 
    CONSTRAINT 			    Projectrole_Employee_FK FOREIGN KEY(EmployeeID) REFERENCES EMPLOYEE(EmployeeID), 
    CONSTRAINT 			    Project_Projectrole_FK 	FOREIGN KEY(ProjectID) REFERENCES PROJECT(ProjectID) 
);

INSERT INTO PROJECT VALUES(335005, 'Replacement of single-span two-lane bridge', 'Pike County', 'YES', 123001);
INSERT INTO PROJECT VALUES(335006, 'Repairing the ledge of the two-lane bridge', 'Pike County', 'YES', 123001);

INSERT INTO PROJECTROLE VALUES(390054489, 335005, 'Labor');
INSERT INTO PROJECTROLE VALUES(390054489, 335006, 'Mason');

DROP TABLE STATETAX;

CREATE TABLE STATETAX( 
	StateTaxId			    Int				NOT NULL, 
	Percentage              numeric(5,2)	NOT NULL, 
    MaxDeduction            char(10)        NOT NULL, 
    StateID                 Int		        NOT NULL,                 
    CONSTRAINT 			    StateTax_PK 	PRIMARY KEY(StateTaxID) ,
    CONSTRAINT              Statetax_State_FK FOREIGN KEY(StateID) REFERENCES State(StateID)
);

INSERT INTO STATETAX VALUES(885529, 2.93, '23.43', 1);
INSERT INTO STATETAX VALUES(885530, 2.93, '36.88', 2);

DROP TABLE EEOCLASSIFICATION;

CREATE TABLE EEOCLASSIFICATION( 
    EEOCode                 Char(5)         NOT NULL, 
    MinorityYesNo           Char(3)         NOT NULL, 
    EEODescription          Char(20)        NOT NULL,
    EmployeeID			    Int				NOT NULL,
    CONSTRAINT 			    Eeo_Employee_FK FOREIGN KEY(EmployeeID) REFERENCES EMPLOYEE(EmployeeID)
);

INSERT INTO EEOCLASSIFICATION VALUES('2', 'Yes', 'Hispanic', 390054489);
INSERT INTO EEOCLASSIFICATION VALUES('5', 'No', 'Non-Minority(White)', 275506921);


CREATE TABLE PROJECTJOBTYPE( 
	ProjectID			    Int				NOT NULL, 
	JobTypeId			    Int				NOT NULL,
	CONSTRAINT 			    ProjectjobType_PK 	PRIMARY KEY(JobTypeId, ProjectID),
	CONSTRAINT 			    ProjectjobType_JobType_FK FOREIGN KEY(JobTypeId) REFERENCES JobType(JobTypeId), 
    CONSTRAINT 			    ProjectjobType_Project_FK 	FOREIGN KEY(ProjectID) REFERENCES PROJECT(ProjectID) 
);

INSERT INTO JOBTYPE VALUES(102, 'Working as a Mason', 'MAS', 'Masonry', 17.00, 15.75, 3.00);
INSERT INTO JOBTYPE VALUES(103, 'Working as a Carepenter', 'CAR', 'Carpentry', 16.00, 15.75, 3.00);


DROP TABLE TIMESHEET;

CREATE TABLE TIMESHEET( 
	TimesheetID			    Int				NOT NULL, 
	TimesheetDate	        Date    		NOT NULL, 
	HoursWorked	            Numeric(9,2)	NOT NULL, 
    HoursOvertime	        Numeric(9,2)	NOT NULL,
    EmployeeID			    Int, 
    ProjectID			    Int,
    JobTypeID               Int,
    CONSTRAINT 			    Timesheet_PK  PRIMARY KEY(TimesheetID),
    CONSTRAINT 			    Timesheet_Employee_FK FOREIGN KEY(EmployeeID) REFERENCES EMPLOYEE(EmployeeID), 
    CONSTRAINT 			    Timesheet_Project_FK  FOREIGN KEY(ProjectID) REFERENCES PROJECT(ProjectID),
    CONSTRAINT 			    Timesheet_JobType_FK  FOREIGN KEY(JobTypeID) REFERENCES JobType(JobTypeID) 
);

INSERT INTO TIMESHEET VALUES(1001, '20-OCT-18', 8.00, 1.00, 390054489, 335005, 100);
INSERT INTO TIMESHEET VALUES(1003, '21-OCT-18', 8.00, 2.00, 390054489, 335005, 102);
INSERT INTO TIMESHEET VALUES(1004, '22-OCT-18', 8.00, 3.00, 390054489, 335005, 103);
INSERT INTO TIMESHEET VALUES(1002, '20-OCT-18', 8.00, 4.00, 275506921, 335006, 101);


DROP TABLE FEDERALTAX;

CREATE TABLE FEDERALTAX( 
	FederalTaxId		    Int				NOT NULL, 
	Percentage              Numeric(5,2)    NOT NULL, 
    MaxDeduction            Numeric(5,2)        NOT NULL, 
    CONSTRAINT 			    FederalTax_PK PRIMARY KEY(FederalTaxID) 
);


INSERT INTO FEDERALTAX VALUES(10111152, 19.56, 156.20);
INSERT INTO FEDERALTAX VALUES(10111153, 19.56, 177.67);