



SELECT  top 10 c.cust, c.CUSTNAME as FullName,d.ADDRESS, d.City, co.COUNTRYFROM [dbo].[CUSTOMERS] cleft join INVOICES i on c.CUST=i.CUSTleft join DESTCODES d on i.DESTCODE=d.DESTCODEleft join STATES S on d.STATE=s.STATEIDleft join COUNTRIES co on s.COUNTRY=co.COUNTRYCODE



select top 10 i.IV, i.IVDATE, i.CUST, i.AGENT, i.DESTCODE, p.PART, ii.QUANT, ii.PRICE,ii.QUANT*ii.PRICE as LineTotalfrom [dbo].[INVOICES] ijoin [dbo].[INVOICEITEMS] ii on i.IV=ii.IVjoin [dbo].[PART] p on ii.PART=p.PART


select top 10 i.IV, i.IVDATE, i.CUST, i.AGENT, i.DESTCODE, p.PART, ii.QUANT, ii.PRICE, ii.QUANT * ii.PRICE * (1-isnull(DISCOUNT,0)) as LineTotal, cast(i.IV as varchar(10)) +'|'+ convert(varchar(5),p.PART) as salesorderdetailIDfrom [dbo].[INVOICES] ileft join [dbo].[INVOICEITEMS] ii on i.IV=ii.IVleft join [dbo].[PART] p on ii.PART=p.PARTinsert into [PriorityERP].DBO.AGENTS (AGENT,AGENTNAME)select a.BusinessEntityID,FirstName+ ' '+ LastName from [AdventureWorks2019].[HumanResources].[Employee] ajoin [AdventureWorks2019].[Sales].[SalesPerson] b on a.BusinessEntityID =b.BusinessEntityIDjoin [AdventureWorks2019].[Person].[Person] c on a.BusinessEntityID =c.BusinessEntityID-- dim customersSELECT distinct(c.cust), c.CUSTNAME as FullName, d.ADDRESS, d.City, co.COUNTRYFROM [dbo].[CUSTOMERS] cleft join INVOICES I on c.CUST=i.CUSTleft join DESTCODES d on i.DESTCODE=d.DESTCODEleft join STATES S on d.STATE=s.STATEIDleft join COUNTRIES co on s.COUNTRY=co.COUNTRYCODE-- dim productsSELECT p.PART, p.PARTNAME, f.FAMILYNAME, ft.FTNAMEFROM [dbo].[PART] pLEFT JOIN FAMILY f on p.FAMILY = f.FAMILYLEFT JOIN FAMILYTYPES ft on f.FAMILYTYPE=ft.FAMILYTYPE-- FactSalesselect i.IV OrderID, i.IVDATE OrderDate, i.CUST CustomerID, i.AGENT SalesPersonID, i.DESTCODE TerritoryID, ii.PART ProductID, ii.QUANT OrderQty,ii.PRICE UnitPrice, ii.PRICE * (1-isnull(DISCOUNT,0)) as UnitPriceDiscount,ii.QUANT * ii.PRICE * (1-isnull(DISCOUNT,0)) as LineTotal, cast(i.IV as varchar(10)) +'|'+ convert(varchar(5),ii.PART) as salesorderdetailIDfrom [dbo].[INVOICES] ileft join [dbo].[INVOICEITEMS] ii on i.IV=ii.IV-- dim employeeselect DISTINCT AGENT, AGENTNAMEfrom [dbo].[AGENTS]select  i.IV OrderID, i.IVDATE OrderDate, i.CUST CustomerID, i.AGENT SalesPersonID, i.DESTCODE TerritoryID, ii.PART ProductID, ii.QUANT OrderQty,ii.PRICE UnitPrice, ii.PRICE * (1-isnull(DISCOUNT,0)) as UnitPriceDiscount,ii.QUANT * ii.PRICE * (1-isnull(i.DISCOUNT,0)) as LineTotal,SUM(ii.QUANT * ii.PRICE * (1-isnull(i.DISCOUNT,0))) OVER(PARTITION BY i.IV) G,cast(i.IV as varchar(10)) +'|'+ convert(varchar(5),ii.PART) as salesorderdetailIDfrom [dbo].[INVOICES] ileft join [dbo].[INVOICEITEMS] ii on i.IV=ii.IVselect  IV OrderID, IVDATE OrderDate, CUST CustomerID, AGENT SalesPersonID, DESTCODE TerritoryID, PART ProductID, QUANT OrderQty,PRICE UnitPrice, QUANT * PRICE  as LineTotal,SUM(QUANT * PRICE ) OVER(PARTITION BY IV) TotalPerOrder,cast(IV as varchar(10)) +'|'+ convert(varchar(5),PART) as salesorderdetailIDfrom STG_ORDERSSELECT CAST(CAST(ivdate AS DATETIME) AS DATE) AS converted_dateFROM INVOICES;DROP TABLE [dbo].[MRR_COUNTRIES]GOCREATE PROCEDURE TruncateMRR_ORDERS
AS
 
    TRUNCATE TABLE [dbo].[MRR_INVOICES]
   
    TRUNCATE TABLE [dbo].[MRR_INVOICEITEMS]GOCREATE PROCEDURE TruncateMRR
AS
 
    TRUNCATE TABLE [dbo].[MRR_PART]
   
    TRUNCATE TABLE [dbo].[MRR_FAMILY]
    
    TRUNCATE TABLE [dbo].[MRR_FAMILYTYPES]

	TRUNCATE TABLE [dbo].[MRR_CUSTOMERS]

	TRUNCATE TABLE [dbo].[MRR_DESTCODES]

	TRUNCATE TABLE [dbo].[MRR_STATES]
   
    TRUNCATE TABLE [dbo].[MRR_COUNTRIES]
    
    TRUNCATE TABLE [dbo].[MRR_AGENTS]

	TRUNCATE TABLE [dbo].[MRR_BRANCHES]

	
GO
DROP TABLE [dbo].[DIM_PRODUCTS_HISTORY]

select d.ADDRESS,  d.DESTCODE as TerritoryID, d.CITY, s.STATENAME as Region,  c.COUNTRY from DESTCODES dLEFT JOIN STATES S on d.STATE=s.STATEIDLEFT join COUNTRIES c on s.COUNTRY=c.COUNTRYCODEUPDATE PART
SET PARTNAME = 'MHFC Shirt'
WHERE PARTNAME = 'AWC Logo Cap'
 
 UPDATE PART
SET PARTNAME = 'Green Soccer Ball'
WHERE PARTNAME = 'Water Bottle - 30 oz.'

 UPDATE PART
SET PARTNAME = 'Team Poster'
WHERE PARTNAME = 'Sport-100 Helmet, Blue'

 UPDATE PART
SET PARTNAME = 'Tjaronn Chery Shirt'
WHERE PARTNAME = 'Long-Sleeve Logo Jersey, L'


 UPDATE PART
SET PARTNAME = 'Green Scarf'
WHERE PARTNAME = 'Sport-100 Helmet, Black'

 UPDATE FAMILY
SET FAMILYNAME = 'Jerseys'
WHERE FAMILYNAME = 'Caps'

 UPDATE FAMILY
SET FAMILYNAME = 'Soccer Balls'
WHERE FAMILYNAME = 'Bottles and Cages'

 UPDATE FAMILY
SET FAMILYNAME = 'Souvenirs'
WHERE FAMILYNAME = 'Posters'select * from [dbo].[Top5SellingProducts]select * from FactSalesinsert into [PriorityERP].DBO.CUSTOMERS ( cust, CUSTNAME)select distinct BusinessEntityID, FirstName+ ' '+ LastName from [AdventureWorks2019].[Person].Person pinsert into CUSTOMERS (cust, CUSTNAME)select distinct BusinessEntityID, FirstName+ ' '+ LastName from [AdventureWorks2019].[Person].Person pJOIN [AdventureWorks2019].[Sales].[SalesOrderHeader] s on s.CustomerID = p.BusinessEntityIDINSERT INTO [dbo].[AGENTS] (AGENT,AGENTNAME)VALUES(77777,'ONLINE')ALTER TABLE DIM_CUSTOMERS
ALTER COLUMN CustomerID INT NOT NULLALTER TABLE [dbo].[DIM_CUSTOMERS]
ADD CONSTRAINT PK_CUSTOMERS PRIMARY KEY (CustomerID)

ALTER TABLE DIM_EMPLOYEE
ALTER COLUMN EmployeeID INT NOT NULL

ALTER TABLE [dbo].[DIM_EMPLOYEE]
ADD CONSTRAINT PK_EMPLOYEE PRIMARY KEY (EmployeeID)

ALTER TABLE DIM_STORE
ALTER COLUMN Store INT NOT NULL

ALTER TABLE [dbo].[DIM_STORE]
ADD CONSTRAINT PK_STORE PRIMARY KEY (Store)

ALTER TABLE DIM_TERRITORY
ALTER COLUMN TerritoryID INT NOT NULL

ALTER TABLE [dbo].[DIM_TERRITORY]
ADD CONSTRAINT PK_TERRITORY PRIMARY KEY (TerritoryID)  

ALTER TABLE DIM_PRODUCTS
ALTER COLUMN ProductID INT NOT NULL


ALTER TABLE [dbo].[DIM_PRODUCTS]
ADD CONSTRAINT PK_Product PRIMARY KEY (ProductID) 



ALTER TABLE FactSales
ALTER COLUMN salesorderdetailID varchar(16) NOT NULL


ALTER TABLE [dbo].[FactSales]
ADD CONSTRAINT PK_sales PRIMARY KEY ([salesorderdetailID]) 

ALTER TABLE FactSales
ALTER COLUMN CustomerID INT NOT NULL


ALTER TABLE [dbo].[FactSales]
ADD CONSTRAINT FK_CustomerID
FOREIGN KEY (CustomerID) REFERENCES DIM_CUSTOMERS(CustomerID)


ALTER TABLE FactSales
ALTER COLUMN SalesPersonID INT NOT NULL


ALTER TABLE [dbo].[FactSales]
ADD CONSTRAINT FK_SalesPersonID
FOREIGN KEY (SalesPersonID) REFERENCES DIM_EMPLOYEE(EmployeeID)

ALTER TABLE FactSales
ALTER COLUMN TerritoryID INT NOT NULL

ALTER TABLE [dbo].[FactSales]
ADD CONSTRAINT FK_TerritoryID
FOREIGN KEY (TerritoryID) REFERENCES DIM_TERRITORY(TerritoryID)

ALTER TABLE FactSales
ALTER COLUMN ProductID INT NOT NULL

ALTER TABLE [dbo].[FactSales]
ADD CONSTRAINT FK_ProductID
FOREIGN KEY (ProductID) REFERENCES DIM_PRODUCTS(ProductID)

truncate table CUSTOMERS

insert into [PriorityERP].DBO.CUSTOMERS ( cust, CUSTNAME)select distinct a.CustomerID, FirstName+ ' '+ LastName from  [AdventureWorks2019].sales.Customer a join  [AdventureWorks2019].Person.Person b on a.PersonID = b.BusinessEntityIDINSERT INTO [dbo].[AGENTS] (AGENT,AGENTNAME)VALUES(77777,'ONLINE')TRUNCATE TABLE [dbo].[DIM_EMPLOYEE]SELECT VAT_TOTAL FROM [dbo].[FactSales] SELECT SUM(LINETOTAL)FROM FactSales WHERE SalesPersonID=77777select * from FactSales