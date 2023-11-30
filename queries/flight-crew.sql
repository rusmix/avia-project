SELECT
    f.Flight_id,
    e.Employee_id,
    emp.name AS Employee_Name,
    emp.lastname AS Employee_Lastname,
    e.department
FROM
    main.Flight f
LEFT JOIN
    main.Employee_Flight ef ON f.Flight_id = ef.Flight_id
LEFT JOIN
    main.Employee e ON ef.Employee_id = e.Employee_id
LEFT JOIN
    main.Person emp ON e.Person_id = emp.Person_id
LEFT JOIN
    main.Plane pl ON f.Plane_id = pl.Plane_id
WHERE
    f.Flight_id = :flightId
ORDER BY
    e.department;