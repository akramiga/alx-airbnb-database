# Airbnb Clone - Normalization to Third Normal Form (3NF)

## Objective

To review the Airbnb Clone database schema and ensure it adheres to the principles of Third Normal Form (3NF) by eliminating redundancy and ensuring data dependencies are properly managed.


**Review and Justification**:

1. **User Table**: No transitive dependencies. All fields depend only on `user_id`.

2. **Property Table**:
   - `host_id` depends on `user_id`, and all other attributes describe the property itself. No redundancy.

3. **Booking Table**:
   - Attributes like `start_date`, `end_date`, and `total_price` directly depend on `booking_id`. No violations.

4. **Payment Table**:
   - Attributes are directly related to a specific `payment_id`. No transitive dependencies.

5. **Review Table**:
   - All attributes depend only on `review_id`. No violations.

6. **Message Table**:
   - No transitive dependencies. Each message has sender, recipient, and body.


## Conclusion

This database schema is already in Third Normal Form (3NF). Each table:
- Has atomic columns (1NF)
- Avoids partial dependencies (2NF)
- Avoids transitive dependencies (3NF)

No changes are necessary to achieve 3NF.