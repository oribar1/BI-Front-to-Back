-- dim customers
SELECT distinct(c.cust), c.CUSTNAME as FullName, d.ADDRESS, d.City, co.COUNTRY
FROM [dbo].[CUSTOMERS] c
left join INVOICES I on c.CUST=i.CUST
left join DESTCODES d on i.DESTCODE=d.DESTCODE
left join STATES S on d.STATE=s.STATEID
left join COUNTRIES co on s.COUNTRY=co.COUNTRYCODE

-- dim products
SELECT p.PART, p.PARTNAME, f.FAMILYNAME, ft.FTNAME
FROM [dbo].[PART] p
LEFT JOIN FAMILY f on p.FAMILY = f.FAMILY
LEFT JOIN FAMILYTYPES ft on f.FAMILYTYPE=ft.FAMILYTYPE

-- FactSales
select i.IV OrderID, i.IVDATE OrderDate, i.CUST CustomerID, i.AGENT SalesPersonID, i.DESTCODE TerritoryID, ii.PART ProductID, ii.QUANT OrderQty,
ii.PRICE UnitPrice, ii.PRICE * (1-isnull(DISCOUNT,0)) as UnitPriceDiscount,
ii.QUANT * ii.PRICE * (1-isnull(DISCOUNT,0)) as LineTotal, cast(i.IV as varchar(10)) +'|'+ convert(varchar(5),ii.PART) as salesorderdetailID
from [dbo].[INVOICES] i
left join [dbo].[INVOICEITEMS] ii on i.IV=ii.IV

-- dim employee
select DISTINCT AGENT, AGENTNAME
from [dbo].[AGENTS]