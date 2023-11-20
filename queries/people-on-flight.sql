WITH CrewDetails AS (
    SELECT 
        ef.Flight_id,
        e.Employee_id,
        CONCAT(p.name, ' ', p.lastname) AS Employee_Name,
        'Employee' AS Role
    FROM 
        main.Employee_Flight ef
    JOIN 
        main.Employee e ON ef.Employee_id = e.Employee_id
    JOIN 
        main.Person p ON e.Person_id = p.Person_id
),
PassengerDetails AS (
    SELECT 
        ct.Flight_id,
        c.Client_id,
        CONCAT(p.name, ' ', p.lastname) AS Passenger_Name,
        'Passenger' AS Role
    FROM 
        main.Client_Ticket ct
    JOIN 
        main.Ticket t ON ct.Ticket_id = t.Ticket_id
    JOIN 
        main.Client c ON ct.Client_id = c.Client_id
    JOIN 
        main.Person p ON c.Person_id = p.Person_id
)
SELECT 
    Flight_id,
    COALESCE(Employee_id, Client_id) AS Person_id,
    COALESCE(Employee_Name, Passenger_Name) AS Name,
    Role
FROM 
    CrewDetails
WHERE 
    Flight_id = [Your Flight ID]
UNION ALL
SELECT 
    Flight_id,
    COALESCE(Employee_id, Client_id) AS Person_id,
    COALESCE(Employee_Name, Passenger_Name) AS Name,
    Role
FROM 
    PassengerDetails
WHERE 
    Flight_id = :flight_id
ORDER BY 
    Role, Name;
