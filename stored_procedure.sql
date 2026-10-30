-- 21. Create a stored procedure to display all tourists.
DELIMITER $$

CREATE PROCEDURE GetAllTourists()
BEGIN
    SELECT * FROM tourists;
END $$

DELIMITER ;

CALL GetAllTourists();


-- 22. Create a stored procedure to insert a new tourist into the tourists table.
DELIMITER $$

CREATE PROCEDURE AddTourist(
    IN p_name VARCHAR(100),
    IN p_gender VARCHAR(20),
    IN p_age INT,
    IN p_email VARCHAR(100),
    IN p_city VARCHAR(80),
    IN p_date DATE
)
BEGIN
    INSERT INTO tourists
    (tourist_name, gender, age, email, city, registration_date)
    VALUES
    (p_name, p_gender, p_age, p_email, p_city, p_date);
END $$

DELIMITER ;

CALL AddTourist(
    'Riya Sharma',
    'Female',
    23,
    'riy.new@example.com',
    'Indore',
    '2026-10-27'
);


-- 23. Create a stored procedure to update a tourist's city using their tourist ID.
DELIMITER $$

CREATE PROCEDURE UpdateTouristCity(
    IN p_tourist_id INT,
    IN p_city VARCHAR(80)
)
BEGIN
    UPDATE tourists
    SET city = p_city
    WHERE tourist_id = p_tourist_id;
END $$

DELIMITER ;

CALL UpdateTouristCity(1, 'Bhopal');


-- 24. Create a stored procedure to delete a review using its review ID.
DELIMITER $$

CREATE PROCEDURE DeleteReview(
    IN p_review_id INT
)
BEGIN
    DELETE FROM reviews
    WHERE review_id = p_review_id;
END $$

DELIMITER ;

CALL DeleteReview(9);


-- 25. Create a stored procedure to display all bookings made by a particular tourist.
DELIMITER $$

CREATE PROCEDURE GetTouristBookings(
    IN p_tourist_id INT
)
BEGIN
    SELECT b.booking_id,
           d.destination_name,
           b.booking_date,
           b.total_amount,
           b.booking_status
    FROM bookings b
    INNER JOIN destinations d
        ON b.destination_id = d.destination_id
    WHERE b.tourist_id = p_tourist_id;
END $$

DELIMITER ;

CALL GetTouristBookings(1);


-- 26. Create a stored procedure to update the status of a booking.
DELIMITER $$

CREATE PROCEDURE UpdateBookingStatus(
    IN p_booking_id INT,
    IN p_status VARCHAR(30)
)
BEGIN
    UPDATE bookings
    SET booking_status = p_status
    WHERE booking_id = p_booking_id;
END $$

DELIMITER ;

CALL UpdateBookingStatus(7, 'Confirmed');


-- 27. Create a stored procedure to insert a new destination into the destinations table.
DELIMITER $$

CREATE PROCEDURE AddDestination(
    IN p_name VARCHAR(100),
    IN p_city VARCHAR(80),
    IN p_state VARCHAR(80),
    IN p_country VARCHAR(80),
    IN p_category VARCHAR(50),
    IN p_season VARCHAR(50)
)
BEGIN
    INSERT INTO destinations
    (destination_name, city, state, country, category, best_season)
    VALUES
    (p_name, p_city, p_state, p_country, p_category, p_season);
END $$

DELIMITER ;

CALL AddDestination(
    'Sanchi Stupa',
    'Sanchi',
    'Madhya Pradesh',
    'India',
    'Historical',
    'Winter'
);


-- 28. Create a stored procedure to display hotels whose price is below or equal to a given amount.
DELIMITER $$

CREATE PROCEDURE GetAffordableHotels(
    IN p_max_price DECIMAL(10,2)
)
BEGIN
    SELECT hotel_name,
           hotel_type,
           price_per_night,
           rating
    FROM hotels
    WHERE price_per_night <= p_max_price
    ORDER BY price_per_night ASC;
END $$

DELIMITER ;

CALL GetAffordableHotels(3000);


-- 29. Create a stored procedure to insert a payment record into the payments table.
DELIMITER $$

CREATE PROCEDURE AddPayment(
    IN p_booking_id INT,
    IN p_date DATE,
    IN p_amount DECIMAL(10,2),
    IN p_method VARCHAR(30),
    IN p_status VARCHAR(30)
)
BEGIN
    INSERT INTO payments
    (booking_id, payment_date, amount, payment_method, payment_status)
    VALUES
    (p_booking_id, p_date, p_amount, p_method, p_status);
END $$

DELIMITER ;

CALL AddPayment(
    1,
    '2026-10-27',
    500,
    'UPI',
    'Paid'
);


-- 30. Create a stored procedure to count bookings by status and return the result using an OUT parameter.
DELIMITER $$

CREATE PROCEDURE CountBookingsByStatus(
    IN p_status VARCHAR(30),
    OUT p_total INT
)
BEGIN
    SELECT COUNT(*)
    INTO p_total
    FROM bookings
    WHERE booking_status = p_status;
END $$

DELIMITER ;

CALL CountBookingsByStatus('Completed', @total);

SELECT @total AS completed_bookings;