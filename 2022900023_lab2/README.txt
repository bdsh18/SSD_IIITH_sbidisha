IIITH_Lab SQL Procedures
=================================
---Create database :

create database if not exists IIITH_Lab;
use IIITH_Lab;

-- Create Tables

CREATE TABLE Shows (
ShowID INT PRIMARY KEY,
Title VARCHAR(100),
Genre VARCHAR(50),
ReleaseYear INT
);
CREATE TABLE Subscribers (
SubscriberID INT PRIMARY KEY,
SubscriberName VARCHAR(100),
SubscriptionDate DATE
);
CREATE TABLE WatchHistory (
HistoryID INT PRIMARY KEY,
ShowID INT,
SubscriberID INT,
WatchTime INT, -- Duration in minutes
FOREIGN KEY (ShowID) REFERENCES Shows(ShowID),
FOREIGN KEY (SubscriberID) REFERENCES
Subscribers(SubscriberID)
);
-- Insert Sample Data
INSERT INTO Shows (ShowID, Title, Genre, ReleaseYear) VALUES
(1, 'Stranger Things', 'Sci-Fi', 2016),
(2, 'The Crown', 'Drama', 2016),
(3, 'The Witcher', 'Fantasy', 2019);

INSERT INTO Shows (ShowID, Title, Genre, ReleaseYear) VALUES
(4, 'Money Heist', 'Thriller', 2017),
(5, 'Breaking Bad', 'Crime', 2008),
(6, 'Dark', 'Mystery', 2017);


INSERT INTO Subscribers (SubscriberID, SubscriberName,
SubscriptionDate) VALUES
(1, 'Emily Clark', '2023-01-10'),
(2, 'Chris Adams', '2023-02-15'),
(3, 'Jordan Smith', '2023-03-05');

INSERT INTO Subscribers (SubscriberID, SubscriberName, SubscriptionDate) VALUES
(4, 'Sam Lee', '2023-03-20'),
(5, 'Ava Patel', '2023-04-02');

INSERT INTO WatchHistory (HistoryID, SubscriberID, ShowID,
WatchTime) VALUES
(1, 1, 1, 100),
(2, 1, 2, 10),
(3, 2, 1, 20),
(4, 2, 2, 40),
(5, 2, 3, 10),
(6, 3, 2, 10),
(7, 3, 1, 10);

INSERT INTO WatchHistory (HistoryID, SubscriberID, ShowID, WatchTime) VALUES
(8, 4, 5, 50),
(9, 4, 3, 30),
(10, 5, 4, 70),
(11, 5, 6, 45),
(12, 3, 4, 25);
INSERT INTO WatchHistory (HistoryID, SubscriberID, ShowID, WatchTime) VALUES
(13, 1, 3, 50);


select * from Shows;
select * from Subscribers;
select * from WatchHistory;



This repository contains 5 MySQL stored procedure scripts for managing and reporting subscriber watch history in the IIITH_Lab database.

Files:
------
1. q1.sql - ListAllSubscribers()
   - Lists all subscriber names using a cursor.
2. q2.sql - GetWatchHistoryBySubscriber(IN sub_id INT)
   - Returns all shows watched by a specific subscriber with watch time.
3. q3.sql - AddSubscriberIfNotExists(IN subName VARCHAR(100))
   - Adds a new subscriber if the subscriber name does not already exist.
4. q4.sql - SendWatchTimeReport()
   - Calls GetWatchHistoryBySubscriber() for all subscribers who have watched any shows.
5. q5.sql - PrintAllSubscribersWatchHistory()
   - Calls GetWatchHistoryBySubscriber() for all subscribers regardless of watch history.

How to Execute:
---------------
1. Open your MySQL  Workbench.
2. Make sure you have created and are using the database `iiith_lab` with all the required tables (`Shows`, `Subscribers`, and `WatchHistory`) populated.
3. Run each SQL script file in order or individually.

Git repository link :
---------------------
https://github.com/bdsh18/SSD_IIITH_sbidisha/2022900023_lab2

