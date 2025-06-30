
# Airbnb Clone - Entity Relationship Diagram Documentation

## 1. Entities and Their Attributes

### User

| Attribute        | Type         | Notes                                    |
|------------------|--------------|------------------------------------------|
| user_id          | UUID         | Primary Key, Indexed                     |
| first_name       | VARCHAR      | NOT NULL                                 |
| last_name        | VARCHAR      | NOT NULL                                 |
| email            | VARCHAR      | UNIQUE, NOT NULL                         |
| password_hash    | VARCHAR      | NOT NULL                                 |
| phone_number     | VARCHAR      | NULL                                     |
| role             | ENUM         | (guest, host, admin), NOT NULL           |
| created_at       | TIMESTAMP    | DEFAULT CURRENT_TIMESTAMP                |

### Property

| Attribute         | Type         | Notes                                    |
|-------------------|--------------|------------------------------------------|
| property_id       | UUID         | Primary Key, Indexed                     |
| host_id           | UUID         | Foreign Key → User(user_id)              |
| name              | VARCHAR      | NOT NULL                                 |
| description       | TEXT         | NOT NULL                                 |
| location          | VARCHAR      | NOT NULL                                 |
| price_per_night   | DECIMAL      | NOT NULL                                 |
| created_at        | TIMESTAMP    | DEFAULT CURRENT_TIMESTAMP                |
| updated_at        | TIMESTAMP    | ON UPDATE CURRENT_TIMESTAMP              |

### Booking

| Attribute        | Type         | Notes                                     |
|------------------|--------------|-------------------------------------------|
| booking_id       | UUID         | Primary Key, Indexed                      |
| property_id      | UUID         | Foreign Key → Property(property_id)       |
| user_id          | UUID         | Foreign Key → User(user_id)              |
| start_date       | DATE         | NOT NULL                                  |
| end_date         | DATE         | NOT NULL                                  |
| total_price      | DECIMAL      | NOT NULL                                  |
| status           | ENUM         | (pending, confirmed, canceled), NOT NULL  |
| created_at       | TIMESTAMP    | DEFAULT CURRENT_TIMESTAMP                 |

### Payment

| Attribute        | Type         | Notes                                     |
|------------------|--------------|-------------------------------------------|
| payment_id       | UUID         | Primary Key, Indexed                      |
| booking_id       | UUID         | Foreign Key → Booking(booking_id)         |
| amount           | DECIMAL      | NOT NULL                                  |
| payment_date     | TIMESTAMP    | DEFAULT CURRENT_TIMESTAMP                 |
| payment_method   | ENUM         | (credit_card, paypal, stripe)             |

### Review

| Attribute        | Type         | Notes                                     |
|------------------|--------------|-------------------------------------------|
| review_id        | UUID         | Primary Key, Indexed                      |
| property_id      | UUID         | Foreign Key → Property(property_id)       |
| user_id          | UUID         | Foreign Key → User(user_id)              |
| rating           | INTEGER      | CHECK: rating >= 1 AND rating <= 5, NOT NULL |
| comment          | TEXT         | NOT NULL                                  |
| created_at       | TIMESTAMP    | DEFAULT CURRENT_TIMESTAMP                 |

### Message

| Attribute        | Type         | Notes                                     |
|------------------|--------------|-------------------------------------------|
| message_id       | UUID         | Primary Key, Indexed                      |
| sender_id        | UUID         | Foreign Key → User(user_id)              |
| recipient_id     | UUID         | Foreign Key → User(user_id)              |
| message_body     | TEXT         | NOT NULL                                  |
| sent_at          | TIMESTAMP    | DEFAULT CURRENT_TIMESTAMP                 |

## 2. Relationships Between Entities

| Relationship Type | From Entity | To Entity | Cardinality | Description                                      |
|-------------------|-------------|-----------|-------------|--------------------------------------------------|
| One to Many       | User        | Property  | 1:N         | One user (host) can create many properties       |
| One to Many       | User        | Booking   | 1:N         | One user (guest) can make many bookings          |
| One to Many       | Property    | Booking   | 1:N         | One property can be booked multiple times        |
| One to One        | Booking     | Payment   | 1:1         | One booking has one payment                      |
| One to Many       | Property    | Review    | 1:N         | One property can have many reviews               |
| One to Many       | User        | Review    | 1:N         | One user can leave many reviews                  |
| One to Many       | User        | Message   | 1:N         | One user can send many messages                  |
| One to Many       | User        | Message   | 1:N         | One user can receive many messages               |

Note: Messaging is implemented through two foreign keys (sender_id and recipient_id) referencing the User table.



## 3. ER Diagram

The ER diagram is provided separately and created using dbdiagram.io. It includes:

- All entities (tables) with their attributes
- Primary keys and foreign keys
- Relationship lines between related entities

To view or export the ERD, visit:

https://dbdiagram.io/d/6862bc8bf413ba350891a6cc