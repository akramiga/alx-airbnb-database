--Non-Correlated Subquery
SELECT name
FROM property
WHERE id IN (
    SELECT property_id
    FROM review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);


--Correlated Subquery
SELECT name
FROM users 
WHERE (
    SELECT COUNT(*)
    FROM booking 
    WHERE booking.user_id = users.id
) > 3;
