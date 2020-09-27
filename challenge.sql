CREATE TABLE review_id_table (
  review_id TEXT PRIMARY KEY NOT NULL,
  customer_id INTEGER,
  product_id TEXT,
  product_parent INTEGER,
  review_date DATE -- this should be in the formate yyyy-mm-dd
);

-- This table will contain only unique values
CREATE TABLE products (
  product_id TEXT PRIMARY KEY NOT NULL UNIQUE,
  product_title TEXT
);

-- Customer table for first data set
CREATE TABLE customers (
  customer_id INT PRIMARY KEY NOT NULL UNIQUE,
  customer_count INT
);

-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT
);

commit;

select * from customers;
select * from products;
select * from review_id_table;
select * from vine_table;

--Total reviews
select count(*) from review_id_table; -- 5,906,333

--Total unique customers
select count(*) from customers; -- 3,228,415

--Total unique products
select count(*) from products; -- 2,305,627

--Total reviews for apparel
select count(*) from vine_table; --5,906,333

--Top 10 customers
SELECT * FROM customers ORDER BY customer_count DESC LIMIT 10;

--Customer with more reviews
SELECT MAX(customer_count) FROM customers; --559

-- Count by vine review
SELECT vine, COUNT(vine) 
FROM vine_table WHERE vine is not null
GROUP BY vine;   -- 5,903,986(N)/2,336(Y)

--All Rating Counts
SELECT vine, star_rating, COUNT(star_rating)
FROM vine_table WHERE vine is not null 
GROUP BY vine, star_rating; 

-- 5 Star Rating Counts
SELECT vine, star_rating, COUNT(star_rating) 
FROM vine_table WHERE vine is not null and star_rating = '5'
GROUP BY vine, star_rating;  -- 3,319,450(N)/1,107(Y)

-- 4 Star Rating Counts
SELECT vine, star_rating, COUNT(star_rating) 
FROM vine_table WHERE vine is not null and star_rating = '4'
GROUP BY vine, star_rating;  -- 1,146,396(N)/841(Y)

-- 3 Star Rating Counts
SELECT vine, star_rating, COUNT(star_rating) 
FROM vine_table WHERE vine is not null and star_rating = '3'
GROUP BY vine, star_rating;  -- 623,196(N)/275(Y)

-- 2 Star Rating Counts
SELECT vine, star_rating, COUNT(star_rating) 
FROM vine_table WHERE vine is not null and star_rating = '2'
GROUP BY vine, star_rating;  -- 369,514(N)/87(Y)

-- 1 Star Rating Counts
SELECT vine, star_rating, COUNT(star_rating) 
FROM vine_table WHERE vine is not null and star_rating = '1'
GROUP BY vine, star_rating;  -- 445,430(N)/26(Y)

-- Helpful Votes
SELECT vine, COUNT(helpful_votes) FROM vine_table WHERE vine is not null
GROUP BY vine; -- 5,903,986(N)/2,336(Y)

-- Vine reviews for apparel top 5 customers
SELECT customer_id, COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND vine = 'Y'
GROUP BY customer_id
ORDER BY COUNT(*) DESC LIMIT 5;

-- Vine Top 5 products Apparel
SELECT rev.product_id, COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND vine = 'Y'
GROUP BY product_id
ORDER BY COUNT(*) DESC LIMIT 10;

-- Vine Top 5 products Apparel Get star rating
SELECT rev.product_id, vine.star_rating, COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND vine = 'Y'
AND (rev.product_id = 'B002BFLJ70' OR rev.product_id = 'B00FXPRJWO' 
	 OR rev.product_id = 'B004OA7QVI' OR rev.product_id = 'B004OA7QYA' 
	 OR rev.product_id = 'B004OA7QT0')
GROUP BY rev.product_id, vine.star_rating;

-- No Vine reviews for apparel top 5 customers
SELECT customer_id, COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND vine = 'N'
GROUP BY customer_id
ORDER BY COUNT(*) DESC LIMIT 5;

-- No Vine Top 5 products Apparel
SELECT rev.product_id, COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND vine = 'N'
GROUP BY product_id
ORDER BY COUNT(*) DESC LIMIT 10;

-- No Vine Top 5 products Apparel Get star rating
SELECT rev.product_id, vine.star_rating, COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND vine = 'N'
AND (rev.product_id = 'B004M6XUI2' OR rev.product_id = 'B004M6UDF0' 
	 OR rev.product_id = 'B006PGGJOE' OR rev.product_id = 'B0045H0L1W' 
	 OR rev.product_id = 'B004M6UD46')
GROUP BY rev.product_id, vine.star_rating;

-- Percentage of Reviews that are vine. 
SELECT (SELECT CAST(COUNT(vine) as float) FROM vine_table WHERE vine = 'Y') / (SELECT CAST(COUNT(vine) as float) FROM vine_table WHERE vine is not  null); 









