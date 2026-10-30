

-- 1. DESTINATIONS
CREATE TABLE destinations (
    destination_id INT PRIMARY KEY AUTO_INCREMENT,
    destination_name VARCHAR(100) NOT NULL,
    city VARCHAR(80),
    state VARCHAR(80),
    country VARCHAR(80) DEFAULT 'India',
    category VARCHAR(50),
    best_season VARCHAR(50)
);

-- 2. TOURISTS
CREATE TABLE tourists (
    tourist_id INT PRIMARY KEY AUTO_INCREMENT,
    tourist_name VARCHAR(100) NOT NULL,
    gender VARCHAR(20),
    age INT,
    email VARCHAR(100) UNIQUE,
    city VARCHAR(80),
    registration_date DATE
);

-- 3. HOTELS
CREATE TABLE hotels (
    hotel_id INT PRIMARY KEY AUTO_INCREMENT,
    destination_id INT,
    hotel_name VARCHAR(100) NOT NULL,
    hotel_type VARCHAR(50),
    price_per_night DECIMAL(10,2),
    rating DECIMAL(2,1),
    FOREIGN KEY (destination_id)
        REFERENCES destinations(destination_id)
);

-- 4. TRAVEL PACKAGES
CREATE TABLE travel_packages (
    package_id INT PRIMARY KEY AUTO_INCREMENT,
    destination_id INT,
    package_name VARCHAR(100),
    duration_days INT,
    package_price DECIMAL(10,2),
    FOREIGN KEY (destination_id)
        REFERENCES destinations(destination_id)
);

-- 5. BOOKINGS
CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    tourist_id INT NOT NULL,
    destination_id INT NOT NULL,
    hotel_id INT,
    package_id INT,
    booking_date DATE,
    check_in DATE,
    check_out DATE,
    persons INT DEFAULT 1,
    total_amount DECIMAL(10,2),
    booking_status VARCHAR(30) DEFAULT 'Pending',
    FOREIGN KEY (tourist_id)
        REFERENCES tourists(tourist_id),
    FOREIGN KEY (destination_id)
        REFERENCES destinations(destination_id),
    FOREIGN KEY (hotel_id)
        REFERENCES hotels(hotel_id),
    FOREIGN KEY (package_id)
        REFERENCES travel_packages(package_id)
);

-- 6. PAYMENTS
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT NOT NULL,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(30),
    payment_status VARCHAR(30),
    FOREIGN KEY (booking_id)
        REFERENCES bookings(booking_id)
);

-- 7. REVIEWS
CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    tourist_id INT NOT NULL,
    destination_id INT NOT NULL,
    rating INT,
    comments VARCHAR(500),
    review_date DATE,
    FOREIGN KEY (tourist_id)
        REFERENCES tourists(tourist_id),
    FOREIGN KEY (destination_id)
        REFERENCES destinations(destination_id),
    CHECK (rating BETWEEN 1 AND 5)
);

-- 8. TRANSPORT
CREATE TABLE transport (
    transport_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT NOT NULL,
    transport_mode VARCHAR(40),
    operator_name VARCHAR(100),
    transport_cost DECIMAL(10,2),
    departure_date DATE,
    FOREIGN KEY (booking_id)
        REFERENCES bookings(booking_id)
);
