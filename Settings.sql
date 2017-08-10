USE car_rental_company;

-- zadanie 5

CREATE USER 'user_ra'@'localhost' IDENTIFIED BY '1234';

CREATE USER 'user_ro'@'localhost' IDENTIFIED BY '1234';

CREATE USER 'user_rw_projekt'@'localhost' IDENTIFIED BY '1234';

-- 5 a
GRANT SELECT ON car_rental_company.* TO 'user_ro'@'localhost';

-- 5 b odpowiednik GRANT Select,Insert,Update,Delete ON car_rental_compay.car TO 'user_rw_projekt'@'localhost';
GRANT ALL ON car_rental_compay.car TO 'user_rw_projekt'@'localhost';

REVOKE Create,Drop,References,Index,Alter,Create View,Show view,Trigger
 ON car_rental_compay.car FROM 'user_rw_projekt'@'localhost';

FLUSH PRIVILEGES;

-- zadanie 6

CREATE INDEX full_name ON customer (first_name, surname);

CREATE INDEX prod_year ON car (production_year);

-- zadanie 7

CREATE TRIGGER min_amount BEFORE INSERT ON rental_transaction
       FOR EACH ROW 
       SET NEW.amount_in_PLN = IF(NEW.amount_in_PLN < 100, 100, NEW.amount_in_PLN);
