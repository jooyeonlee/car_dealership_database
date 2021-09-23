CREATE TABLE salesperson (
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);

CREATE TABLE car (
  car_serial INTEGER PRIMARY KEY,
  make VARCHAR(20),
  model VARCHAR(20),
  color VARCHAR(20),
  year INTEGER,
  new BOOLEAN
);

CREATE TABLE customer (
  customer_id SERIAL PRIMARY KEY,
  last_name VARCHAR(50),
  first_name VARCHAR(50),
  contact VARCHAR(20),
  address VARCHAR(150)
);

CREATE TABLE invoice (
	invoice_id SERIAL PRIMARY KEY,
	car_serial INTEGER NOT NULL,
	salesperson_id INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(car_serial) REFERENCES car(car_serial),
 	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE serviceticket (
	ticket_id SERIAL PRIMARY KEY,
	car_serial INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	receivedate TIMESTAMP,
	closedate TIMESTAMP,
	FOREIGN KEY(car_serial) REFERENCES car(car_serial),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE part (
	part_id SERIAL PRIMARY KEY,
	part_name VARCHAR(20),
	price NUMERIC(6,2)
);

CREATE TABLE usedpart (
	usedpart_id SERIAL PRIMARY KEY,
  	part_id INTEGER NOT NULL,
  	ticket_id INTEGER NOT NULL,
  	number INTEGER,
  	price NUMERIC(7,2),
	FOREIGN KEY(part_id) REFERENCES part(part_id),
	FOREIGN KEY(ticket_id) REFERENCES serviceticket(ticket_id)
);

CREATE TABLE mechanic (
  mechanic_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
);

CREATE TABLE mechanic_in_service (
  	servmechanic_id SERIAL PRIMARY KEY,
  	mechanic_id INTEGER NOT NULL,
  	ticket_id INTEGER NOT NULL,
  	hours INTEGER,
  	rate NUMERIC(5,2),
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
	FOREIGN KEY(ticket_id) REFERENCES serviceticket(ticket_id)  
);


