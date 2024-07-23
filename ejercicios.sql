-- 3)
select productName , quantityInStock from products ORDER BY quantityInStock DESC;


-- 4)
select orderDate from orders ORDER BY orderDate DESC limit 3;

-- 5)
select productName, productLine from products where productLine like '%cars%'

-- 6)
select productCode, productLine from products where productLine not like '%cars%' and productLine not like '%Motorcycles%';

-- 7)
select c.customerName, c.contactFirstName, c.contactLastName, p.productLine from customers c 
inner join orders o on c.customerNumber = o.customerNumber 
inner join orderdetails od on o.orderNumber = o.orderNumber 
inner join products p  on p.productCode = od.productCode
where p.productLine like '%planes';

-- 8)
SELECT pl.productLine, COUNT(*) FROM productlines pl
INNER JOIN products p ON pl.productLine = p.productLine 
GROUP BY pl.productLine ;

-- 10)
SELECT p.buyPrice, p.productName, o.orderDate  FROM products p
INNER JOIN orderdetails od ON p.productCode = od.productCode 
INNER JOIN orders o ON o.orderNumber = od.orderNumber 
GROUP BY o.orderDate ORDER BY p.buyPrice DESC;

-- 11)
SELECT SUM(p.buyPrice), e.firstName, e.lastName  FROM products p 
INNER JOIN orderdetails od ON od.productCode = p.productCode 
INNER JOIN orders o ON o.orderNumber = od.orderNumber 
INNER JOIN customers c ON c.customerNumber = o.customerNumber 
INNER JOIN employees e ON e.employeeNumber = c.salesRepEmployeeNumber 
GROUP BY e.firstName, e.lastName ORDER BY SUM(p.buyPrice);

-- 12)
SELECT o.officeCode, COUNT(*) FROM offices o 
INNER JOIN employees e ON e.officeCode = o.officeCode 
GROUP BY o.officeCode; 

-- 13)
SELECT SUM(p.buyPrice), DATE_FORMAT(o.orderDate, '%Y-%m') AS month FROM products p 
INNER JOIN orderdetails od ON od.productCode = p.productCode 
INNER JOIN orders o ON o.orderNumber = od.orderNumber
GROUP BY DATE_FORMAT(o.orderDate, '%Y-%m')
ORDER BY month DESC;

-- 14)
SELECT p.productName, COUNT(*), DATE_FORMAT(o.orderDate, '%Y-%m') AS month FROM products p 
INNER JOIN orderdetails od ON od.productCode = p.productCode 
INNER JOIN orders o ON o.orderNumber = od.orderNumber
GROUP BY p.productName
ORDER BY month DESC;

-- 15)
SELECT p.productName, COUNT(*) FROM products p 
INNER JOIN orderdetails od ON p.productCode = od.productCode 
GROUP BY p.productName 
HAVING COUNT(*) = 0;

-- 16)
SELECT p.productName, pl.textDescription  FROM products p 
INNER JOIN productlines pl ON pl.productLine = p.productLine 
WHERE pl.textDescription LIKE "%red" OR pl.textDescription LIKE "%blue" OR pl.productLine LIKE "%amarillo"
GROUP BY p.productName 

-- 17)
SELECT p.productName, pl.textDescription, SUM(od.quantityOrdered * od.priceEach) AS businessVolume
FROM productlines pl
INNER JOIN products p ON p.productLine = pl.productLine 
INNER JOIN orderdetails od ON od.productCode = p.productCode 
WHERE pl.textDescription LIKE '%red%' OR pl.textDescription LIKE '%azul%'
GROUP BY p.productName ORDER BY  businessVolume 
