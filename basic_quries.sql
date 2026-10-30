-- 1. Display all records from the tourists table.
SELECT * FROM tourists;


-- 2. Find hotels with a price per night greater than ₹3,000.
SELECT hotel_name, hotel_type, price_per_night
FROM hotels
WHERE price_per_night > 3000;


-- 3. Display all destinations located in Madhya Pradesh.
SELECT destination_name, city, state
FROM destinations
WHERE state = 'Madhya Pradesh';


-- 4. Find tourists whose names start with the letter 'A'.
SELECT *
FROM tourists
WHERE tourist_name LIKE 'A%';


-- 5. Display bookings made between June and August 2026.
SELECT *
FROM bookings
WHERE booking_date BETWEEN '2026-06-01' AND '2026-08-31';


-- 6. Display the five most expensive travel packages.
SELECT package_name, package_price
FROM travel_packages
ORDER BY package_price DESC
LIMIT 5;


-- 7. Count the total number of bookings.
SELECT COUNT(*) AS total_bookings
FROM bookings;


-- 8. Calculate the average price of all hotels.
SELECT ROUND(AVG(price_per_night), 2) AS average_hotel_price
FROM hotels;


-- 9. Find the total booking value for each booking status.
SELECT booking_status,
       COUNT(*) AS total_bookings,
       SUM(total_amount) AS total_value
FROM bookings
GROUP BY booking_status;


-- 10. Find destinations having an average review rating of at least 4.
SELECT d.destination_name,
       ROUND(AVG(r.rating), 2) AS average_rating
FROM destinations d
INNER JOIN reviews r
    ON d.destination_id = r.destination_id
GROUP BY d.destination_id, d.destination_name
HAVING AVG(r.rating) >= 4;