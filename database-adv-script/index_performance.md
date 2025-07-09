| Table        | Column         | Reason for Index                                   |
| ------------ | -------------- | -------------------------------------------------- |
| `users`      | `email`        | Often used for login or filtering (`WHERE`)        |
| `bookings`   | `user_id`      | Used in JOINs with `users`                         |
| `bookings`   | `property_id`  | Used in JOINs with `properties`                    |
| `bookings`   | `booking_date` | Often used in `WHERE` or `ORDER BY`                |
| `properties` | `location`     | Frequently filtered (`WHERE location = 'Kampala'`) |


-- Index on users.email for fast login filtering
CREATE INDEX idx_users_email ON users(email);

-- Index on bookings.user_id to speed up joins and filtering
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on bookings.property_id to improve joins
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on bookings.booking_date to improve date-based filters and sorting
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);

-- Index on properties.location to improve location-based filtering
CREATE INDEX idx_properties_location ON properties(location);


EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 1
ORDER BY booking_date DESC;

EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 1
ORDER BY booking_date DESC;
