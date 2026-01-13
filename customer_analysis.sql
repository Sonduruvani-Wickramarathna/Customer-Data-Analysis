select * from customer_id 

---Q1. How many customers are there in each country?

SELECT 
    "country",
    COUNT(*) AS customer_count
FROM "customer_id"
GROUP BY "country"
ORDER BY customer_count DESC;

---Q2. Which cities have the highest number of customers?

SELECT City, COUNT(*) AS customer_count
FROM customer_id
GROUP BY City
ORDER BY customer_count DESC;

---Q3. How many customers have a valid subscription date recorded?

SELECT COUNT(*) AS subscribed_customers
FROM customer_id
WHERE Subscription_Date IS NOT NULL;

---Q4. What is the yearly trend of customer subscriptions?

SELECT
    EXTRACT(YEAR FROM "subscription_date"::DATE) AS subscription_year,
    COUNT(*) AS total_subscriptions
FROM "customer_id"
WHERE "subscription_date" IS NOT NULL
GROUP BY subscription_year
ORDER BY subscription_year;


---Q5. Which month has the highest number of new subscriptions?

SELECT
    TO_CHAR("subscription_date"::DATE, 'month') AS subscription_month,
    COUNT(*) AS total_subscriptions
FROM "customer_id"
WHERE "subscription_date" IS NOT NULL
GROUP BY subscription_month
ORDER BY total_subscriptions DESC
LIMIT 1;

---Q6. How many customers have provided both phone numbers?

SELECT COUNT(*) AS customers_with_two_phones
FROM customer_id
WHERE Phone_1 IS NOT NULL
  AND Phone_2 IS NOT NULL;

---Q7. What percentage of customers have missing email addresses?

SELECT
    ROUND(
        COUNT(*) FILTER (WHERE "email" IS NULL) * 100.0 / COUNT(*),
        2
    ) AS missing_email_percentage
FROM "customer_id";

---Q8. How many customers are associated with a company versus no company listed?

SELECT 
    CASE 
        WHEN Company IS NULL THEN 'No Company'
        ELSE 'Company Listed'
    END AS company_status,
    COUNT(*) AS customer_count
FROM customer_id
GROUP BY company_status;

---Q9. Which top 5 email domains are most commonly used by customers?

SELECT 
    SUBSTRING(Email FROM POSITION('@' IN Email) + 1) AS email_domain,
    COUNT(*) AS domain_count
FROM customer_id
WHERE Email IS NOT NULL
GROUP BY email_domain
ORDER BY domain_count DESC
LIMIT 5;

---Q10. Are there any duplicate customer IDs or email addresses in the dataset?

SELECT
    "customer_id",
    COUNT(*) AS occurrences
FROM "customer_id"
GROUP BY "customer_id"
HAVING COUNT(*) > 1;


---Q11. Customers with vs without subscription
SELECT
    CASE 
        WHEN "subscription_date" IS NULL THEN 'Not Subscribed'
        ELSE 'Subscribed'
    END AS subscription_status,
    COUNT(*) AS customer_count
FROM "customer_id"
GROUP BY subscription_status;

---Q 12.Customers per country (top 5 only)

SELECT "country", COUNT(*) AS customer_count
FROM "customer_id"
GROUP BY "country"
ORDER BY customer_count DESC
LIMIT 5;

---Q 13.Number of unique cities per country

SELECT "country", COUNT(DISTINCT "city") AS unique_cities
FROM "customer_id"
GROUP BY "country";

---Q 14.Customers with both phone numbers vs not
SELECT
    CASE
        WHEN "phone_1" IS NOT NULL AND "phone_2" IS NOT NULL
        THEN 'Both Phones'
        ELSE 'Incomplete Phones'
    END AS phone_status,
    COUNT(*) AS customer_count
FROM "customer_id"
GROUP BY phone_status;

---Q 15.Year-wise subscription count (fixed & working)

SELECT
    EXTRACT(YEAR FROM "subscription_date"::DATE) AS subscription_year,
    COUNT(*) AS subscriptions
FROM "customer_id"
WHERE "subscription_date" IS NOT NULL
GROUP BY subscription_year
ORDER BY subscription_year;

---Q 16.Month-wise subscription distribution (all months)

SELECT
    TO_CHAR("subscription_date"::DATE, 'Month') AS subscription_month,
    COUNT(*) AS subscriptions
FROM "customer_id"
WHERE "subscription_date" IS NOT NULL
GROUP BY subscription_month
ORDER BY subscriptions DESC;

---Q 17.Customers with company name vs individuals

SELECT
    CASE
        WHEN "company" IS NULL OR "company" = '' THEN 'Individual'
        ELSE 'company_customer'
    END AS customer_type,
    COUNT(*) AS total_customers
FROM "customer_id"
GROUP BY customer_type;

---Q 18.Top 5 email domains

SELECT
    SPLIT_PART("email", '@', 2) AS email_domain,
    COUNT(*) AS domain_count
FROM "customer_id"
WHERE "email" IS NOT NULL
GROUP BY email_domain
ORDER BY domain_count DESC
LIMIT 5;

---Q 19.Data quality check – missing values per column

SELECT
    COUNT(*) FILTER (WHERE "email" IS NULL) AS missing_email,
    COUNT(*) FILTER (WHERE "phone_1" IS NULL) AS missing_phone1,
    COUNT(*) FILTER (WHERE "phone_2" IS NULL) AS missing_phone2,
    COUNT(*) FILTER (WHERE "company" IS NULL) AS missing_company
FROM "customer_id";


