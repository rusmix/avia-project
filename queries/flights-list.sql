SELECT 
    f.Flight_id,
    f.departure_airport,
    f.arrival_airport,
    f.departure_time,
    f.arrival_time,
    JSON_BUILD_OBJECT(
        'Pilot_id', p.Pilot_id,
        'Name', per.name,
        'Lastname', per.lastname
    ) AS Pilot_Info,
    JSON_AGG(
        JSON_BUILD_OBJECT(
            'Employee_id', e.Employee_id,
            'Name', eper.name,
            'Lastname', eper.lastname,
            'Department', e.department
        )
    ) AS Crew_Info
FROM 
    main.Flight f
JOIN 
    main.Plane pl ON f.Plane_id = pl.Plane_id
JOIN 
    main.Pilot_Plane pp ON pl.Plane_id = pp.Plane_id
JOIN 
    main.Pilot p ON pp.Pilot_id = p.Pilot_id
JOIN 
    main.Person per ON p.Person_id = per.Person_id
JOIN 
    main.Employee_Flight ef ON f.Flight_id = ef.Flight_id
JOIN 
    main.Employee e ON ef.Employee_id = e.Employee_id
JOIN 
    main.Person eper ON e.Person_id = eper.Person_id
WHERE 
    f.departure_time >= :beginPeriod
    AND f.departure_time <= :endPeriod
    f.Flight_id, p.Pilot_id, per.name, per.lastname
ORDER BY 
    f.Flight_id;
