CREATE TABLE IF NOT EXISTS bus(bus_plate_number VARCHAR(20) NOT NULL, bus_number varchar(20) NOT NULL,  bus_type int, capacity int NOT NULL, PRIMARY KEY(bus_plate_number));


CREATE TABLE IF NOT EXISTS bus_platenumber( bus_id SERIAL PRIMARY KEY NOT NULL, bus_plate_number VARCHAR(20) NOT NULL); 

ALTER TABLE bus_platenumber 
	ADD CONSTRAINT bus_ibfk_5 FOREIGN KEY (bus_plate_number) references bus(bus_plate_number) ON DELETE CASCADE ON UPDATE CASCADE;


CREATE TABLE IF NOT EXISTS driver(driver_id SERIAL PRIMARY KEY NOT NULL, 
		driver_FirstName varchar(20) NOT NULL, 
		driver_LastName varchar(20) NOT NULL, 
		driver_contact VARCHAR(20) NOT NULL, 
		Grade int NOT NULL);

CREATE TABLE IF NOT EXISTS Salary(Grade int NOT NULL, 
						Salary int NOT NULL);


ALTER TABLE driver 
	ADD CONSTRAINT driver_ibfk_5 FOREIGN KEY (Grade) references Salary(Grade) ON DELETE CASCADE ON UPDATE CASCADE;



CREATE TABLE customer(Customer_id  SERIAL PRIMARY KEY, 
					  Customer_FirstName varchar(20),
					  Customer_LastName varchar(20),
					  customer_contact VARCHAR(20) NOT NULL, 
					  customer_email VARCHAR(20) NOT NULL,
					  account_status int NOT NULL);

CREATE TABLE ROUTE (ROUTE_ID SERIAL PRIMARY KEY NOT NULL,
				   Departure_City VARCHAR(20),
				   Arrival_City VARCHAR(20),
				   Distance int,
				   Duration time)



CREATE TABLE travelschedule (schedule_id SERIAL PRIMARY KEY NOT NULL, Bus_id int NOT NULL, Route_id int NOT NULL, schedule_date date NOT NULL, departure_time time NOT NULL, estimated_arrival_time time NOT NULL);

CREATE TABLE booking(booking_id SERIAL PRIMARY KEY NOT NULL , 
					schedule_id int NOT NULL, 
					customer_id int NOT NULL,
					number_of_seats int NOT NULL,
					fare_amount int NOT NULL,
					total_amount int NOT NULL,
					date_of_booking date NOT NULL,
					booking_status int);


CREATE TABLE payment(payment_id SERIAL PRIMARY KEY NOT NULL , 
				  booking_id int NOT NULL,
				  amount_paid int NOT NULL, 
				  payment_date date NOT NULL);


ALTER TABLE bus_platenumber 
	ADD CONSTRAINT bus_ibfk_5 FOREIGN KEY (bus_plate_number) references bus(bus_plate_number) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE driver 
	ADD CONSTRAINT driver_ibfk_5 FOREIGN KEY (Grade) references Salary(Grade) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Travelschedule
	ADD CONSTRAINT Travelschedule_ibfk_2 FOREIGN KEY (bus_id) REFERENCES bus_platenumber(bus_id) ON DELETE CASCADE ON UPDATE CASCADE,
	ADD CONSTRAINT Travelschedule_ibfk_3 FOREIGN KEY (Route_id) REFERENCES Route(Route_id) ON DELETE CASCADE ON UPDATE CASCADE,
	---ADD CONSTRAINT Travelschedule_ibfk_4 FOREIGN KEY (driver_id) REFERENCES driver(driver_id) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE booking
	ADD CONSTRAINT booking_ibfk_3 FOREIGN KEY (schedule_id) REFERENCES travelschedule(schedule_id) ON DELETE CASCADE ON UPDATE CASCADE,
	ADD CONSTRAINT booking_ibfk_2 FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE payment
	ADD CONSTRAINT payment_ibfk_2 FOREIGN KEY (booking_id) REFERENCES booking(booking_id) ON DELETE CASCADE ON UPDATE CASCADE;





