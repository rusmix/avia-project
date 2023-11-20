SELECT 
    e.Employee_id,
    e.department,
    JSON_BUILD_OBJECT(
        'Name', p.name,
        'Lastname', p.lastname,
        'Patronymic', p.patronymic,
        'PassportSeries', p.passport_series,
        'PassportNumber', p.passport_number,
        'PhoneNumber', p.phone_number,
        'DateOfBirth', p.date_of_birth
    ) AS Personal_Info
FROM 
    main.Employee e
JOIN 
    main.Person p ON e.Person_id = p.Person_id
WHERE 
    e.department = :department
    e.Employee_id;