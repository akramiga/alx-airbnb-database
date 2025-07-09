EXPLAIN ANALYZE
SELECT 
    bookings.*,
    users.*,
    properties.*,
    payments.*
FROM bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON bookings.id = payments.booking_id;


--optimisation/ refactor
SELECT 
    booking.id,
    booking.start_date,
    
    first_name,
    user_email,

    property.name,
    

    payment.amount
FROM booking 
JOIN users  ON booking.user_id = users.id
JOIN property  ON booking.property_id = property.id
JOIN payments pay ON booking.id = pay.booking_id;
