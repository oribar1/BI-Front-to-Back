SELECT TOP (1000) [PARTNAME]
      ,[PART]
      ,[TYPE]
      ,[T$PROC]
      ,[PARTDES]
      ,[UNIT]
      ,[UPD]
      ,[LEADTIME]
      ,[STATUS]
      ,[FATQUANT]
      ,[PRICE]
      ,[LASTPRICE]
      ,[COST]
      ,[REV]
      ,[PRIVTYPE]
      ,[PATTERN]
      ,[SERNPATTERN]
      ,[PUNIT]
      ,[CONV]
      ,[AVGDATE]
      ,[KITFLAG]
      ,[DOLLAR]
      ,[TAKEFLAG]
      ,[WTYPE]
      ,[PREFERRED]
      ,[EXCESS]
      ,[PARTPARAM]
      ,[PDES]
      ,[COSTDATE]
      ,[MPART]
      ,[AUTOSERIAL]
      ,[SIZEBAR]
      ,[CURRENCY]
      ,[SCRAP]
      ,[SECONDCOST]
      ,[SECONDPRICE]
      ,[COSTQUANT]
      ,[ACTUALCOSTTYPE]
      ,[SERNFLAG]
      ,[FAMILY]
      ,[CURDATE]
      ,[LASTCURRENCY]
      ,[LASTCOSTFLAG]
      ,[REVFLAG]
      ,[PRICEFLAG]
      ,[FOBPRICE]
      ,[FOBCURRENCY]
      ,[PURPRICE]
      ,[T$USER]
      ,[UDATE]
      ,[BARCODE]
      ,[MAXREPAIRPRICE]
      ,[REPAIRCURRENCY]
      ,[UNSPSC]
      ,[MOLDPART]
      ,[RBALANCE]
      ,[PARTTYPE]
      ,[PARTSTAT]
      ,[OWNER]
      ,[EXTFILEFLAG]
      ,[LOCFLAG]
      ,[PRICEPOLICY]
      ,[TURNKEY]
      ,[SHOWINWEB]
      ,[PALLETTYPE]
      ,[SUPERPHARM]
      ,[NOTFIXEDCONV]
      ,[LOTBYVENDOR]
      ,[MINPRICE]
      ,[STORAGETYPE]
      ,[PIKORDER]
      ,[CREATEDDATE]
      ,[ILOTBYVENDOR]
      ,[PICKBYPACKS]
      ,[COMPANY]
      ,[WMSSERVFLAG]
      ,[DCMONTHS]
      ,[COLORPART]
      ,[CALCSTDCOST]
      ,[MINEXPDAYS]
  FROM [PriorityERP].[dbo].[PART]

  insert into PART  (PARTNAME,PART)
  values ('try',11111)

  DELETE FROM PART
WHERE PARTNAME = 'try' AND PART = 11111

truncate table mrr_part

  select * from DIM_PRODUCTS_HISTORY where ProductID = 11111
  select * from dim_PRODUCTS


  update Dim_Products_Historyset enddate = GETDATE()where ProductID in (select productidfrom DIM_PRODUCTS_HISTORY hleft join STG_PRODUCTS p on p.PART=h.ProductIDwhere part is null and Enddate is null);alter table dim_productsadd status bit default 1;select * from Dim_Products dleft join Stg_Products s on d.ProductID=s.PARTwhere s.PART is nullupdate Dim_Products_Historyset EndDate = getdate()where ProductID in (select ProductIDfrom Dim_Products dleft join STG_PRODUCTS s on d.ProductID=s.partwhere s.part is null) and EndDate IS NULLupdate Dim_Productsset Status = 0where ProductID in (select ProductIDfrom Dim_Products dleft join STG_PRODUCTS s on d.ProductID=s.partwhere s.part is null)alter table dim_productsadd Status bit default 1update Dim_Productsset Status = 1select * from STG_PRODUCTSselect * from [dbo].[DIM_TERRITORY]select * from DIM_PRODUCTS_HISTORYDELETE FROM DIM_PRODUCTS_HISTORY WHERE ProductID=11111INSERT INTO STG_PRODUCTS(PART,PARTNAME)VALUES(11111,'TRY')DELETE FROM STG_PRODUCTS WHERE PART=11111/*בדיקה אליסון וצחיinsert into mrr_part (part, PARTNAME)select   part, PARTNAMEfrom [PriorityERP].dbo.PARTupdate mrr_product set partname = 'ABC' where part = 1*/