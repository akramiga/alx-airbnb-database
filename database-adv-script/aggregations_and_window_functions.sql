--total number of bookings 
SELECT 
    users.name,
    COUNT(booking.id) AS total_bookings
FROM users
JOIN bookings ON users.id = bookings.user_id
GROUP BY users.name;

--window function
SELECT 
    property_id,
    property.name AS property_name,
    COUNT(booking.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(booking.id) DESC) AS booking_rank
FROM bookings
JOIN property ON booking.property_id = property.id
GROUP BY property_id, property.name;

---
-- aggregations_and_window_functions.sql
-- Ranking properties by number of bookings using ROW_NUMBER()

SELECT 
    property_id,
    property.name AS property_name,
    COUNT(booking.id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(booking.id) DESC) AS booking_position
FROM bookings
JOIN property ON booking.property_id = property.id
GROUP BY property_id, property.name;

