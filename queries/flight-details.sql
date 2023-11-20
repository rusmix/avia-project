WITH FlightDetails AS (
    SELECT 
        f.Flight_id,
        f.departure_airport,
        f.arrival_airport,
        f.departure_time,
        f.arrival_time,
        pl.Plane_id
    FROM 
        main.Flight f
    JOIN 
        main.Plane pl ON f.Plane_id = pl.Plane_id
),
TicketInfo AS (
    SELECT 
        t.Flight_id,
        COUNT(t.Ticket_id) AS Total_Tickets,
        SUM(t.price) AS Total_Revenue,
        AVG(t.price) AS Average_Ticket_Price
    FROM 
        main.Ticket t
    GROUP BY 
        t.Flight_id
),
EmployeeInfo AS (
    SELECT 
        ef.Flight_id,
        COUNT(ef.Employee_id) AS Total_Crew,
        ARRAY_AGG(ep.name || ' ' || ep.lastname) AS Crew_Names
    FROM 
        main.Employee_Flight ef
    JOIN 
        main.Employee e ON ef.Employee_id = e.Employee_id
    JOIN 
        main.Person ep ON e.Person_id = ep.Person_id
    GROUP BY 
        ef.Flight_id
)
SELECT 
    fd.Flight_id,
    fd.departure_airport,
    fd.arrival_airport,
    fd.departure_time,
    fd.arrival_time,
    fd.Plane_id,
    ti.Total_Tickets,
    ti.Total_Revenue,
    ti.Average_Ticket_Price,
    ei.Total_Crew,
    ei.Crew_Names
FROM 
    FlightDetails fd
LEFT JOIN 
    TicketInfo ti ON fd.Flight_id = ti.Flight_id
LEFT JOIN 
    EmployeeInfo ei ON fd.Flight_id = ei.Flight_id
WHERE 
    fd.Flight_id = :flightId
ORDER BY 
    fd.Flight_id;
