# Looking for Suspicious Transactions


## Background

Fraud is prevalent these days, whether you are a small taco shop or a large international business. While there are emerging technologies that employ machine learning and artificial intelligence to detect fraud, many instances of fraud detection still require strong data analytics to find abnormal charges.

In this repo I have used SQL to analyze historical credit card transactions and consumption patterns in order to identify possible fraudulent transactions. The following tasks have been completed:

1. Data Modeling: Define a database model to store the credit card transactions data and create a new PostgreSQL database using your model.

2. Data Engineering: Create a database schema on PostgreSQL and populate your database from the CSV files provided.

3. Data Analysis: Analyze the data to identify possible fraudulent transactions.

---

## The Process

### Data Modeling

I have created an entity relationship diagram (ERD) based on the CSV files. You can view the ERD file in the ERD notebook.

### Data Engineering

Using the database model as a blueprint I have created a database schema for each of the tables and relationships. After creating the database schema, I imported the data from the corresponding CSV files.

### Data Analysis

It's time to identify fraudulent transactions. In this part of the homework assignment, you will analyze the data and then create a report to present your findings. You can use a Jupyter Notebook, a markdown file, or a word processor. Your report should answer the following questions:

* How can you isolate (or group) the transactions of each cardholder?

* Consider the time period 7:00 a.m. to 9:00 a.m.

  * What are the top 100 highest transactions during this time period?

  * Do you see any fraudulent or anomalous transactions?

  * If you answered yes to the previous question, explain why you think there might be fraudulent transactions during this time frame.

* Some fraudsters hack a credit card by making several small payments (generally less than $2.00), which are typically ignored by cardholders. Count the transactions that are less than $2.00 per cardholder. Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.

* What are the top 5 merchants prone to being hacked using small transactions?

* Once you have a query that can be reused, create a view for each of the previous queries.

Create a report for fraudulent transactions of some top customers of the firm. To achieve this task, perform a visual data analysis of fraudulent transactions using Pandas, Plotly Express, hvPlot, and SQLAlchemy to create the visualizations.

* Verify if there are any fraudulent transactions in the history of two of the most important customers of the firm. For privacy reasons, you only know that their cardholders' IDs are 18 and 2.

  * Using hvPlot, create a line plot representing the time series of transactions over the course of the year for each cardholder. In order to compare the patterns of both cardholders, create a line plot containing both lines.

  * What difference do you observe between the consumption patterns? Does the difference suggest a fraudulent transaction? Explain your rationale.

* The CEO of the biggest customer of the firm suspects that someone has used her corporate credit card without authorization in the first quarter of 2018 to pay quite expensive restaurant bills. You are asked to find any anomalous transactions during that period.

  * Using Plotly Express, create a series of six box plots, one for each month, in order to identify how many outliers per month for cardholder ID 25.

  * Do you notice any anomalies? Describe your observations and conclusions.

## Challenge + 5 pts for an honest attempt, +10 pts for correct submission

Another approach to identify fraudulent transactions is to look for outliers in the data. Standard deviation or quartiles are often used to detect outliers.

Read the following articles on outliers detection, and then code a function using Python to identify anomalies for any cardholder.

* [How to Calculate Outliers](https://www.wikihow.com/Calculate-Outliers)

* [Removing Outliers Using Standard Deviation in Python](https://www.kdnuggets.com/2017/02/removing-outliers-standard-deviation-python.html)

* [How to Use Statistics to Identify Outliers in Data](https://machinelearningmastery.com/how-to-use-statistics-to-identify-outliers-in-data/)
