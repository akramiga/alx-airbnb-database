## SQL JOIN: Retrieving Properties with Their Reviews

This query demonstrates the use of a **LEFT JOIN** to retrieve all properties along with their associated reviews.

###  What the Query Does:
- Returns all rows from the `property` table.
- Includes matching `review` details (rating and comment) **if a review exists**.
- For properties with no reviews, the review columns will return `NULL`.

###  Why LEFT JOIN?
We use a `LEFT JOIN` because:
- We want **every property** to appear in the results.
- Some properties may not have any reviews yet — and that's okay.
- `LEFT JOIN` ensures those properties are **not excluded**.

###  Ordering:
The results are ordered alphabetically by the property name using:
```sql
ORDER BY property.name ASC;
