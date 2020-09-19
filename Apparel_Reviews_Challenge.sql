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

-- Helpful Votes
SELECT vine, COUNT(helpful_votes) FROM vine_table WHERE vine is not null
GROUP BY vine; -- 5,903,986(N)/2,336(Y)

-- Vine Top 5 products Apparel
SELECT rev.product_id, COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND vine = 'Y'
GROUP BY product_id
ORDER BY COUNT(*) DESC LIMIT 10;

-- No Vine Top 5 products Apparel
SELECT rev.product_id, COUNT(*)
FROM vine_table AS vine, review_id_table AS rev
WHERE vine.review_id = rev.review_id AND vine = 'N'
GROUP BY product_id
ORDER BY COUNT(*) DESC LIMIT 10;

-- Percentage of Reviews that are vine. 
SELECT (SELECT CAST(COUNT(vine) as float) FROM vine_table WHERE vine = 'Y') / (SELECT CAST(COUNT(vine) as float) FROM vine_table WHERE vine is not  null); 