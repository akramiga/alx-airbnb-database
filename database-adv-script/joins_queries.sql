--inner join
SELECT 
    users.first_name AS Customer_name,
    users.email,
    booking.id AS Booking_id,
    booking.start_date
FROM users
INNER JOIN booking
ON users.id = booking.id ;

--left join
SELECT
    review.rating AS Rating,
    review.comment_text AS Review
    property.name AS Property
FROM property
LEFT JOIN review
ON review.id = property.id
ORDER BY property.name ASC;

--full outer join
SELECT 
    users.first_name AS Customer_name,
    users.email,
    booking.id AS Booking_id,
    booking.start_date
FROM users
FULL OUTER JOIN booking
ON users.id = booking.id ;