SELECT 
    p.name,
    p.lastname,
    p.date_of_birth,
    c.mail,
    JSON_AGG(
        JSON_BUILD_OBJECT(
            'Ticket_id', t.Ticket_id,
            'Flight_id', f.Flight_id,
            'Departure_Airport', f.departure_airport,
            'Arrival_Airport', f.arrival_airport,
            'Departure_Time', f.departure_time,
            'Arrival_Time', f.arrival_time,
            'Seat', t.seat,
            'Class_of_Service', t.class_of_service,
            'Price', t.price
        )
    ) AS Tickets_and_Flights
FROM 
    main.Person p
JOIN 
    main.Client c ON p.Person_id = c.Person_id
JOIN 
    main.Client_Ticket ct ON c.Client_id = ct.Client_id
JOIN 
    main.Ticket t ON ct.Ticket_id = t.Ticket_id
JOIN 
    main.Flight f ON t.Flight_id = f.Flight_id
WHERE 
    c.mail = :email
GROUP BY 
    p.name, p.lastname, p.date_of_birth, c.mail;
