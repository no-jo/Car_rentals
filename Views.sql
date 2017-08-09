-- zadanie 3 a
CREATE VIEW customer_rentals AS
SELECT customer.first_name AS 'First name', customer.surname AS 'Last name', rental_transaction.date_from AS 'Rent', 
rental_transaction.date_to AS 'Return', car.brand AS 'Brand' FROM rental_transaction
JOIN customer ON customer.customer_id = rental_transaction.customer_id
JOIN car ON car.car_id = rental_transaction.car_id; 

-- zadanie 3 b 1
CREATE VIEW distinct_cars_of_customer AS
SELECT DISTINCT customer_id, car_id FROM rental_transaction;

	-- pkt 4 h po stworzeniu view
	SELECT customer_id, COUNT(car_id) AS no_different_cars FROM distinct_cars_of_customer
	GROUP BY customer_id
	ORDER BY no_different_cars DESC LIMIT 3;

-- zadanie 3 b 2
CREATE VIEW year_customer_payment AS
SELECT customer.first_name, customer.surname, SUM(amount_in_PLN) as Amount FROM rental_transaction
JOIN customer ON customer.customer_id = rental_transaction.customer_id
WHERE year(rental_transaction.date_to) = year(now())
GROUP BY rental_transaction.customer_id;

	-- zadanie 4 j po stworzeniu view
	SELECT * FROM year_customer_payment
	ORDER BY Amount DESC LIMIT 3;