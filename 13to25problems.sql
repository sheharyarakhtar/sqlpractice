#Problem 13
SELECT 
    OrderID,
    ProductID,
    UnitPrice,
    Quantity,
    (UnitPrice * Quantity) AS TotalPrice
FROM
    orderdetails
ORDER BY OrderID , ProductID;

#Problem14
SELECT COUNT(*) FROM customers;

#Problem15
SELECT MIN(OrderDate) FROM orders;

#Problem16
SELECT 
    country
FROM
    customers
GROUP BY country;

#Problem17
SELECT 
    COUNT(*), ContactTitle
FROM
    customers
GROUP BY ContactTitle;

#Problem18
SELECT 
    products.ProductID,
    products.ProductName,
    suppliers.CompanyName
FROM
    products
        LEFT JOIN
    suppliers ON products.SupplierID = suppliers.SupplierID;
    
#Problem19
select * from orders;
SELECT 
    orders.OrderID, DATE(orders.OrderDate), shippers.CompanyName
FROM
    orders
        LEFT JOIN
    shippers ON orders.ShipVia = shippers.ShipperID
WHERE
    OrderID <= 10800
Order by OrderID;  

#INTERMEDIATE PROBLEMS#
#Problem20
SELECT 
    COUNT(*) AS TotalProducts, categories.CategoryName
FROM
    categories
        LEFT JOIN
    products ON products.CategoryID = categories.CategoryID
GROUP BY categories.CategoryName
ORDER BY TotalProducts DESC;

#Problem21
SELECT 
    Country, City, COUNT(*) AS TotalCustomers
FROM
    customers
GROUP BY Country, City
ORDER BY TotalCustomers DESC;

#Problem22
SELECT 
    ProductID, ProductName, UnitsInStock, ReorderLevel
FROM
    products
WHERE
    UnitsInStock < ReorderLevel;
    
#Problem23
SELECT 
    ProductID,
    ProductName AS ProductsThatNeedOrdering,
    UnitsInStock,
    UnitsOnOrder,
    ReorderLevel,
    Discontinued
FROM
    products
WHERE
    UnitsInStock + UnitsOnOrder <= ReorderLevel
        AND Discontinued = 0;
#Problem24
SELECT 
    CustomerID, CompanyName, Region
FROM
    customers
ORDER BY (CASE
    WHEN region IS NULL THEN 1
    ELSE 0
END) , region , CustomerID;

#Problem25
SELECT 
    AVG(freight) AS Average_Freight, shipcountry
FROM
    orders
GROUP BY shipcountry
ORDER BY Average_Freight DESC
LIMIT 3;