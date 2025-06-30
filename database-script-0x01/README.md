# Airbnb Clone - SQL Schema Explanation

This project defines the SQL schema for an Airbnb-like application. The schema includes the necessary tables, relationships, constraints, and indexes to ensure data integrity and query performance.

## Tables Overview

### 1. User
Stores account information for all users including guests, hosts, and admins.

- Constraints:
  - Unique email addresses
  - Role must be one of: guest, host, admin

### 2. Property
Represents properties listed by hosts.

- Constraints:
  - Linked to host via a foreign key to `user.user_id`

### 3. Booking
Stores booking information linking guests to properties.

- Constraints:
  - `status` must be pending, confirmed, or canceled
  - `end_date` must be after `start_date`

### 4. Payment
Records payment transactions for each booking.

- Constraints:
  - Linked to a booking via foreign key
  - `payment_method` must be credit_card, paypal, or stripe

### 5. Review
Contains user reviews for properties.

- Constraints:
  - Rating must be between 1 and 5
  - One user can review a property only once

### 6. Message
Stores messages exchanged between users.

- Constraints:
  - Includes sender and recipient references to users

## Indexes

Indexes are created for performance on:
- `email` in `user`
- `host_id` in `property`
- `property_id` and `user_id` in `booking`
- `booking_id` in `payment`
- `property_id` in `review`
- `sender_id` and `recipient_id` in `message`


