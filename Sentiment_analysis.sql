create database Sentiment_analysis;
use sentiment_analysis;
/*CREATE TABLE sentiment_data (
    id INT AUTO_INCREMENT PRIMARY KEY, text TEXT NOT NULL,
    sentiment VARCHAR(10) NOT NULL);
    insert into sentiment_data values(1 , "Happy" , "Joy" );
    */
  select * from `dataset sentiment`;

-- 1. Sentiment Analysis
-- To get a count of each sentiment category:
SELECT Sentiment, COUNT(*) AS Count
FROM `dataset sentiment`
GROUP BY Sentiment
ORDER BY Count DESC;

-- 2. Temporal Analysis
-- To analyze the number of posts over time (e.g., by month):
SELECT YEAR(Timestamp) AS Year, MONTH(Timestamp) AS Month, COUNT(*) AS PostCount
FROM `dataset sentiment`
GROUP BY YEAR(Timestamp), MONTH(Timestamp)
ORDER BY Year, Month;

-- 3. User Behavior Insights
-- To analyze average likes and retweets per sentiment:
SELECT Sentiment, AVG(Likes) AS AvgLikes, AVG(Retweets) AS AvgRetweets
FROM `dataset sentiment`
GROUP BY Sentiment
ORDER BY AvgLikes DESC;

-- 4. Platform-Specific Analysis
-- To compare sentiments across different platforms:
SELECT Platform, Sentiment, COUNT(*) AS Count
FROM `dataset sentiment`
GROUP BY Platform, Sentiment
ORDER BY Platform, Count DESC;

-- 5. Hashtag Trends
-- To find the most common hashtags used:
SELECT Hashtags, COUNT(*) AS Count
FROM `dataset sentiment`
WHERE Hashtags IS NOT NULL AND Hashtags != ''
GROUP BY Hashtags
ORDER BY Count DESC
LIMIT 10;  -- Adjust the limit as needed

-- 6. Geographical Analysis
-- To analyze sentiment distribution by country:
SELECT Country, Sentiment, COUNT(*) AS Count
FROM `dataset sentiment`
GROUP BY Country, Sentiment
ORDER BY Country, Count DESC;

-- 7. User Identification
-- To track contributions of specific users:
SELECT User, COUNT(*) AS PostCount, AVG(Likes) AS AvgLikes, AVG(Retweets) AS AvgRetweets
FROM `dataset sentiment`
GROUP BY User
ORDER BY PostCount DESC
LIMIT 10;  -- Top 10 users

-- 8. Cross-Analysis
-- To analyze sentiment trends over time by platform:
SELECT YEAR(timestamp) AS Year, MONTH(timestamp) AS Month, Platform, Sentiment, COUNT(*) AS Count
FROM`dataset sentiment`
GROUP BY YEAR(timestamp), MONTH(timestamp), Platform, Sentiment
ORDER BY Year, Month, Platform, Count DESC;