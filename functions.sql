-- 31. Create a function to count the total bookings made by a particular tourist.
DELIMITER $$

CREATE FUNCTION TotalTouristBookings(
    p_tourist_id INT
)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE v_total INT;

    SELECT COUNT(*)
    INTO v_total
    FROM bookings
    WHERE tourist_id = p_tourist_id;

    RETURN v_total;
END $$

DELIMITER ;

SELECT tourist_name,
       TotalTouristBookings(tourist_id) AS total_bookings
FROM tourists;


-- 32. Create a function to calculate the total amount paid for a particular booking.
DELIMITER $$

CREATE FUNCTION TotalAmountPaid(
    p_booking_id INT
)
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
    DECLARE v_amount DECIMAL(10,2);

    SELECT COALESCE(SUM(amount), 0)
    INTO v_amount
    FROM payments
    WHERE booking_id = p_booking_id
      AND payment_status IN ('Paid', 'Partial');

    RETURN v_amount;
END $$

DELIMITER ;

SELECT booking_id,
       total_amount,
       TotalAmountPaid(booking_id) AS amount_paid
FROM bookings;


-- 33. Create a function to count the total hotels available at a particular destination.
DELIMITER $$

CREATE FUNCTION CountDestinationHotels(
    p_destination_id INT
)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE v_count INT;

    SELECT COUNT(*)
    INTO v_count
    FROM hotels
    WHERE destination_id = p_destination_id;

    RETURN v_count;
END $$

DELIMITER ;

SELECT destination_name,
       CountDestinationHotels(destination_id) AS total_hotels
FROM destinations;


-- 34. Create a function to calculate the number of travel days between check-in and check-out dates.
DELIMITER $$

CREATE FUNCTION CalculateTravelDays(
    p_check_in DATE,
    p_check_out DATE
)
RETURNS INT
DETERMINISTIC
NO SQL
BEGIN
    RETURN DATEDIFF(p_check_out, p_check_in);
END $$

DELIMITER ;

SELECT booking_id,
       check_in,
       check_out,
       CalculateTravelDays(check_in, check_out) AS travel_days
FROM bookings;


-- 35. Create a function to calculate the average review rating of a particular destination.
DELIMITER $$

CREATE FUNCTION AverageDestinationRating(
    p_destination_id INT
)
RETURNS DECIMAL(3,2)
READS SQL DATA
BEGIN
    DECLARE v_rating DECIMAL(3,2);

    SELECT ROUND(AVG(rating), 2)
    INTO v_rating
    FROM reviews
    WHERE destination_id = p_destination_id;

    RETURN v_rating;
END $$

DELIMITER ;

SELECT destination_name,
       AverageDestinationRating(destination_id) AS average_rating
FROM destinations;

-- 36. Create a function to calculate the total amount spent by a tourist on all bookings.
DELIMITER $$

CREATE FUNCTION TouristTotalSpending(
    p_tourist_id INT
)
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
    DECLARE v_total DECIMAL(10,2);

    SELECT COALESCE(SUM(total_amount), 0)
    INTO v_total
    FROM bookings
    WHERE tourist_id = p_tourist_id;

    RETURN v_total;
END $$

DELIMITER ;

-- Execute
SELECT tourist_name,
       TouristTotalSpending(tourist_id) AS total_spending
FROM tourists;


-- 37. Create a function to find the highest hotel price in a particular destination.
DELIMITER $$

CREATE FUNCTION HighestHotelPrice(
    p_destination_id INT
)
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
    DECLARE v_price DECIMAL(10,2);

    SELECT MAX(price_per_night)
    INTO v_price
    FROM hotels
    WHERE destination_id = p_destination_id;

    RETURN v_price;
END $$

DELIMITER ;

-- Execute
SELECT destination_name,
       HighestHotelPrice(destination_id) AS highest_hotel_price
FROM destinations;


-- 38. Create a function to calculate the discount amount on a travel package.
Assume the discount rate is 10%.
DELIMITER $$

CREATE FUNCTION PackageDiscount(
    p_package_price DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
NO SQL
BEGIN
    RETURN p_package_price * 0.10;
END $$

DELIMITER ;

-- Execute
SELECT package_name,
       package_price,
       PackageDiscount(package_price) AS discount_amount
FROM travel_packages;


-- 39. Create a function to calculate the final package price after a 10% discount.
DELIMITER $$

CREATE FUNCTION FinalPackagePrice(
    p_package_price DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
NO SQL
BEGIN
    RETURN p_package_price - (p_package_price * 0.10);
END $$

DELIMITER ;

-- Execute
SELECT package_name,
       package_price,
       FinalPackagePrice(package_price) AS final_price
FROM travel_packages;


-- 40. Create a function to classify a hotel based on its rating.
- Rating 4.5 or above: Excellent
- Rating 4.0 or above: Good
- Rating below 4.0: Average
DELIMITER $$

CREATE FUNCTION HotelRatingCategory(
    p_rating DECIMAL(2,1)
)
RETURNS VARCHAR(20)
DETERMINISTIC
NO SQL
BEGIN
    RETURN CASE
        WHEN p_rating >= 4.5 THEN 'Excellent'
        WHEN p_rating >= 4.0 THEN 'Good'
        ELSE 'Average'
    END;
END $$

DELIMITER ;

-- Execute
SELECT hotel_name,
       rating,
       HotelRatingCategory(rating) AS rating_category
FROM hotels;



