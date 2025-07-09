-- Step 1: Drop existing table if needed
DROP TABLE IF EXISTS bookings CASCADE;

-- Step 2: Create main partitioned table
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    amount DECIMAL(10, 2)
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions by year
CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Optionally add more partitions
-- CREATE TABLE bookings_2026 PARTITION OF bookings FOR VALUES ...

-- Step 4: Add indexes to partitions (important!)
CREATE INDEX idx_bookings_2024_user_id ON bookings_2024(user_id);
CREATE INDEX idx_bookings_2025_user_id ON bookings_2025(user_id);
