-- zadanie 4 a
SELECT * FROM employee
WHERE datediff(now(), employee.date_of_birth)/365 > 30;

-- zadanie 4 b
SELECT * FROM employee
WHERE length(surname) > 7;

-- zadanie 4 c
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
SELECT customer.first_name, customer.surname, COUNT(*) AS Rentals FROM rental_transaction
JOIN customer ON rental_transaction.customer_id = customer.customer_id
GROUP BY rental_transaction.customer_id
ORDER BY Rentals DESC LIMIT 5;