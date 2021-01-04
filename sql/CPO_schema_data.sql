
DROP TABLE IF EXISTS OrderLine_T;
DROP TABLE IF EXISTS Product_T;
DROP TABLE IF EXISTS Order_T;
DROP TABLE IF EXISTS Customer_T;

CREATE TABLE Customer_T (
	CustomerID decimal(11, 0) not null,
	CustomerName varchar(25) not null,
	CustomerAddress varchar(30),
	CustomerCity varchar(20),
	Customer
);

--DROP TABLE OrderLine_T	 	CASCADE CONSTRAINTS ;
--DROP TABLE Product_T 		CASCADE CONSTRAINTS ;
--DROP TABLE Order_T 		CASCADE CONSTRAINTS ;
--DROP TABLE Customer_T 		CASCADE CONSTRAINTS ;

CREATE TABLE Customer_T
             (CustomerID          NUMBER(11,0)     NOT NULL,
	        CustomerName        VARCHAR2(25)     NOT NULL,
	        CustomerAddress     VARCHAR2(30)    ,
              CustomerCity        VARCHAR2(20)    ,              
              CustomerState       CHAR(2)         ,
              CustomerPostalCode  VARCHAR2(10)    ,
CONSTRAINT Customer_PK PRIMARY KEY (CustomerID));



CREATE TABLE Order_T
             (OrderID             NUMBER(11,0)    NOT NULL,
	         CustomerID          NUMBER(11,0)   ,
              OrderDate           DATE DEFAULT SYSDATE          ,
CONSTRAINT Order_PK PRIMARY KEY (OrderID),
CONSTRAINT Order_FK1 FOREIGN KEY (CustomerID) REFERENCES Customer_T(CustomerID));

CREATE TABLE Product_T
             (ProductID           NUMBER(11,0)    NOT NULL,
              ProductLineID       NUMBER(11,0)   ,
              ProductDescription  VARCHAR2(50)    ,
              ProductFinish       VARCHAR2(20)    ,
              ProductStandardPrice DECIMAL(6,2)   ,
CONSTRAINT Product_PK PRIMARY KEY (ProductID));

CREATE TABLE OrderLine_T
	      (OrderID            NUMBER(11,0)   NOT NULL,
              ProductID           NUMBER(11,0)   NOT NULL,
              OrderedQuantity     NUMBER(11,0)  ,
CONSTRAINT OrderLine_PK PRIMARY KEY (OrderID, ProductID),
CONSTRAINT OrderLine_FK1 FOREIGN KEY (OrderID) REFERENCES Order_T(OrderID),
CONSTRAINT OrderLine_FK2 FOREIGN KEY (ProductID) REFERENCES Product_T(ProductID));



INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (1, 'Contemporary Casuals', '1355 S Hines Blvd', 'Gainesville', 'FL', '32601-2871');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (2, 'Value Furniture', '15145 S.W. 17th St.', 'Plano', 'TX', '75094-7743');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (3, 'Home Furnishings', '1900 Allard Ave.', 'Albany', 'NY', '12209-1125');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (4, 'Eastern Furniture', '1925 Beltline Rd.', 'Carteret', 'NJ', '07008-3188');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (5, 'Impressions', '5585 Westcott Ct.', 'Sacramento', 'CA', '94206-4056');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (6, 'Furniture Gallery', '325 Flatiron Dr.', 'Boulder', 'CO', '80514-4432');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (7, 'Period Furniture', '394 Rainbow Dr.', 'Seattle', 'WA', '97954-5589');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (8, 'California Classics', '816 Peach Rd.', 'Santa Clara', 'CA', '96915-7754');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (9, 'M and H Casual Furniture', '3709 First Street', 'Clearwater', 'FL', '34620-2314');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (10, 'Seminole Interiors', '2400 Rocky Point Dr.', 'Seminole', 'FL', '34646-4423');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (11, 'American Euro Lifestyles', '2424 Missouri Ave N.', 'Prospect Park', 'NJ', '07508-5621');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (12, 'Battle Creek Furniture', '345 Capitol Ave. SW', 'Battle Creek', 'MI', '49015-3401');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (13, 'Heritage Furnishings', '66789 College Ave.', 'Carlisle', 'PA', '17013-8834');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (14, 'Kaneohe Homes', '112 Kiowai St.', 'Kaneohe', 'HI', '96744-2537');
INSERT INTO Customer_T  (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)
VALUES  (15, 'Mountain Scenes', '4132 Main Street', 'Ogden', 'UT', '84403-4432');



INSERT INTO Order_T  (OrderID, OrderDate, CustomerID)
VALUES  (1001, '21/Oct/10', 1);
INSERT INTO Order_T  (OrderID, OrderDate, CustomerID)
VALUES  (1002, '21/Oct/10', 8);
INSERT INTO Order_T  (OrderID, OrderDate, CustomerID)
VALUES  (1003, '22/Oct/10', 15);
INSERT INTO Order_T  (OrderID, OrderDate, CustomerID)
VALUES  (1004, '22/Oct/10', 5);
INSERT INTO Order_T  (OrderID, OrderDate, CustomerID)
VALUES  (1005, '24/Oct/10', 3);
INSERT INTO Order_T  (OrderID, OrderDate, CustomerID)
VALUES  (1006, '24/Oct/10', 2);
INSERT INTO Order_T  (OrderID, OrderDate, CustomerID)
VALUES  (1007, '27/Oct/10', 11);
INSERT INTO Order_T  (OrderID, OrderDate, CustomerID)
VALUES  (1008, '30/Oct/10', 12);
INSERT INTO Order_T  (OrderID, OrderDate, CustomerID)
VALUES  (1009, '05/Nov/10', 4);
INSERT INTO Order_T  (OrderID, OrderDate, CustomerID)
VALUES  (1010, '05/Nov/10', 1);

INSERT INTO Order_T  (OrderID, OrderDate, CustomerID)
VALUES  (1011, '05/Dec/10', 1);
INSERT INTO Order_T  (OrderID, OrderDate, CustomerID)
VALUES  (1012, '22/Dec/10', 15);

INSERT INTO Product_T  (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)
VALUES  (1, 'End Table', 'Cherry', 175, 1);
INSERT INTO Product_T  (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)
VALUES  (2, 'Coffee Table', 'Natural Ash', 200, 2);
INSERT INTO Product_T  (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)
VALUES  (3, 'Computer Desk', 'Natural Ash', 375, 2);
INSERT INTO Product_T  (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)
VALUES  (4, 'Entertainment Center', 'Natural Maple', 650, 3);
INSERT INTO Product_T  (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)
VALUES  (5, 'Writers Desk', 'Cherry', 325, 1);
INSERT INTO Product_T  (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)
VALUES  (6, '8-Drawer Desk', 'White Ash', 750, 2);
INSERT INTO Product_T  (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)
VALUES  (7, 'Dining Table', 'Natural Ash', 800, 2);
INSERT INTO Product_T  (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)
VALUES  (8, 'Computer Desk', 'Walnut', 250, 3);



INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1001, 1, 2);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1001, 2, 2);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1001, 4, 1);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1002, 3, 5);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1003, 3, 3);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1004, 6, 2);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1004, 8, 2);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1005, 4, 3);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1006, 4, 1);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1006, 5, 2);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1006, 7, 2);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1007, 1, 3);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1007, 2, 2);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1008, 3, 3);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1008, 8, 3);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1009, 4, 2);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1009, 7, 3);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1010, 8, 10);

INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1011, 8, 5);
INSERT INTO OrderLine_T  (OrderID, ProductID, OrderedQuantity)
VALUES  (1012, 3, 5);

COMMIT;