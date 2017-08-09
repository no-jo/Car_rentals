CREATE DATABASE car_rental_company;

USE car_rental_company;

CREATE TABLE address (
    address_id int NOT NULL AUTO_INCREMENT,
    street varchar(200) NOT NULL,
    city varchar(50) NOT NULL,
    postcode varchar(10) NOT NULL,
    country varchar(50) NOT NULL,
    PRIMARY KEY (address_id)
);

CREATE TABLE customer (
	customer_id int NOT NULL AUTO_INCREMENT,
    first_name varchar(100) NOT NULL,
    surname varchar(100) NOT NULL,
    address_id int NOT NULL,
    phone varchar(12) NOT NULL,
    email varchar(50) NOT NULL,
    date_of_birth DATE,
    credit_card_no varchar(16),
    PRIMARY KEY (customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);

CREATE TABLE branch (
	branch_id int NOT NULL AUTO_INCREMENT,
    address_id int NOT NULL,
    phone varchar(12) NOT NULL,
    email varchar(50),
    PRIMARY KEY (branch_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);
    
CREATE TABLE employee (
	employee_id int NOT NULL AUTO_INCREMENT,
    branch_id int NOT NULL,
    work_position varchar(100) NOT NULL,
    first_name varchar(100) NOT NULL,
    surname varchar(100) NOT NULL,
    address_id int NOT NULL,
    date_of_birth DATE NOT NULL,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);

CREATE TABLE car (
	car_id int NOT NULL AUTO_INCREMENT,
    kind varchar(20) NOT NULL,
    brand varchar(30) NOT NULL,
    production_year int NOT NULL,
    horse_power int NOT NULL,
    color varchar(50),
    engine_displacement float NOT NULL,
    km_travelled long NOT NULL,
    PRIMARY KEY (car_id)
);

CREATE TABLE car2employee (
	relation_id int NOT NULL AUTO_INCREMENT,
    employee_id int NOT NULL,
    car_id int NOT NULL,
    valid_from DATE NOT NULL,
    valid_until DATE NOT NULL,
    PRIMARY KEY (relation_id),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    FOREIGN KEY (car_id) REFERENCES car(car_id)
);

CREATE TABLE rental_transaction (
	rental_id int NOT NULL AUTO_INCREMENT,
    customer_id int NOT NULL,
    employee_id int NOT NULL,
    car_id int NOT NULL,
    date_from date NOT NULL,
    date_to date NOT NULL,
    amount_in_PLN long NOT NULL,
    branch_from int NOT NULL,
    branch_to int NOT NULL,
    creation_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (rental_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    FOREIGN KEY (branch_from) REFERENCES branch(branch_id),
    FOREIGN KEY (branch_to) REFERENCES branch(branch_id)
);
