# Vehicle Rental Management System

A simple and scalable database system to manage users, vehicles, and bookings for a rental service. The system ensures proper handling of business logic, booking management, and vehicle availability.

## 📦 Features

- **User Management**:  
  - Store users with roles (`Admin` or `Customer`)  
  - Track name, email, password, and phone number  
  - Enforce unique emails to avoid duplicate accounts  

- **Vehicle Management**:  
  - Store vehicle information: name, type (`car`, `bike`, `truck`), model  
  - Track registration number (unique), rental price per day, and availability status (`available`, `rented`, `maintenance`)  

- **Booking Management**:  
  - Link bookings to users and vehicles  
  - Track rental start and end dates, booking status (`pending`, `confirmed`, `completed`, `cancelled`)  
  - Automatically calculate total cost based on rental duration and vehicle price  

- **Business Logic Support**:  
  - Prevent double bookings  
  - Manage vehicle availability  

## 🗄️ Database Schema

### Users Table
| Column      | Type    | Constraints                  |
|------------|--------|-----------------------------|
| user_id    | SERIAL | PRIMARY KEY                 |
| role       | VARCHAR | NOT NULL (`Admin` or `Customer`) |
| name       | VARCHAR | NOT NULL                    |
| email      | VARCHAR | NOT NULL, UNIQUE            |
| password   | VARCHAR | NOT NULL                    |
| phone      | VARCHAR |                             |

### Vehicles Table
| Column              | Type     | Constraints                     |
|--------------------|---------|--------------------------------|
| vehicle_id          | SERIAL  | PRIMARY KEY                    |
| vehicle_name        | VARCHAR | NOT NULL                       |
| type                | VARCHAR | NOT NULL (`car`, `bike`, `truck`) |
| model               | VARCHAR |                                |
| registration_number | VARCHAR | NOT NULL, UNIQUE               |
| rental_price        | NUMERIC | NOT NULL                       |
| availability_status | VARCHAR | NOT NULL (`available`, `rented`, `maintenance`) |

### Bookings Table
| Column       | Type     | Constraints                     |
|-------------|---------|--------------------------------|
| booking_id   | SERIAL  | PRIMARY KEY                    |
| user_id      | INT     | REFERENCES Users(user_id)      |
| vehicle_id   | INT     | REFERENCES Vehicles(vehicle_id) |
| start_date   | DATE    | NOT NULL                       |
| end_date     | DATE    | NOT NULL                       |
| status       | VARCHAR | NOT NULL (`pending`, `confirmed`, `completed`, `cancelled`) |
| total_cost   | NUMERIC | NOT NULL                       |

## 📝 Sample Queries 

1. **JOIN Query**  
   Retrieves booking information along with the customer’s name and vehicle name. Useful for seeing which customer booked which vehicle and the booking details.

2. **EXISTS / NOT EXISTS Query**  
   Finds all vehicles that have never been booked. Helps identify idle vehicles in the inventory.

3. **WHERE Query**  
   Retrieves all available vehicles of a specific type (e.g., cars, bikes, trucks). Useful for customers looking for a specific type of vehicle.

4. **GROUP BY and HAVING Query**  
   Calculates the total number of bookings per vehicle and filters to show only those with more than a certain number of bookings. Helps in analyzing popular vehicles.

## 🚀 How to Use

1. Create the database and tables using the schema above.
2. Insert sample data for users, vehicles, and bookings.
3. Execute queries to manage and analyze booking data according to business needs.

## 💻 Tech Stack

- PostgreSQL (Relational Database)  
- SQL for data management and queries  

---