CREATE TABLE  main.Person (
    Person_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    patronymic VARCHAR(255),
    passport_series VARCHAR(255),
    passport_number VARCHAR(255),
    phone_number VARCHAR(255),
    date_of_birth DATE
);

CREATE TABLE main.Pilot (
    Pilot_id SERIAL PRIMARY KEY,
    pilot_num INT NOT NULL,
    catagory VARCHAR(255) NOT NULL,
    Person_id INT REFERENCES main.Person(Person_id)
);


CREATE TABLE main.Client (
    Client_id SERIAL PRIMARY KEY,
    mail VARCHAR(255) NOT NULL,
    Person_id INT REFERENCES main.Person(Person_id)
);

CREATE TABLE main.Employee (
    Employee_id SERIAL PRIMARY KEY,
    employee_num INT NOT NULL,
    department VARCHAR(255) NOT NULL,
    Person_id INT REFERENCES main.Person(Person_id)
);

CREATE TABLE main.Plane (
    Plane_id SERIAL PRIMARY KEY,
    mode VARCHAR(255) NOT NULL,
    manufacturer VARCHAR(255) NOT NULL,
    plane_number INT NOT NULL
);

CREATE TABLE main.Pilot_Plane (
    Pilot_id INT REFERENCES main.Pilot(Pilot_id),
    Plane_id INT REFERENCES main.Plane(Plane_id),
    PRIMARY KEY (Pilot_id, Plane_id)
);

CREATE TABLE main.Flight (
    Flight_id SERIAL PRIMARY KEY,
    arrival_time TIMESTAMP NOT NULL,
    departure_time TIMESTAMP NOT NULL,
    arrival_airport VARCHAR(255) NOT NULL,
    departure_airport VARCHAR(255) NOT NULL,
    flight_number VARCHAR(255) NOT NULL,
    Plane_id INT REFERENCES main.Plane(Plane_id)
);

CREATE TABLE main.Ticket (
    Ticket_id SERIAL PRIMARY KEY,
    boarding_gate VARCHAR(255),
    check_in_time TIMESTAMP,
    seat VARCHAR(50),
    boarding_time TIMESTAMP,
    price DECIMAL(10, 2),
    class_of_service VARCHAR(255),
    Flight_id INT REFERENCES main.Flight(Flight_id)
);

CREATE TABLE main.Employee_Flight (
    Employee_Flight_id SERIAL PRIMARY KEY,
    Employee_id INT REFERENCES main.Employee(Employee_id),
    Flight_id INT REFERENCES main.Flight(Flight_id)
);

CREATE TABLE main.Client_Ticket (
    Client_Ticket_id SERIAL PRIMARY KEY,
    Client_id INT REFERENCES main.Client(Client_id),
    Ticket_id INT REFERENCES main.Ticket(Ticket_id)
);