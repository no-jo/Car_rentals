CREATE VIEW customer_rentals AS
SELECT customer.first_name AS 'First name', customer.surname AS 'Last name', rental_transaction.date_from AS 'Rent', 
rental_transaction.date_to AS 'Return', car.brand AS 'Brand' FROM rental_transaction
JOIN customer ON customer.customer_id = rental_transaction.customer_id
JOIN car ON car.car_id = rental_transaction.car_id; 