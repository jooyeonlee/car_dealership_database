-- function for adding a car to car database
CREATE OR REPLACE FUNCTION add_car (
	car_serial_num INTEGER, makename VARCHAR, modelname VARCHAR, colorname VARCHAR, year_make INTEGER, neworold BOOLEAN 
)
RETURNS void
AS $$
BEGIN
	INSERT INTO car(car_serial, make, model, color, year, new)
	VALUES (car_serial_num, makename, modelname, colorname, year_make, neworold);
END;
$$ 
LANGUAGE plpgsql;

SELECT add_car(12345, 'BMW', 'X3', 'silver', 2000, false);
SELECT add_car(12346, 'Ford', 'Explorer', 'black', 2021, true);

-- function for adding a sales person to salesperson database
CREATE OR REPLACE FUNCTION add_salesperson (
	firstName VARCHAR, lastName VARCHAR 
)
RETURNS void
AS $$
BEGIN
	INSERT INTO salesperson(first_name, last_name)
	VALUES (firstName, lastName);
END;
$$ 
LANGUAGE plpgsql;

SELECT add_salesperson('Amy', 'Winehouse');
SELECT add_salesperson('Tommy', 'Jones');

-- function for adding a new customer to customer database
CREATE OR REPLACE FUNCTION add_customer (
	firstName VARCHAR, lastName VARCHAR, contactInfo VARCHAR, addressInfo VARCHAR
)
RETURNS void
AS $$
BEGIN
	INSERT INTO customer(first_name, last_name, contact, address)
	VALUES (firstName, lastName, contactInfo, addressInfo);
END;
$$ 
LANGUAGE plpgsql;

SELECT add_customer('Jake', 'Austin', '2283339999', '10 ABC Ln Chicago IL');
SELECT add_customer('Veronica', 'Mars', '2246679699', '17 Melon Ave Chicago IL');

-- function for adding a mechanic to mechanic database
CREATE OR REPLACE FUNCTION add_mechanic (
	firstName VARCHAR, lastName VARCHAR
)
RETURNS void
AS $$
BEGIN
	INSERT INTO mechanic(first_name, last_name)
	VALUES (firstName, lastName);
END;
$$ 
LANGUAGE plpgsql;

SELECT add_mechanic('Ken', 'Wilson');
SELECT add_mechanic('Joe', 'Cotton');

-- function for adding a part to part database
CREATE OR REPLACE FUNCTION add_part (
	partName VARCHAR, priceTag NUMERIC
)
RETURNS void
AS $$
BEGIN
	INSERT INTO part(part_name, price)
	VALUES (partName, priceTag);
END;
$$ 
LANGUAGE plpgsql;

SELECT add_part('bumper', 329.99);
SELECT add_part('fenders', 163.99);
SELECT add_part('headlight', 149.99);

-- function for adding a invoice to invoice database
CREATE OR REPLACE FUNCTION new_invoice (
	car_serial_num INTEGER, salespersonId INTEGER, customerId INTEGER
)
RETURNS void
AS $$
BEGIN
	INSERT INTO invoice(car_serial, salesperson_id, customer_id)
	VALUES (car_serial_num, salespersonId, customerId);
END;
$$ 
LANGUAGE plpgsql;

SELECT new_invoice(12345, 1, 1);
SELECT new_invoice(12346, 1, 2);

-- function for adding a service ticket to serviceticket database
CREATE OR REPLACE FUNCTION new_service_ticket (
	car_serial_num INTEGER, customerId INTEGER, received_date TIMESTAMP, closed_date TIMESTAMP
)
RETURNS void
AS $$
BEGIN
	INSERT INTO serviceticket(car_serial, customer_id, receivedate, closedate)
	VALUES (car_serial_num, customerId, received_date, closed_date);
END;
$$ 
LANGUAGE plpgsql;

SELECT new_service_ticket(12345, 1, '2021-08-31 19:10:25', '2021-09-12 11:20:30');
SELECT new_service_ticket(12346, 2, '2021-09-10 15:00:21', '2021-09-20 12:30:31');

-- function for adding a mechanic service information to mechanic_in_service database
CREATE OR REPLACE FUNCTION add_mechanic_service (
	mechanicId INTEGER, ticketId INTEGER, servicehour INTEGER, servicerate NUMERIC
)
RETURNS void
AS $$
BEGIN
	INSERT INTO mechanic_in_service(mechanic_id, ticket_id, hours, rate)
	VALUES (mechanicId, ticketId, servicehour, servicerate);
END;
$$ 
LANGUAGE plpgsql;

SELECT add_mechanic_service(1, 1, 3, 99.99);
SELECT add_mechanic_service(2, 3, 5, 130.99);
SELECT add_mechanic_service(2, 1, 2, 65.99);

-- function for adding a part used in service information to usedpart database
CREATE OR REPLACE FUNCTION add_part_used (
	partId INTEGER, ticketId INTEGER, numofpart INTEGER, totalprice NUMERIC
)
RETURNS void
AS $$
BEGIN
	INSERT INTO usedpart(part_id, ticket_id, number, price)
	VALUES (partId, ticketId, numofpart, totalprice);
END;
$$ 
LANGUAGE plpgsql;

SELECT add_part_used(1, 1, 1, 329.99);
SELECT add_part_used(2, 1, 1, 163.99);
SELECT add_part_used(3, 3, 2, 299.98);

SELECT add_car(32409, 'Volvo', 'XC40', 'white', 2021, true);
SELECT add_salesperson('Carol', 'Burnett');
SELECT add_customer('Edward', 'Cullen', '2243901111', '1 West Ct Chicago IL');
SELECT add_mechanic('Justin', 'Fields');
SELECT add_part('brake pad', 47.58);
SELECT new_invoice(32409, 3, 3);
SELECT new_service_ticket(32409, 3, '2021-10-02 10:00:15', '2021-10-12 12:20:20');
SELECT add_mechanic_service(3, 4, 2, 65.99);
SELECT add_part_used(4, 4, 1, 47.58);
