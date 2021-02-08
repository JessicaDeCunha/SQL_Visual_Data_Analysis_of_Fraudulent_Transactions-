-- How can you isolate (or group) the transactions of each card holder?
SELECT ch.name, cc.card, t.date, t.amount, m.name AS merchant,
        mc.name AS category
FROM transaction AS t
JOIN credit_card AS cc ON cc.card = t.card
JOIN card_holder AS ch ON ch.id = cc.id_card_holder
JOIN merchant AS m ON m.id = t.id_merchant
JOIN merchant_category AS mc ON mc.id = m.id_merchant_category
ORDER BY ch.name;

-- Normally one takes breakfast between 7am and 9am,
-- What are to top 100 higher transactions between this time period?
SELECT *
FROM transaction AS t
WHERE date_part('hour', t.date) >= 7 AND date_part('hour', t.date) <= 9
ORDER BY amount DESC
LIMIT 100;

-- count the transactions that are less than $2.00 per card holder,
-- is there some evidence to state that some credit card has been hacked?
SELECT COUNT(t.amount) AS "Transactions less that $2.00"
FROM transaction AS t
WHERE t.amount < 2;

SELECT *
FROM transaction AS t
WHERE t.amount < 2
ORDER BY t.card, t.amount DESC;

-- What are the top 5 merchant categories that are more prone to be hacked
-- using small transactions?
SELECT m.name AS merchant, mc.name AS category,
        COUNT(t.amount) AS micro_transactions
FROM transaction AS t
JOIN merchant AS m ON m.id = t.id_merchant
JOIN merchant_category AS mc ON mc.id = m.id_merchant_category
WHERE t.amount < 2
GROUP BY m.name, mc.name
ORDER BY micro_transactions DESC
LIMIT 5;

-- VIEWS
CREATE VIEW transactions_per_card_holder AS
  SELECT ch.name, cc.card, t.date, t.amount, m.name AS merchant,
          mc.name AS category
  FROM transaction AS t
  JOIN credit_card AS cc ON cc.card = t.card
  JOIN card_holder AS ch ON ch.id = cc.id_card_holder
  JOIN merchant AS m ON m.id = t.id_merchant
  JOIN merchant_category AS mc ON mc.id = m.id_merchant_category
  ORDER BY ch.name;

CREATE VIEW morning_higher_transactions AS
  SELECT *
  FROM transaction AS t
  WHERE date_part('hour', t.date) >= 7 AND date_part('hour', t.date) <= 9
  ORDER BY amount DESC
  LIMIT 100;

CREATE VIEW micro_transactions AS
  SELECT *
  FROM transaction AS t
  WHERE t.amount < 2
  ORDER BY t.card, t.amount DESC;

CREATE VIEW count_micro_transactions AS
  SELECT COUNT(t.amount) AS "Transactions less that $2.00"
  FROM transaction AS t
  WHERE t.amount < 2;

CREATE VIEW top_hacked_merchants_micro_transactions AS
  SELECT m.name AS merchant, mc.name AS category,
          COUNT(t.amount) AS micro_transactions
  FROM transaction AS t
  JOIN merchant AS m ON m.id = t.id_merchant
  JOIN merchant_category AS mc ON mc.id = m.id_merchant_category
  WHERE t.amount < 2
  GROUP BY m.name, mc.name
  ORDER BY micro_transactions DESC
  LIMIT 5;
