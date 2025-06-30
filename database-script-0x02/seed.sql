--- Insert Users
INSERT INTO user (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES 
(1, 'Alice', 'Walker', 'alice@example.com', 'hashed_pwd_1', '1234567890', 'guest', CURRENT_TIMESTAMP),
(2, 'Bob', 'Smith', 'bob@example.com', 'hashed_pwd_2', '0987654321', 'host', CURRENT_TIMESTAMP),
(3, 'Charlie', 'Admin', 'admin@example.com', 'hashed_pwd_3', NULL, 'admin', CURRENT_TIMESTAMP);

-- Insert Properties
INSERT INTO property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
VALUES 
(1, 2, 'Cozy Cottage', 'A small and cozy cottage in the countryside.', 'Nairobi', 75.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 2, 'Beachfront Villa', 'Luxury villa with sea view.', 'Mombasa', 200.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert Bookings
INSERT INTO booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES 
(1, 1, 1, '2025-07-10', '2025-07-15', 375.00, 'confirmed', CURRENT_TIMESTAMP),
(2, 2, 1, '2025-08-01', '2025-08-03', 400.00, 'pending', CURRENT_TIMESTAMP);

-- Insert Payments
INSERT INTO payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES 
(1, 1, 375.00, CURRENT_TIMESTAMP, 'credit_card');

-- Insert Reviews
INSERT INTO review (review_id, property_id, user_id, rating, comment, created_at)
VALUES 
(1, 1, 1, 5, 'Amazing place! Highly recommend.', CURRENT_TIMESTAMP);

-- Insert Messages
INSERT INTO message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES 
(1, 1, 2, 'Is the cottage available in July?', CURRENT_TIMESTAMP),
(2, 2, 1, 'Yes, it is available from July 10 to 15.', CURRENT_TIMESTAMP);
