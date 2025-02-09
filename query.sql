-- Cleaning the ' marks in customer's name
UPDATE master_customer
SET name = REPLACE(REPLACE(name, '"', ''), '''', '');

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
SELECT customer_id, SUM(qty*perprice) sales
FROM master_transaksi
GROUP BY customer_id
ORDER BY sales DESC;

-- Customers and their total spending in percentage
WITH totalsales AS (
	SELECT SUM(perprice*qty) grand_total
	FROM master_transaksi)

SELECT customer_id, ((SUM(perprice*qty)*100)/(SELECT grand_total FROM totalsales)) sales_percentage
FROM master_transaksi
GROUP BY customer_id
ORDER BY sales_percentage DESC;

-- Each item type sales
SELECT p.category, SUM(t.perprice*t.qty) sales
FROM master_transaksi t
JOIN master_produk p ON t.product_id = p.product_id
WHERE YEAR(order_req) = 2016
GROUP BY p.category
ORDER BY sales DESC;

-- Each item type sales in percentage
WITH totalsales AS (
	SELECT SUM(perprice*qty) grand_total
	FROM master_transaksi)

SELECT p.category, ((SUM(t.perprice*t.qty)*100)/(SELECT grand_total FROM totalsales)) sales_percentage
FROM master_transaksi t
JOIN master_produk p ON t.product_id = p.product_id
GROUP BY p.category
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
JOIN master_customer c ON t.customer_id = c.customer_id
GROUP BY c.province
ORDER BY sales_percentage DESC;

-- Customer retention 
WITH customer_orders AS (
  SELECT
    customer_id AS customer_id,                         
    EXTRACT(YEAR FROM order_sent) AS purchase_year,   
    COUNT(order_id) AS order_count                     
  FROM master_transaksi
  GROUP BY 1, 2                                      
)
SELECT
  purchase_year,                                      
  COUNT(DISTINCT customer_id) AS unique_customers,    
  COUNT(CASE WHEN order_count >= 2 THEN customer_id END) AS repeat_customers,
  ROUND((COUNT(CASE WHEN order_count >= 2 THEN customer_id END) * 1.0 / COUNT(DISTINCT customer_id)) * 100, 2) AS repeat_rate 
FROM customer_orders                           
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

SELECT product_id, ROUND((SUM(qty*perprice)*100/(SELECT totalsale FROM total_sales)), 2) sales_pct
FROM master_transaksi
GROUP BY product_id
ORDER BY sales_pct DESC;

-- COUNT of Each Item/Product Type
WITH totalcount AS (
	SELECT COUNT(*) orderscount
    FROM master_transaksi)

SELECT p.category, ROUND((COUNT(p.category)*100)/(SELECT orderscount FROM totalcount), 1) countpct
FROM master_transaksi t
JOIN master_produk p ON t.product_id = p.product_id
GROUP BY p.category
ORDER BY countpct DESC;
