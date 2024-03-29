SELECT * FROM project.walmartsalesdata;
-- 1. How many unique cities does the data have?
select distinct(City) from walmartsalesdata;

-- 2. In which city is each branch?
select city, Branch from walmartsalesdata
group by city, Branch;

-- 3. How many unique product lines does the data have?
select distinct(product_line) from walmartsalesdata;

-- 4. What is the most common payment method?
select Payment, count(*) count from walmartsalesdata
group by Payment
order by count desc limit 1;

-- 5. What is the most selling product line?
select product_line, count(*) count from walmartsalesdata
group by product_line
order by count desc limit 1;

-- 6. What is the total revenue by month?
select date_format(Date, '%Y-%m') as  month, sum(Total) total_revenue from walmartsalesdata
group by date_format(Date, '%Y-%m')
order by total_revenue desc ;
-- 7.What month had the largest COGS?
SELECT DATE_FORMAT(Date, '%Y-%m') AS month,
       SUM(cogs) AS total_cogs
FROM walmartsalesdata
GROUP BY DATE_FORMAT(Date, '%Y-%m')
ORDER BY total_cogs DESC LIMIT 1;

-- 8. What product line had the largest revenue?
select product_line, sum(Total) revenue from walmartsalesdata
group by product_line
order by revenue desc limit 1;

-- 9. What is the city with the largest revenue?
select city, sum(Total) revenue from walmartsalesdata
group by city
order by revenue desc limit 1;

-- 10. What product line had the largest VAT?
select product_line, sum(`Tax 5%`) vat from walmartsalesdata
group by product_line
order by vat desc limit 1;

-- 11. Which branch sold more products than average product sold?
SELECT Branch, SUM(Quantity) AS total_quantity
FROM walmartsalesdata
GROUP BY Branch
HAVING total_quantity > (SELECT AVG(Quantity) FROM walmartsalesdata);

-- 12. What is the most common product line by gender?
select product_line, Gender, count(*) total from walmartsalesdata
group by product_line, Gender
order by total desc ;

-- 13. What is the average rating of each product line?
select product_line, avg(Rating) avg_rating from walmartsalesdata
group by product_line
order by avg_rating desc ;

-- 14. Which of the customer types brings the most revenue?
select `Customer type`, sum(Total) revenue from walmartsalesdata
group by `Customer type`
order by revenue desc limit 1;

-- 15. Which city has the largest tax percent/ VAT (Value Added Tax)?
select city ,sum(`Tax 5%`) as vat from walmartsalesdata
group by city order by vat desc limit 1;

-- 16. Which customer type pays the most in VAT?
select `Customer type` ,sum(`Tax 5%`) as vat from walmartsalesdata
group by `Customer type` order by vat desc limit 1;

-- 17. How many unique customer types does the data have?
select count(distinct (`Customer type`)) from walmartsalesdata;

-- 18. How many unique payment methods does the data have?
select count(distinct (`Payment`)) from walmartsalesdata;

-- 19. What is the most common customer type?
select distinct(`Customer type`), count(*) total from walmartsalesdata
group by `Customer type` order by Total desc limit 1;

-- 20. Which customer type buys the most?
select distinct(`Customer type`), sum(Quantity) total_buy  from walmartsalesdata
group by `Customer type` order by Total_buy desc limit 1;

-- 21. What is the gender of most of the customers?
select Gender, count(*) total from walmartsalesdata
group by Gender order by Total desc limit 1;

-- 22. What is the gender distribution per branch?
select Gender,Branch, count(*) total from walmartsalesdata
group by Gender,Branch order by Total desc ;

