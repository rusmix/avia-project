SELECT 
    c.Person_id,
    t.Ticket_id,
    t.boarding_gate,
    t.check_in_time,
    t.seat,
    t.boarding_time,
    t.price,
    t.class_of_service,
    JSON_BUILD_OBJECT(
        'Flight_id', f.Flight_id,
        'Departure_Airport', f.departure_airport,
        'Arrival_Airport', f.arrival_airport,
        'Departure_Time', f.departure_time,
        'Arrival_Time', f.arrival_time
    ) AS Flight_Info
FROM 
    main.Client c
JOIN 
    main.Client_Ticket ct ON c.Client_id = ct.Client_id
JOIN 
    main.Ticket t ON ct.Ticket_id = t.Ticket_id
JOIN 
    main.Flight f ON t.Flight_id = f.Flight_id
WHERE 
    c.Person_id = :personId
