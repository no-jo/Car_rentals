USE car_rental_company;

-- zadanie 5

CREATE USER 'user_ra'@'localhost' IDENTIFIED BY '1234';

CREATE USER 'user_ro'@'localhost' IDENTIFIED BY '1234';

CREATE USER 'user_rw_projekt'@'localhost' IDENTIFIED BY '1234';

-- 5 a
GRANT SELECT ON car_rental_company.* TO 'user_ro'@'localhost';

-- 5 b odpowiednik GRANT SELECT, INSERT, UPDATE, DELETE ON car_rental_compay.car TO 'user_rw_projekt'@'localhost';
GRANT ALL ON car_rental_compay.car TO 'user_rw_projekt'@'localhost';

REVOKE CREATE, DROP, REFERENCES, INDEX, ALTER, CREATE VIEW, SHOW VIEW, TRIGGER 
 ON car_rental_compay.car FROM 'user_rw_projekt'@'localhost';

FLUSH PRIVILEGES;

-- zadanie 6

CREATE INDEX full_name ON customer (first_name, surname);
 -- these two are often used to search for the user, e.g. every time customers walks in or phones employee has to find his "profile"

CREATE INDEX creation_date ON rental_transaction (creation_date);
 -- transactions are often searched  by production date for tax reporting

CREATE INDEX user_rentals ON rental_transaction (car_id, customer_id);
 -- these are the two most searched fields, putting them in one index eliminates the need to access the rest of the tablen

-- zadanie 7

CREATE TRIGGER min_amount BEFORE INSERT ON rental_transaction
       FOR EACH ROW 
       SET NEW.amount_in_PLN = IF(NEW.amount_in_PLN < 100, 100, NEW.amount_in_PLN);
