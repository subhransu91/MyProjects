/* ******************************************************************************/
/*	Oracle CREATE - INSERT script 2 for Base Ninjas- Part 2 Project               */
/* ******************************************************************************/

/*	Inventory System Tables  */

CREATE TABLE PROJECT(
	ProjectID			    Int				NOT NULL,
	ProjectDescription	    Char(50)		NOT NULL,
	SiteName		        Char(30)		NOT NULL,
    IsStateProject		    Char(3)		    NOT NULL,
    CONSTRAINT 			    Project_PK 	PRIMARY KEY(ProjectID)
);

CREATE TABLE INVENTORYITEM(
	ItemID			        Int				NOT NULL,
	PurchaseDate	        Date    		NOT NULL,
    ItemCondition           Char(10)		NOT NULL,
    CONSTRAINT 			    Item_PK 	PRIMARY KEY(ItemID)
);

CREATE TABLE MAINTENANCE(
	MaintenanceID		    Int				NOT NULL,
	LastMaintenanceDate	    Date    		NOT NULL,
    NextMaintenanceDate	    Date    		NOT NULL,
    Status                  Char(10)		NOT NULL,
    Remarks                 Char(30)		NOT NULL,
    CONSTRAINT 			    Maintenance_PK 	PRIMARY KEY(MaintenanceID)
);

CREATE TABLE INVENTORYTRACKING(
	TrackingID		        Int				NOT NULL,
	MovingDate	            Date    		NOT NULL,
    ItemLocation            Char(20)		NOT NULL,
    CONSTRAINT 			    Tracking_PK 	PRIMARY KEY(TrackingID)
);

CREATE TABLE ITEMCATEGORY(
	ItemCategoryID		    Int				NOT NULL,
	ItemName	            Char(30)    	NOT NULL,
    ItemDescription         Char(30)		NOT NULL,
    Make                    Char(20)		NOT NULL,
    Model                   Char(20)		NOT NULL,  
    HandlingInstructions    Char(30)		NOT NULL
);

CREATE TABLE SUPPLIER(
	SupplierID		        Int				NOT NULL,
	SupplierName	        Char(30)   		NOT NULL,
    CONSTRAINT 			    Supplier_PK 	PRIMARY KEY(SupplierID)
);

CREATE TABLE ADDRESS(
    AddressID               Int             NOT NULL,
    AddressLine             Char(35)		NOT NULL,
    City                    Char(35)		NOT NULL,
    ZIP                     Char(10)		NOT NULL,
    CONSTRAINT 			    Address_PK 	PRIMARY KEY(AddressID)
);

/* Table SUPPLIER */

INSERT INTO SUPPLIER VALUES(1111, 'Joe Cememts');
INSERT INTO SUPPLIER VALUES(1112, 'Indiana Pliers');

/* Table ITEMCATEGORY */

INSERT INTO ITEMCATEGORY VALUES(10, 'Screwdriver', 'Stainless with yellow handle', 'Stanley', '2010', 'held by handle');
INSERT INTO ITEMCATEGORY VALUES(11, 'Stapler', 'Stainless with blue outer body', 'Staples', '4TZ', 'held with thumb on outer body');

/* Table INVENTORYITEM */

INSERT INTO INVENTORYITEM VALUES(501, '10-MAY-11', 'Good');
INSERT INTO INVENTORYITEM VALUES(502, '14-NOV-12', 'Bad');

/* Table ADDRESS */

INSERT INTO ADDRESS VALUES(123001, '1253 Chopping Block Lane', 'Knockemstiff', '80286');
INSERT INTO ADDRESS VALUES(123002, '1381 Walter Lane', 'Knockemstiff', '80286');

/* Table MAINTENANCE */

INSERT INTO MAINTENANCE VALUES(201, '22-SEP-18', '22-OCT-18', 'Not Clean', 'Need to be cleaned soon');
INSERT INTO MAINTENANCE VALUES(202, '5-SEP-18', '5-NOV-18', 'Clean', 'Cleaning not required');

/* Table INVENORYTRACKING */

INSERT INTO INVENTORYTRACKING VALUES(2001, '18-OCT-18', 'Pike County');
INSERT INTO INVENTORYTRACKING VALUES(2002, '19-OCT-18', 'Head Office');

/* Table PROJECT */

INSERT INTO PROJECT VALUES(335005, 'Replacement of single-span two-lane bridge', 'Pike County', 'YES');
INSERT INTO PROJECT VALUES(335006, 'Repairing the ledge of the two-lane bridge', 'Pike County', 'YES');

