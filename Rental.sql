-- Q1
use rental_db;
INSERT INTO rental_records VALUES
   (NULL,
    'SBA1111A', 
    (SELECT customer_id FROM customers WHERE name='Angel'),
    CURDATE(),
    DATE_ADD(CURDATE(), INTERVAL 10 DAY),
    NULL);
-- Q2
INSERT INTO rental_records VALUES
   (NULL,
    'GA5555E', 
    (SELECT customer_id FROM customers WHERE name='Kumar'),
    DATE_ADD(CURDATE(), INTERVAL 1 DAY),
    DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 1 DAY), INTERVAL 3 MONTH),
    NULL);
-- Q3
SELECT rr.start_date,rr.end_date, v.veh_reg_no,v.brand,c.name
FROM rental_records as rr
INNER JOIN Vehicles as v ON rr.veh_reg_no = v.veh_reg_no
INNER JOIN Customers as c ON rr.customer_id = c.customer_id
ORDER BY v.category, rr.start_date; 
-- Q4
SELECT * FROM rental_records WHERE end_date < curdate();
-- Q5
SELECT 
rr.veh_reg_no,
c.name,
rr.start_date, 
rr.end_date 
FROM rental_records as rr 
INNER JOIN Vehicles as v ON rr.veh_reg_no = v.veh_reg_no
INNER JOIN Customers as c ON rr.customer_id = c.customer_id
WHERE ('2012-01-10' BETWEEN rr.start_date and rr.end_date); 
-- Q6
SELECT 
rr.veh_reg_no,
c.name,
rr.start_date,
rr.end_date
FROM rental_records as rr
INNER JOIN Vehicles as v ON rr.veh_reg_no = v.veh_reg_no
INNER JOIN Customers as c ON rr.customer_id = c.customer_id
WHERE (CURDATE() BETWEEN rr.start_date AND rr.End_date);
-- Q7
-- Q8
SELECT 
rr.veh_reg_no,
v.brand,
v.`desc`
FROM rental_records AS rr
INNER JOIN Vehicles as v ON rr.veh_reg_no = v.veh_reg_no
WHERE NOT ('2012-01-10' BETWEEN rr.start_date AND rr.end_date); 
-- Q9
-- Q10
