-- Yearly sales
SELECT YEAR(order_req) year, SUM(qty*perprice) sales
FROM master_transaksi
GROUP BY year
ORDER BY year ASC;

WHERE YEAR(order_req) != '2021' AND YEAR(order_req) != '2015'

-- Count of records each year
SELECT YEAR(order_req) year, COUNT(*) count
FROM master_transaksi
GROUP BY year
ORDER BY year DESC;

-- Customers and their sum of spending
SELECT custName, SUM(qty*perprice) sales
FROM master_transaksi
GROUP BY custName
ORDER BY sales DESC;

-- Customers and their total spending in percentage
WITH totalsales AS (
	SELECT SUM(perprice*qty) grand_total
	FROM master_transaksi)

SELECT custName, ((SUM(perprice*qty)*100)/(SELECT grand_total FROM totalsales)) sales_percentage
FROM master_transaksi
GROUP BY custName
ORDER BY sales_percentage DESC;

-- Each item type sales
SELECT p.itemType, SUM(t.perprice*t.qty) sales
FROM master_transaksi t
JOIN master_produk p ON t.productName = p.productName
WHERE YEAR(order_req) = 2016
GROUP BY p.itemType
ORDER BY sales DESC;

-- Each item type sales in percentage
WITH totalsales AS (
	SELECT SUM(perprice*qty) grand_total
	FROM master_transaksi)

SELECT p.itemType, ((SUM(t.perprice*t.qty)*100)/(SELECT grand_total FROM totalsales)) sales_percentage
FROM master_transaksi t
JOIN master_produk p ON t.productName = p.productName
GROUP BY p.itemType
ORDER BY sales_percentage DESC;

-- How many unique customers in each province
SELECT province, COUNT(*) amount
FROM master_customer
GROUP BY province
ORDER BY amount DESC;

-- Sales of each province in percentage
WITH totalsales AS (
	SELECT SUM(perprice*qty) grand_total
	FROM master_transaksi)

SELECT c.province, ((SUM(t.perprice*t.qty)*100)/(SELECT grand_total FROM totalsales)) sales_percentage
FROM master_transaksi t
JOIN master_customer c ON t.custName = c.custName
GROUP BY c.province
ORDER BY sales_percentage DESC;

-- Customer retention 
WITH customer_orders AS (
  SELECT
    custName AS customer_id,                         
    EXTRACT(YEAR FROM order_sent) AS purchase_year,   
    COUNT(orderID) AS order_count                     
  FROM master_transaksi
  GROUP BY 1, 2                                      
)
SELECT
  purchase_year,                                      
  COUNT(DISTINCT customer_id) AS unique_customers,    
  COUNT(CASE WHEN order_count >= 2 THEN customer_id END) AS repeat_customers,
  ROUND((COUNT(CASE WHEN order_count >= 2 THEN customer_id END) * 1.0 / COUNT(DISTINCT customer_id)) * 100, 2) AS repeat_rate 
FROM customer_orders
WHERE purchase_year IS NOT NULL                      
  AND purchase_year NOT IN (2015, 2021)               
GROUP BY 1                                            
ORDER BY 1;           


-- AOV
SELECT YEAR(order_req) year, ((SUM(qty*perprice))/COUNT(*)) AOV
FROM master_transaksi
GROUP BY YEAR(order_req)
ORDER BY YEAR(order_req);

-- Sales percentage of every product
WITH total_sales AS(
	SELECT SUM(qty*perprice) totalsale
    FROM master_transaksi
    WHERE YEAR(order_req) NOT IN (2015, 2021))

SELECT productName, ROUND((SUM(qty*perprice)*100/(SELECT totalsale FROM total_sales)), 2) sales_pct
FROM master_transaksi
GROUP BY productName
ORDER BY sales_pct DESC;

-- COUNT of Each Item/Product Type
WITH totalcount AS (
	SELECT COUNT(*) orderscount
    FROM master_transaksi)

SELECT p.itemType, ROUND((COUNT(p.itemType)*100)/(SELECT orderscount FROM totalcount), 1) countpct
FROM master_transaksi t
JOIN master_produk p ON t.productName = p.productName
WHERE YEAR(order_req) NOT IN (2015, 2021)
GROUP BY p.itemType
ORDER BY countpct DESC;

