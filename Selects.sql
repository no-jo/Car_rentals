-- zadanie 4 a (zmiana za 25 na 30)
SELECT * FROM employee
WHERE datediff(now(), employee.date_of_birth)/365 > 30;

-- zadanie 4 b
SELECT * FROM employee
WHERE length(surname) > 7;

-- zadanie 4 c (zmiana z litery f na e)
SELECT * FROM employee
WHERE surname like '_e%';

-- zadanie 4 d
SELECT * FROM car
ORDER BY km_travelled DESC
LIMIT 5;

-- zadanie 4 e
SELECT COUNT(*) FROM car
WHERE km_travelled < 300000 AND km_travelled > 200000;

-- zadanie 4 f
SELECT * FROM employee
WHERE work_position = 'manager';

-- zadanie 4 g
SELECT customer.first_name, customer.surname, COUNT(*) AS Rentals 
FROM rental_transaction
JOIN customer ON rental_transaction.customer_id = customer.customer_id
GROUP BY rental_transaction.customer_id
ORDER BY Rentals DESC LIMIT 5;

-- zadanie 4 h
SELECT distinct_cars.customer_id, COUNT(distinct_cars.car_id) AS no_different_cars FROM (
	(SELECT DISTINCT customer_id, car_id FROM rental_transaction) AS distinct_cars)
GROUP BY customer_id
ORDER BY no_different_cars DESC LIMIT 3;

-- zadanie 4 i
SELECT rental_transaction.car_id, COUNT(rental_transaction.rental_id) AS Rented 
FROM rental_transaction
JOIN car ON rental_transaction.car_id = car.car_id
GROUP BY rental_transaction.car_id
ORDER BY Rented DESC LIMIT 5;

-- zadanie 4 j
SELECT customer.first_name, customer.surname, SUM(amount_in_PLN) as Amount FROM rental_transaction
JOIN customer ON customer.customer_id = rental_transaction.customer_id
WHERE year(rental_transaction.date_to) = 2017
GROUP BY rental_transaction.customer_id
ORDER BY Amount DESC LIMIT 3;

-- zadanie 4 k
SELECT customer.first_name, customer.surname as Amount FROM rental_transaction
JOIN customer ON customer.customer_id = rental_transaction.customer_id
WHERE rental_transaction.date_from > '2017-02-20' AND rental_transaction.date_from < now()
AND rental_transaction.car_id IN (
	SELECT car_id FROM car
    WHERE brand = 'Bentley' AND production_year = '2009' AND color = 'Aquamarine'
    );

-- zadanie 4 l
UPDATE car
SET color = 'Crimson'
WHERE car_id = 2;

-- zadanie 4 m (co jezeli kilku remisuje ?)
SELECT customer_id, COUNT(rental_id) as Count FROM rental_transaction
WHERE rental_transaction.branch_from <> rental_transaction.branch_to
GROUP BY customer_id
ORDER BY Count DESC LIMIT 1;

-- zadanie 4 o
SELECT substring(customer.email FROM locate('@',customer.email) + 1) AS domain, COUNT(customer_id) FROM customer
GROUP BY domain
ORDER BY domain DESC LIMIT 1;

-- zadanie 4 p
SELECT car_id, COUNT(relation_id) AS Guardians FROM car2employee
WHERE valid_until IS NULL
GROUP BY car_id
HAVING Guardians >= 2;

-- zadanie 4 r
SELECT * FROM employee 
WHERE employee_id NOT IN (
	SELECT DISTINCT employee_id FROM car2employee );







