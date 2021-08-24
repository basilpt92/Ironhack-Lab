-- Query1
select client_id
from client
where district_id = 1
limit 5;

-- Query2
select client_id 
from client
where district_id = 72
order by client_id desc
limit 1;

-- Query3
select amount from loan
order by amount DESC
limit 3;

-- Query4
select distinct(status) from loan
order by status;

-- Query5
SELECT loan_id 
FROM loan 
ORDER BY payments DESC 
LIMIT 1;

-- Query6
select account_id,amount from loan
order by account_id
limit 5;

-- Query7
SELECT account_id FROM loan 
WHERE duration = 60 
ORDER BY amount ASC LIMIT 5;

-- Query8
select distinct k_symbol from `order`;

-- Query9
select order_id from `order`
where account_id = 34;

-- Query10
select distinct account_id from `order`
where order_id > 29540 and order_id <= 29560;

-- Query11
select amount from `order`
where account_to = 30067122;

-- Query12
select trans_id, date, type, amount from trans
where account_id = 793
order by date DESC
limit 10;

-- Query13
SELECT district_id, count(distinct client_id) FROM client WHERE district_id < 10 
GROUP BY district_id 
ORDER BY district_id;

-- Query14
SELECT distinct type, count(card_id) AS occurence FROM card 
GROUP BY type 
ORDER BY occurence DESC;

-- Query15
SELECT distinct account_id, sum(amount) AS loan_amount FROM loan 
GROUP BY account_id 
ORDER BY loan_amount DESC 
LIMIT 10;

-- Query16
SELECT date, count(loan_id) FROM loan 
WHERE date < 930907 
GROUP BY date 
ORDER BY date DESC 
LIMIT 5;

-- Query17
SELECT date, duration, count(distinct loan_id) FROM loan 
WHERE date LIKE "9712%" 
GROUP BY date, duration
ORDER BY date;

-- Query18
SELECT account_id, type, sum(amount) as total_amount FROM trans 
WHERE account_id = 396 
GROUP BY type 
ORDER BY type;

-- Query19
SELECT account_id, if(type="PRIJEM", "INCOMING", "OUTGOING") as transaction_type, floor(sum(amount)) as total_amount FROM trans 
WHERE account_id = 396 
GROUP BY type 
ORDER BY type;

-- Query20
SELECT account_id,sum(case when transaction_type = "INCOMING" THEN total_amount END) as incoming,sum(case when transaction_type = "OUTGOING" THEN total_amount END) as outgoing,
(sum(case when transaction_type = "INCOMING" THEN total_amount END) - sum(case when transaction_type = "OUTGOING" THEN total_amount END)) as balance
FROM (SELECT account_id, if(type="PRIJEM", "INCOMING", "OUTGOING") as transaction_type, floor(sum(amount)) as total_amount FROM trans WHERE account_id = 396 GROUP BY type ORDER BY type) as table_b
GROUP BY account_id;