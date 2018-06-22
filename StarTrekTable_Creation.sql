-- Phase III: Script For Tables and Comments
-- Diego Gamboa


DROP TABLE Product CASCADE CONSTRAINTS;
CREATE TABLE Product (
        Product  VARCHAR2(20),
        Part_Num VARCHAR(15)          NOT NULL,
        Vend_Num INT           NOT NULL,
        Payment  INT,								
        CONSTRAINTS Product_PK PRIMARY KEY(Product)
);

-- Table Product
COMMENT ON TABLE Product IS 'Contains all products handdled by the Star Trek Company';
COMMENT ON COLUMN Product.Product IS 'Describes what the product is';
COMMENT ON COLUMN Product.Part_Num IS 'Differentiates each product for each order';
COMMENT ON COLUMN Product.Vend_Num IS 'Unique number that differentiates each vendor';
COMMENT ON COLUMN Product.Payment IS 'The amount each vendor charges for the service';

DROP TABLE Customer CASCADE CONSTRAINTS;
CREATE TABLE Customer (
        Customer_ID  VARCHAR2(6) NOT NULL,
        Address      VARCHAR2(80) NOT NULL,
        Fname        VARCHAR2(25) NOT NULL,
        Lname        VARCHAR2(25) NOT NULL,
        Credit_Limit INT          NOT NULL,
        CONSTRAINTS Customer_PK PRIMARY KEY(Customer_ID)
);

-- Table Customer
COMMENT ON TABLE Customer IS 'Contains all info for each customer that does bussiness with the Star Trek Company';
COMMENT ON COLUMN Customer.Customer_ID IS 'Unique ID number that every customer gets assigned';
COMMENT ON COLUMN Customer.Address IS 'The address of the customers location';
COMMENT ON COLUMN Customer.Fname IS 'The first name of the customer.';
COMMENT ON COLUMN Customer.Lname IS 'The last name of the customer.';
COMMENT ON COLUMN Customer.Credit_Limit IS 'The credit limit for each customer with $150000 being the limit for all';

DROP TABLE Vendor CASCADE CONSTRAINTS;
CREATE TABLE Vendor (
        Vendor_Num   VARCHAR2(6) NOT NULL,
        Address      VARCHAR2(100)  NOT NULL,
        NAME         VARCHAR2(50)   NOT NULL,
        Vendor_Price INT,  
        CONSTRAINTS Vendor_PK PRIMARY KEY(Vendor_Num)
);

ALTER TABLE Product
	ADD CONSTRAINTS Product_Vendor_FK FOREIGN KEY (Vendor_Num) REFERENCES Vendor(Vendor_Num);
	
-- Table Vendor
COMMENT ON TABLE Vendor IS 'All ordered and processed products by the Star Trek Company';
COMMENT ON COLUMN Vendor.Vendor_Num IS 'The unique number that each vendor gets assigned';
COMMENT ON COLUMN Vendor.Address IS 'The Address of where the vendor is located at.';
COMMENT ON COLUMN Vendor.NAME IS 'The name of the vendor.';
COMMENT ON COLUMN Vendor.Vendor_Price IS 'The price each vendor chargers for the service';

DROP TABLE Customer_Order CASCADE CONSTRAINTS;
CREATE TABLE Customer_Order (
	Customer_ID VARCHAR2(6),
	Address VARCHAR(100)  NOT NULL,
	Customer_order INT,
	CONSTRAINTS Customer_Order_PK PRIMARY KEY (Customer_ID)
);

ALTER TABLE Customer_Order
	ADD CONSTRAINTS Customer_Order_Customer_FK FOREIGN KEY (Customer_order) REFERENCES Customer(Customer_order);

COMMENT ON TABLE Customer_Order IS 'Orders made by customers';
COMMENT ON COLUMN Customer_Order.Customer_ID IS 'The ID for the customer making the order';
COMMENT ON COLUMN Customer_Order.Address IS 'The Address of the customer';
COMMENT ON COLUMN Customer_Order.Customer_Order IS 'The order of the customer';

DROP TABLE Work_Order CASCADE CONSTRAINTS;
CREATE TABLE Work_Order (
        Work_order CHAR(6) NOT NULL,
	Customer_Order INT,
        Exp_Start  DATE    NOT NULL,
        Exp_Date   DATE    NOT NULL,
        AStart     DATE    NOT NULL,
        AEnd       DATE    NOT NULL,
        CONSTRAINTS Work_order_PK PRIMARY KEY(Work_Order)
);

ALTER TABLE Work_Order
	ADD CONSTRAINTS Work_order_Customer_Order_FK FOREIGN KEY (Customer_Order) REFERENCES Customer_Order(Customer_Order);

-- Table Work_Order
COMMENT ON TABLE Work_Order IS 'Contains all work orders proccessed by the Star Trek Company';
COMMENT ON COLUMN Work_Order.Work_order IS 'The number each work order gets assigned';
COMMENT ON COLUMN Work_Order.Exp_Start IS 'Date when the work order will be processed';
COMMENT ON COLUMN Work_Order.Exp_Date IS 'Date when the work order should be ready to ship.';
COMMENT ON COLUMN Work_Order.AStart IS 'The actual date when the work order was assigned';
COMMENT ON COLUMN Work_Order.AEnd IS 'The actual date when the work order was finished and shipped.';

DROP TABLE Purchased_Order CASCADE CONSTRAINTS;
CREATE TABLE Purchased_Order (
        Order_Number CHAR(6),
        Shipping     VARCHAR2(100) NOT NULL,
        Order_Date   DATE          NOT NULL,
	Vendor_Num   INT,
        CONSTRAINTS Purchased_Order_PK PRIMARY KEY(Order_Number)
);

ALTER TABLE Purchased_Order
	ADD CONSTRAINTS Purchased_Order_Vendor_FK FOREIGN KEY (Vendor_Num) REFERENCES Vendor(Vendor_Num);
	
-- Table Purchased_Order
COMMENT ON TABLE Purchased_Order IS 'Contains all purchased ordered handled/started by the Star Trek Company';
COMMENT ON COLUMN Purchased_Order.Order_Number IS 'Order number that each order gets assigned.';
COMMENT ON COLUMN Purchased_Order.Shipping IS 'Denotes/specifies the shipping method used to deliver the product.';
COMMENT ON COLUMN Purchased_Order.Order_Date IS 'The date when the order was initiated.';

-- NEXT SET OF TABLES

DROP TABLE Work_Center CASCADE CONSTRAINTS;
CREATE TABLE Work_Center (
	Employee_ID INT,
	Department CHAR(25) NOT NULL,
	Work_Order CHAR (6) NOT NULL,
	CONSTRAINTS Work_Center_PK PRIMARY KEY (Employee_ID)
);

COMMENT ON TABLE Work_Center IS 'For the company to associate order to workers';
COMMENT ON COLUMN Work_Center.Employee_ID IS 'ID for the Employee';
COMMENT ON COLUMN Work_Center.Department IS 'Departments that the company has';
COMMENT ON COLUMN Work_Center.Work_Order IS 'Number of the work order';

DROP TABLE Parts CASCADE CONSTRAINTS;
CREATE TABLE Parts (
	Part_Num VARCHAR2(10) NOT NULL,
	Locations CHAR(25),
	Storage_Specs CHAR(25),
	Quantity INT,
	Vendor_Num   INT,
	CONSTRAINTS Parts_PK PRIMARY KEY (Part_Num)
);

ALTER TABLE Parts
	ADD CONSTRAINTS Parts_Vendor_FK  FOREIGN KEY (Vendor_Num) REFERENCES Vendor(Vendor_Num);
	
COMMENT ON TABLE Parts IS 'The inventory of the company to sell';
COMMENT ON COLUMN Parts.Part_Num IS 'The number of the part';
COMMENT ON COLUMN Parts.Locations IS 'Location where the part is';
COMMENT ON COLUMN Parts.Storage_Specs IS 'Specifications for the storage of the parts';
COMMENT ON COLUMN Parts.Quantity IS 'How much inventory there is in the company';

DROP TABLE Employee CASCADE CONSTRAINTS;
CREATE TABLE Employee (
	ID_Number INT,
	Department_ID INT, 
	Fname VARCHAR2(25) NOT NULL,
	Lname VARCHAR2(25) NOT NULL,
	Salary INT,
	Position VARCHAR2(25),
	CONSTRAINTS Employee_PK PRIMARY KEY (ID_Number)
);

COMMENT ON TABLE Employee IS 'Employees in the company';
COMMENT ON COLUMN Employee.ID_Number IS 'Number of the employee';
COMMENT ON COLUMN Employee.Fname IS 'First name of the employee';
COMMENT ON COLUMN Employee.Lname IS 'Last name of the employee';
COMMENT ON COLUMN Employee.Salary IS 'Salary of the employee';
COMMENT ON COLUMN Employee.Position IS 'Position that the employee';

DROP TABLE Employee_WorkCenter CASCADE CONSTRAINTS;
CREATE TABLE Employee_WorkCenter (
	ID_Number INT,
	Employee_ID INT,
	Works_ON VARCHAR(25) NOT NULL
);	

-- Employee_WorkCenter
COMMENT ON TABLE Employee_WorkCenter IS 'Many to many relation table for Employee and Work Center';
COMMENT ON COLUMN Employee_WorkCenter.ID_Number IS 'Using the ID Number from the Work Center table';
COMMENT ON COLUMN Employee_WorkCenter.Employee_ID IS 'Using the Employee_ID from the Employee table';
COMMENT ON COLUMN Employee_WorkCenter.Works_ON IS 'What the employee is working on'

DROP TABLE PurchasedOrder_Parts CASCADE CONSTRAINTS;
CREATE TABLE PurchasedOrder_Parts (
	Order_Number CHAR(6) NOT NULL,
	Part_Num VARCHAR2(10) NOT NULL,
	Inventory INT NOT NULL
);

ALTER TABLE PurchasedOrder_Parts
	ADD CONSTRAINTS PurchasedOrder_Parts_Order_FK FOREIGN KEY (Order_Number) REFERENCES Purchased_Order(Order_Number);	
ALTER TABLE PurchasedOrder_Parts
	ADD CONSTRAINTS PurchasedOrder_Parts_Part_FK FOREIGN KEY  (Part_num) REFERENCES Parts(Part_num);	

-- PurchaseOrder_Parts Table
COMMENT ON TABLE PurchasedOrder_Parts IS 'Many to many relation table for Purchased Order and Parts';
COMMENT ON COLUMN PurchasedOrder_Parts.Order_Number IS 'Using the Order Number from the Purchase Order table';
COMMENT ON COLUMN PurchasedOrder_Parts.Part_Num IS 'Using the Part Num from the Parts table';
COMMENT ON COLUMN PurchasedOrder_Parts.Inventory IS 'Inventory that is left for the company';

DROP TABLE WorkOrder_Parts CASCADE CONSTRAINTS;
CREATE TABLE WorkOrder_Parts (
	Work_Order CHAR(6) NOT NULL,
	Part_Num VARCHAR2(10) NOT NULL,
	CONSTRAINTS WorkOrder_Parts_PK PRIMARY KEY (Work_Order,Part_Num)
);

ALTER TABLE WorkOrder_Parts
	ADD CONSTRAINTS WorkOrder_Parts_WorkOrder_FK FOREIGN KEY(Work_Order) REFERENCES Work_Order(Work_Order);	
ALTER TABLE WorkOrder_Parts
	ADD CONSTRAINTS WorkOrder_Parts_Part_FK FOREIGN KEY(Part_Num) REFERENCES Parts(Part_Num);	
	
-- WorkOrder_Parts 
COMMENT ON TABLE WorkOrder_Parts IS 'Many to many relation table for Work Order and Parts';
COMMENT ON COLUMN WorkOrder_Parts.Work_Order IS 'Using the Work Order from the Work Order table';
COMMENT ON COLUMN WorkOrder_Parts.Part_Num IS 'Using the Part Number from the Parts table';
