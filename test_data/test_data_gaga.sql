INSERT INTO main.Pilot (pilot_num, catagory, Person_id) VALUES
(101, 'Commercial', 1),
(102, 'Private', 2);

INSERT INTO main.Client (mail, Person_id) VALUES
('john.doe@email.com', 1),
('jane.smith@email.com', 2);

INSERT INTO main.Employee (employee_num, department, Person_id) VALUES
(201, 'Maintenance', 3),
(202, 'Ground Staff', 1);

INSERT INTO main.Plane (mode, manufacturer, plane_number) VALUES
('Boeing 737', 'Boeing', 3001),
('Airbus A320', 'Airbus', 3002);

INSERT INTO main.Pilot_Plane (Pilot_id, Plane_id) VALUES
(1, 1),
(2, 2);

INSERT INTO main.Flight (arrival_time, departure_time, arrival_airport, departure_airport, flight_number, Plane_id) VALUES
('2023-12-01 12:00:00', '2023-12-01 08:00:00', 'JFK', 'LAX', 'AA101', 1),
('2023-12-02 18:30:00', '2023-12-02 14:00:00', 'LAX', 'JFK', 'AA102', 2);

INSERT INTO main.Ticket (boarding_gate, check_in_time, seat, boarding_time, price, class_of_service, Flight_id) VALUES
('A1', '2023-12-01 06:30:00', '12A', '2023-12-01 07:30:00', 299.99, 'Economy', 1),
('B2', '2023-12-02 12:30:00', '1B', '2023-12-02 13:30:00', 499.99, 'First Class', 2);

INSERT INTO main.Employee_Flight (Employee_id, Flight_id) VALUES
(1, 1),
(2, 2);

INSERT INTO main.Client_Ticket (Client_id, Ticket_id) VALUES
(1, 1),
(2, 2);
