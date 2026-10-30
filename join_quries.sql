
-- 11. Display tourist names with their booking IDs and booking amounts.
SELECT t.tourist_name,
       b.booking_id,
       b.total_amount,
       b.booking_status
FROM tourists t
INNER JOIN bookings b
    ON t.tourist_id = b.tourist_id;


-- 12. Display destination names with their hotel names and prices.
SELECT d.destination_name,
       h.hotel_name,
       h.price_per_night
FROM destinations d
INNER JOIN hotels h
    ON d.destination_id = h.destination_id;


-- 13. Display travel package names with their destination names.
SELECT p.package_name,
       d.destination_name,
       p.duration_days,
       p.package_price
FROM travel_packages p
INNER JOIN destinations d
    ON p.destination_id = d.destination_id;


-- 14. Display tourist names, booking IDs, payment amounts and payment methods.
SELECT t.tourist_name,
       b.booking_id,
       p.amount,
       p.payment_method,
       p.payment_status
FROM tourists t
INNER JOIN bookings b
    ON t.tourist_id = b.tourist_id
INNER JOIN payments p
    ON b.booking_id = p.booking_id;



-- 15. Display all tourists, including tourists who have never booked a trip.
SELECT t.tourist_id,
       t.tourist_name,
       b.booking_id,
       b.booking_status
FROM tourists t
LEFT JOIN bookings b
    ON t.tourist_id = b.tourist_id;


-- 16. Display all destinations, including destinations without hotels.
SELECT d.destination_name,
       h.hotel_name,
       h.hotel_type
FROM destinations d
LEFT JOIN hotels h
    ON d.destination_id = h.destination_id;


-- 17. Display all bookings and their transport details, including bookings without transport records.
SELECT b.booking_id,
       b.booking_status,
       tr.transport_mode,
       tr.operator_name,
       tr.transport_cost
FROM bookings b
LEFT JOIN transport tr
    ON b.booking_id = tr.booking_id ;
    
-- 18. Display all bookings and their tourist details using RIGHT JOIN.
SELECT t.tourist_name,
       b.booking_id,
       b.total_amount
FROM bookings b
RIGHT JOIN tourists t
    ON b.tourist_id = t.tourist_id;



-- 19. Display all hotels and their destination details using RIGHT JOIN.
SELECT d.destination_name,
       h.hotel_name,
       h.price_per_night
FROM destinations d
RIGHT JOIN hotels h
    ON d.destination_id = h.destination_id;



-- 20. Display all destinations and their reviews using RIGHT JOIN.
SELECT d.destination_name,
       r.rating,
       r.comments,
       r.review_date
FROM reviews r
RIGHT JOIN destinations d
    ON r.destination_id = d.destination_id; 