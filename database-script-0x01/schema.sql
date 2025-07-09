
-- User Table
CREATE TABLE users (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(60) NOT NULL,
    phone_number VARCHAR(20),
    role VARCHAR(10) CHECK (role IN ('guest', 'host', 'admin')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_user_email ON user(email);

-- Property Table
CREATE TABLE property (
    property_id UUID PRIMARY KEY,
    host_id UUID REFERENCES user(user_id),
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_property_host_id ON property(host_id);

-- Booking Table
CREATE TABLE booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID REFERENCES property(property_id),
    user_id UUID REFERENCES user(user_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(15) CHECK (status IN ('pending', 'confirmed', 'canceled')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHECK (end_date > start_date)
);

CREATE INDEX idx_booking_property_id ON booking(property_id);
CREATE INDEX idx_booking_user_id ON booking(user_id);

-- Payment Table
CREATE TABLE payment (
    payment_id UUID PRIMARY KEY,
    booking_id UUID REFERENCES booking(booking_id),
    amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(30) CHECK (payment_method IN ('credit_card', 'paypal', 'stripe')) NOT NULL
);

CREATE INDEX idx_payment_booking_id ON payment(booking_id);

-- Review Table
CREATE TABLE review (
    review_id UUID PRIMARY KEY,
    property_id UUID REFERENCES property(property_id),
    user_id UUID REFERENCES user(user_id),
    rating INTEGER CHECK (rating >= 1 AND rating <= 5) NOT NULL,
    comment_text  TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (user_id, property_id)
);

CREATE INDEX idx_review_property_id ON review(property_id);

-- Message Table
CREATE TABLE message (
    message_id UUID PRIMARY KEY,
    sender_id UUID REFERENCES user(user_id),
    recipient_id UUID REFERENCES user(user_id),
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_message_sender_id ON message(sender_id);
CREATE INDEX idx_message_recipient_id ON message(recipient_id);