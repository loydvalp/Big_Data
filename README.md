# Big_Data
 
## Project Overview

BigMarket is a startup that helps businesses optimize their marketing efforts.  One of the clients has requested some analytics.  The company called $ellby is about to release a large catalog of products on a leading retail website.  They want to knew how the reviews on their products compare to the reviews on other products sold by their competitors. Also, they are interested in enrolling in a program that gives out free products to select reviewers.  There are thousands of reviews to analyze. 

## Resources

Data Sources:  Google Colab Notebook, spark 3.0.1, Java, Amazon Web Services (RDS database), pgAdmin 4, review datasets, Scheme.sql

## Challenge Overview

The goals of this challenge:

1. Perform ETL on one of the review datasets.
2. Store your results on an AWS RDS database.
3. Determine if reviews are biased using PySpark or SQL with the appropriate statistical methods.

## Results

Source:  https://s3.amazonaws.com/amazon-reviews-pds/tsv/amazon_reviews_us_Apparel_v1_00.tsv.gz

Google Colab Notebook: https://colab.research.google.com/drive/1t20x0I6AC_7hOSLFm84lkpktCNpGroCJ?usp=sharing

### Statistical analysis to determine whether reviews are biased from Amazon's Vine program

- There were 5,903,986 non-vine customers, 2,336 vine customers, and 11 null values. 
- The top 5 customers with the most reviews were non-vine customers.
- The top 5 products were reviwed by non-vine customers.
- 5 Star Reviews: 99.97% of the non-Vine reviewers gave a 5 star rating, compared to 0.03% for Vine reviewers.
- 4 Star Reviews: 99.92% of the non-Vine reviewers gave a 4 star rating, compared to 0.07% for Vine reviewers.
- 3 Star Reviews: 99.95% of the non-Vine reviewers gave a 3 star rating, compared to 0.05% for Vine reviewers.
- 2 Star Reviews: 99.98% of the non-Vine reviewers gave a 2 star rating, compared to 0.02% for Vine reviewers.
- 1 Star Reviews: 99.99% of the non-Vine reviewers gave a 1 star rating, compared to 0.01% for Vine reviewers.
- The fields of Helpful Votes and Total Votes appear to be duplicates of the review counts.


#### Conclusion

So are the Vines Reviewed biased? Almost 100% of the reviews came for non-vine users. The majority of the product's reviews for the apparel have a rating of 5 stars between both vine and non-vine.  47.4% of vine reviews were 5 stars.  56.2% of non-vine reviews were 5 stars.  4.8% of vine reviews were 2 stars or less.  13.8% of non-vine reviews were 2 stars or less.  Even though the majority of the users were non-vine, vine users rated the products higher.  95.2% of vine users gave a rating of 3 stars or higher.  86.2 % of non-vine users gave a rating of 3 stars or higher.  Vine users may be a little biased with the rating.  However, it is not 100% conclusive.  
