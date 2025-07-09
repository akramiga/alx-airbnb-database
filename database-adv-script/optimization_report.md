## Overview
    This report analyzes the performance optimization applied to a booking system query that joins multiple tables (bookings, users, properties, and payments).

 *  Original Query Analysis
    sqlSELECT bookings.*, users.*, properties.*, payments.*
    FROM bookings 
    JOIN users ON bookings.user_id = users.id 
    JOIN properties ON bookings.property_id = properties.id 
    JOIN payments ON bookings.id = payments.booking_id;

# Issues Identified:

SELECT * Anti-pattern: Retrieving all columns from all tables creates unnecessary data transfer
No column filtering: Fetching potentially hundreds of columns when only specific data is needed
Performance impact: Larger result sets consume more memory and network bandwidth
Maintenance issues: Schema changes could break dependent code unexpectedly

# Optimized Query
 * sql 
SELECT 
    booking.id,
    booking.start_date,
    first_name,
    user_email,
    property.name,
    payment.amount
FROM booking 
JOIN users ON booking.user_id = users.id 
JOIN property ON booking.property_id = property.id 
JOIN payments pay ON booking.id = pay.booking_id;
Optimizations Applied

1. Selective Column Retrieval

Before: SELECT * from all 4 tables
After: Only 6 specific columns selected
Impact: Reduced data transfer and memory usage

2. Table Aliasing

Before: Full table names in SELECT clause
After: Shorter aliases (pay for payments)
Impact: Improved query readability and reduced typing

3. Focused Data Selection

Before: All booking, user, property, and payment data
After: Only essential fields (ID, dates, names, email, amount)
Impact: Faster query execution and reduced network overhead

Performance Benefits

Reduced I/O: Less data read from disk
Lower memory usage: Smaller result sets
Faster network transfer: Less data transmitted
Improved scalability: Better performance with larger datasets
Cleaner code: More maintainable and readable