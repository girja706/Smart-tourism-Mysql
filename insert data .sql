
-- DESTINATIONS
INSERT INTO destinations
(destination_name, city, state, category, best_season)
VALUES
('Mahakaleshwar Temple', 'Ujjain', 'Madhya Pradesh', 'Religious', 'Winter'),
('Taj Mahal', 'Agra', 'Uttar Pradesh', 'Historical', 'Winter'),
('Goa Beaches', 'Panaji', 'Goa', 'Beach', 'Winter'),
('Jaipur Forts', 'Jaipur', 'Rajasthan', 'Historical', 'Winter'),
('Manali Valley', 'Manali', 'Himachal Pradesh', 'Adventure', 'Summer'),
('Kerala Backwaters', 'Alappuzha', 'Kerala', 'Nature', 'Winter'),
('Varanasi Ghats', 'Varanasi', 'Uttar Pradesh', 'Religious', 'Winter'),
('Ooty Hills', 'Ooty', 'Tamil Nadu', 'Nature', 'Summer'),
('Mumbai Gateway', 'Mumbai', 'Maharashtra', 'City Tour', 'Winter'),
('Mysore Palace', 'Mysuru', 'Karnataka', 'Historical', 'Winter');

-- TOURISTS
INSERT INTO tourists
(tourist_name, gender, age, email, city, registration_date)
VALUES
('Amit Sharma', 'Male', 25, 'amit@example.com', 'Indore', '2026-01-05'),
('Priya Verma', 'Female', 22, 'priya@example.com', 'Bhopal', '2026-01-10'),
('Rahul Patel', 'Male', 30, 'rahul@example.com', 'Ahmedabad', '2026-02-01'),
('Neha Singh', 'Female', 27, 'neha@example.com', 'Delhi', '2026-02-12'),
('Rohit Jain', 'Male', 35, 'rohit@example.com', 'Ujjain', '2026-03-01'),
('Pooja Mehta', 'Female', 24, 'pooja@example.com', 'Mumbai', '2026-03-15'),
('Karan Gupta', 'Male', 29, 'karan@example.com', 'Jaipur', '2026-04-02'),
('Anjali Roy', 'Female', 31, 'anjali@example.com', 'Kolkata', '2026-04-10'),
('Vikas Yadav', 'Male', 26, 'vikas@example.com', 'Lucknow', '2026-05-05'),
('Sneha Joshi', 'Female', 28, 'sneha@example.com', 'Pune', '2026-05-20'),
('Arjun Das', 'Male', 32, 'arjun@example.com', 'Kolkata', '2026-06-01');

-- HOTELS
INSERT INTO hotels
(destination_id, hotel_name, hotel_type, price_per_night, rating)
VALUES
(1, 'Hotel Mahakal Inn', 'Budget', 1500, 4.1),
(1, 'Royal Ujjain Resort', 'Luxury', 4500, 4.7),
(2, 'Agra Heritage Hotel', 'Standard', 2500, 4.2),
(3, 'Goa Beach Resort', 'Resort', 5000, 4.8),
(4, 'Jaipur Palace Stay', 'Luxury', 6000, 4.6),
(5, 'Manali Mountain View', 'Resort', 3500, 4.5),
(6, 'Kerala Lake Retreat', 'Resort', 4000, 4.7),
(7, 'Varanasi Comfort Inn', 'Budget', 1800, 3.9),
(8, 'Ooty Green Hills', 'Standard', 2800, 4.3),
(9, 'Mumbai City Hotel', 'Business', 4200, 4.0),
(10, 'Mysore Grand Stay', 'Standard', 2200, 4.1);

-- TRAVEL PACKAGES
INSERT INTO travel_packages
(destination_id, package_name, duration_days, package_price)
VALUES
(1, 'Ujjain Spiritual Tour', 2, 3500),
(2, 'Agra Heritage Tour', 2, 5000),
(3, 'Goa Beach Holiday', 5, 15000),
(4, 'Jaipur Royal Tour', 3, 8500),
(5, 'Manali Adventure Trip', 5, 12000),
(6, 'Kerala Nature Escape', 4, 11000),
(7, 'Varanasi Spiritual Tour', 3, 6500),
(8, 'Ooty Hill Station Tour', 4, 9000),
(9, 'Mumbai City Explorer', 2, 6000),
(10, 'Mysore Heritage Trip', 2, 4500);

-- BOOKINGS
INSERT INTO bookings
(tourist_id, destination_id, hotel_id, package_id,
 booking_date, check_in, check_out, persons,
 total_amount, booking_status)
VALUES
(1, 1, 1, 1, '2026-06-01', '2026-06-10', '2026-06-12', 2, 6500, 'Completed'),
(2, 3, 4, 3, '2026-06-05', '2026-07-10', '2026-07-15', 2, 18000, 'Completed'),
(3, 2, 3, 2, '2026-06-10', '2026-07-01', '2026-07-03', 1, 7000, 'Completed'),
(4, 4, 5, 4, '2026-06-15', '2026-08-01', '2026-08-04', 2, 12000, 'Confirmed'),
(5, 1, 2, 1, '2026-07-01', '2026-07-15', '2026-07-17', 3, 10000, 'Confirmed'),
(6, 6, 7, 6, '2026-07-05', '2026-08-10', '2026-08-14', 2, 14000, 'Confirmed'),
(7, 5, 6, 5, '2026-07-10', '2026-09-01', '2026-09-06', 2, 16000, 'Pending'),
(8, 7, 8, 7, '2026-07-15', '2026-08-20', '2026-08-23', 1, 7500, 'Cancelled'),
(9, 8, 9, 8, '2026-08-01', '2026-09-10', '2026-09-14', 2, 11000, 'Confirmed'),
(10, 9, 10, 9, '2026-08-05', '2026-09-15', '2026-09-17', 1, 8000, 'Completed'),
(1, 10, 11, 10, '2026-08-10', '2026-10-01', '2026-10-03', 2, 7000, 'Confirmed'),
(3, 3, 4, 3, '2026-08-15', '2026-10-10', '2026-10-15', 4, 25000, 'Pending');

-- PAYMENTS
INSERT INTO payments
(booking_id, payment_date, amount, payment_method, payment_status)
VALUES
(1, '2026-06-01', 6500, 'UPI', 'Paid'),
(2, '2026-06-05', 18000, 'Card', 'Paid'),
(3, '2026-06-10', 7000, 'UPI', 'Paid'),
(4, '2026-06-15', 6000, 'Card', 'Partial'),
(5, '2026-07-01', 10000, 'Cash', 'Paid'),
(6, '2026-07-05', 14000, 'UPI', 'Paid'),
(7, '2026-07-10', 5000, 'Card', 'Partial'),
(8, '2026-07-15', 7500, 'UPI', 'Refunded'),
(9, '2026-08-01', 11000, 'UPI', 'Paid'),
(10, '2026-08-05', 8000, 'Card', 'Paid'),
(11, '2026-08-10', 3500, 'Cash', 'Partial'),
(12, '2026-08-15', 0, 'UPI', 'Pending');

-- REVIEWS
INSERT INTO reviews
(tourist_id, destination_id, rating, comments, review_date)
VALUES
(1, 1, 5, 'Excellent spiritual experience', '2026-06-12'),
(2, 3, 5, 'Beautiful beaches', '2026-07-15'),
(3, 2, 4, 'Amazing historical monument', '2026-07-03'),
(4, 4, 5, 'Wonderful forts and food', '2026-08-04'),
(5, 1, 4, 'Good trip and arrangements', '2026-07-17'),
(6, 6, 5, 'Peaceful backwaters', '2026-08-14'),
(7, 5, 4, 'Great mountain views', '2026-09-06'),
(9, 8, 5, 'Pleasant weather', '2026-09-14'),
(10, 9, 3, 'Good city tour', '2026-09-17');

-- TRANSPORT
INSERT INTO transport
(booking_id, transport_mode, operator_name,
 transport_cost, departure_date)
VALUES
(1, 'Train', 'Indian Railways', 1200, '2026-06-10'),
(2, 'Flight', 'IndiGo', 7000, '2026-07-10'),
(3, 'Train', 'Indian Railways', 1500, '2026-07-01'),
(4, 'Cab', 'Jaipur Travels', 2500, '2026-08-01'),
(5, 'Bus', 'MP Roadways', 800, '2026-07-15'),
(6, 'Flight', 'Air India', 6000, '2026-08-10'),
(7, 'Bus', 'Himachal Travels', 1800, '2026-09-01'),
(9, 'Train', 'Nilgiri Express', 1300, '2026-09-10'),
(10, 'Flight', 'Air India', 4000, '2026-09-15'),
(11, 'Train', 'Indian Railways', 900, '2026-10-01');
