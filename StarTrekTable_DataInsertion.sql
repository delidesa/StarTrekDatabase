-- Phase III: ORACLE IMPLEMENTATION (Inserting Data Script)
-- Diego Gamboa

SET CONSTRAINTS ALL DEFERRED;

-- Inserting data into the Table 'Product'
INSERT INTO Product (Product, Part_Num, Vend_Num, Payment)VALUES ('Blankets','A001','20202','300');
INSERT INTO Product (Product, Part_Num, Vend_Num, Payment)VALUES ('Cards','A011','20201','200');
INSERT INTO Product (Product, Part_Num, Vend_Num, Payment)VALUES ('Glasses','A111','20202','400');
INSERT INTO Product (Product, Part_Num, Vend_Num, Payment)VALUES ('Shoes','A002','20203','500');
INSERT INTO Product (Product, Part_Num, Vend_Num, Payment)VALUES ('Eggs','A003','20204','100');

-- Inserting data into the Table 'Customer'
INSERT INTO Customer VALUES ('AAA001','10701 VainBell Ave CA, 92316','Bill','Smith','90000');
INSERT INTO Customer VALUES ('AAA002','10204 Pine St CA, 92317','Bob','Bell','50000');
INSERT INTO Customer VALUES ('AAA003','10402 Santa Fe Ave CA, 95418','Travis','Giggs','10000');
INSERT INTO Customer VALUES ('AAA004','10501 Vineyard Ave CA, 92246','Steve','Roggers','60000');
INSERT INTO Customer VALUES ('AAA005','10607 Lime Ave CA, 91310','Adam','Clooney','70000');
INSERT INTO Customer VALUES ('AAA006','10903 Tamarind Ave CA, 92316','James','Bond','80000');

-- Inserting data into the Table 'Vendor'
INSERT INTO Vendor VALUES ('00042158','3801 Murrells Dr. NY, 29576','FeDex','1000');
INSERT INTO Vendor VALUES ('01132118','1063 Washington St. NY, 12553','Amazon','2000');
INSERT INTO Vendor VALUES ('02342168','1161 Linden Dr. NY, 29576','Etsy','3000');
INSERT INTO Vendor VALUES ('17842138','1354 Laurel Ave. NY, 29576','Sony','1050');
INSERT INTO Vendor VALUES ('27652128','1754 Roubidoux Blvd. NY, 29576','RedBox','1200');

-- Inserting data into the Table 'Customer_Order'
INSERT INTO Customer_Order VALUES ('AAA001','10701 VainBell Ave CA, 92316','8886655');
INSERT INTO Customer_Order VALUES ('AAA002','10204 Pine St CA, 92317','9876543');
INSERT INTO Customer_Order VALUES ('AAA003','10402 Santa Fe Ave CA, 95418','3334455');
INSERT INTO Customer_Order VALUES ('AAA004','10501 Vineyard Ave CA, 92246','8765432');
INSERT INTO Customer_Order VALUES ('AAA005','10607 Lime Ave CA, 91310','8665555');
INSERT INTO Customer_Order VALUES ('AAA006','10903 Tamarind Ave CA, 92316','3344555');

-- Inserting data into the Table 'Work_Order'
INSERT INTO Work_Order VALUES ('F12345','8886655', '19-JAN-12', '30-JAN-12', '21-JAN-12', '01-FEB-12');
INSERT INTO Work_Order VALUES ('D12335','9876543', '11-FEB-12', '23-FEB-13', '15-FEB-12', '01-MAR-12');
INSERT INTO Work_Order VALUES ('B22335','3334455', '16-APR-12', '27-APR-14', '18-APR-12', '03-MAY-12');
INSERT INTO Work_Order VALUES ('C22333','8765432', '12-JUN-12', '22-JUN-15', '13-JUN-12', '28-JUN-12');
INSERT INTO Work_Order VALUES ('N12330','8665555', '10-DEC-12', '20-DEC-15', '12-DEC-12', '03-JAN-12');
INSERT INTO Work_Order VALUES ('Y22136','3344555', '12-NOV-12', '25-NOV-14', '17-NOV-12', '04-DEC-12');

-- Inserting data into the Table 'Purchased_Order'
INSERT INTO Purchased_Order VALUES ('ABA001','Via Uber', '18-JAN-12', '00042158');
INSERT INTO Purchased_Order VALUES ('BCA002','By Air', '09-FEB-12', '01132118');
INSERT INTO Purchased_Order VALUES ('ADA003','By Sea', '13-APR-12','02342168');
INSERT INTO Purchased_Order VALUES ('AGA004','By Train', '08-DEC-12','17842138');
INSERT INTO Purchased_Order VALUES ('ATA005','By Land', '10-NOV-12','27652128');

-- Inserting data into the Table 'Work_Center'
INSERT INTO Work_Center VALUES ('00112','AASP','ABA001');
INSERT INTO Work_Center VALUES ('10113','ACCT','BCA002');
INSERT INTO Work_Center VALUES ('03142','ALUM','ADA003');
INSERT INTO Work_Center VALUES ('70192','APER','AGA004');
INSERT INTO Work_Center VALUES ('51283','AAIT','ATA005');

-- Inserting data into the Table 'Parts'
INSERT INTO Parts VALUES ('ACBD507887','Top Shelf','','500','00042158');
INSERT INTO Parts VALUES ('CSDA984304','Bottom Shelf','Handle With Care','700','01132118');
INSERT INTO Parts VALUES ('LASC231204','Middle Shelf','','900','02342168');
INSERT INTO Parts VALUES ('5410JKAC8W','Bottom Shelf','Heavy Items','650','17842138');
INSERT INTO Parts VALUES ('CA3KJBAK8D','Alternate Shelf','Handle With Care','999','27652128');

-- Inserting data into the Table 'Employee'
INSERT INTO Employee VALUES ('7415972','15014','Bill','Simmons','25000','ITManager');
INSERT INTO Employee VALUES ('6124920','56451','Guillermo','Ochoa','4000','HeadofSales');
INSERT INTO Employee VALUES ('1513288','06262','Lupe','Mendez','5700','Intern');
INSERT INTO Employee VALUES ('8785133','97952','Juan','Lopez','87777','Frontdesk');
INSERT INTO Employee VALUES ('8711674','98714','John','Smith','10000','Retired');

-- Inserting data into the Table 'WorkOrder_Parts'
INSERT INTO WorkOrder_Parts VALUES ('F12345','ACBD507887');
INSERT INTO WorkOrder_Parts VALUES ('D12335','CSDA984304');
INSERT INTO WorkOrder_Parts VALUES ('B22335','LASC231204');
INSERT INTO WorkOrder_Parts VALUES ('C22333','5410JKAC8W');
INSERT INTO WorkOrder_Parts VALUES ('N12330','CA3KJBAK8D');

-- Inserting data into the Table 'PurchasedOrder_Parts'
INSERT INTO PurchasedOrder_Parts VALUES ('ABA001','ACBD507887','10');
INSERT INTO PurchasedOrder_Parts VALUES ('BCA002','CSDA984304','3');
INSERT INTO PurchasedOrder_Parts VALUES ('ADA003','LASC231204','5');
INSERT INTO PurchasedOrder_Parts VALUES ('AGA004','5410JKAC8W','7');
INSERT INTO PurchasedOrder_Parts VALUES ('ATA005','CA3KJBAK8D','8');

-- Inserting data into the Table 'Employee_WorkCenter'
INSERT INTO Employee_WorkCenter VALUES ('7415972','00112','WORKORDER 12346');
INSERT INTO Employee_WorkCenter VALUES ('6124920','10113','WORKORDER 46511');
INSERT INTO Employee_WorkCenter VALUES ('1513288','03142','WORKORDER 86785');
INSERT INTO Employee_WorkCenter VALUES ('8785133','70192','WORKORDER 14026');
INSERT INTO Employee_WorkCenter VALUES ('8711674','51283','WORKORDER 167520');

-- Set defered constraints effective. 
SET CONSTRAINTS ALL IMMEDIATE;

-- The following commands will test the correctness 
-- of the data inserted.

SET PAUSE OFF
SELECT * FROM Product;
SELECT * FROM  Customer;
SELECT * FROM  Vendor;
SELECT * FROM Customer_Order;
SELECT * FROM Work_Order;
SELECT * FROM Purchased_Order;
SELECT * FROM  Work_Center;
SELECT * FROM  Parts;
SELECT * FROM Employee;
SELECT * FROM WorkOrder_Parts;
SELECT * FROM PurchasedOrder_Parts;
SELECT * FROM Employee_WorkCenter;

SET PAUSE ON
