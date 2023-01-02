# Project aims:
1. To explore the products that an imaginary company/individual would be interested in reselling. Which is done by using sentiment analysis and score trending views. 
2. To identify potential users that could be contracted to write paid reviews.

# How to run the code:
1. Assuming that both SQLite and Power BI Desktop are already installed, download the original dataset from here: https://www.kaggle.com/datasets/rajgupta2019/amazon-user-data?resource=download
2. Run the attached SQL code one-by-one (follow the order of the file names)
3. Given the constraints of using Power BI Service on a non-enterprise level, the sample dashboard is attached in pdf format. However, the dynamic Power BI dashboard would have otherwise been published on the Cloud and shared across the organisation.

# Methodology:
The number in brackets refers to the SQL file.

1. The first step is to duplicate the original table (1) - this way the original table can be kept as is while still being able to track and audit changes to the data. The major changes to the original table were a more careful selection of columns (for example, ProfileName is a redundant column as we already have UserId), timestamp type conversion and deletion of duplicate rows (2).

2. To find products that are 'worth' considering for resale, the following steps were made:
* The average score was calculated for each product - products with a 4.5 or higher score were identified as well sold products.
* Products with 50 or fewer reviews were not considered to ensure sufficient reliability of the average score (3). 

3. The following criteria were applied to find the most 'helpful' users who could potentially be hired to write paid reviews:
* A user must have an average HelpfulnessNumerator of 10 or more **and** their average HelpfulnessDenominator should not exceed its HelpfulnessNumerator. This would ensure that a sufficient number of people found the user's review more helpful than not.
* A user must also have left at least three or more reviews to ensure that their average helpfulness takes into account a sufficient number of reviews.
* This leaves us with a list of 31 users that could be contracted to write paid reviews (4).
* An additional column is added to the modified table, where we map if each user in each row matches to the list of helpful users identified above (5). If it's a match we populate with 1 (to represent TRUE), otherwise 0 (to represent FALSE).

# Outputs:
These findings were then visualised using Power BI desktop. See bullet 3 of the **How to run the code** section for more explanation.

* In the top left corner there are two filters: Year and Product ID. These update all charts in the dashboard with the exception of Word Cloud in the bottom left corner, which is a static view of most common words for the most highly rated products that we had identified in **step 2 of the Methodology section**.
* Bottom right Word Cloud visual is, on the other hand, a dynamic view that allows to see the most common words in reviews for any given year/product.
* Above that there is a line chart that shows a trending view of average product scores by quarter for a given year/product.
* Similarly, the KPI card above the line chart shows the average score of a product for a given year.
* Lastly, a table in the top right corner shows the list of the most helpful users for a given year/product.
