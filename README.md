# Vehicle Rental System - Database Design & SQL Queries

### Users Table
Users table is created with the necessary information. There can be 2 types of users: 'Admin' and 'Customer'.

--- 

### Vehicles Table
Vehicles table is created with the necessary information. There can be 2 types of vehicles: 'car', 'bike' and 'truck'. Vehicle availability status can be 3 types: 'available', 'rented' and 'maintenance'.

---

### Bookings Table
- Bookings table is created with the necessary information. Bookings table has user_id as foreign key from users table and vehicle_id as foreign key from vehicles table.

- One user can create many bookings but one booking can only have one user. So between users and bookings table there is one to many relationship.

- One vehicle can have many bookings but one booking can only have one vehicle. So between vehicles and bookings table there is one to many relationship.

- There can be 4 types of booking status: 'pending', 'confirmed', 'completed' and 'cancelled'.

---

### Query 1: JOIN
Here bookings table does not have customer_name and vehicle_name but it has user_id and vehicle_id as foreign keys from users table and vehicles table respectively. So, we are joining bookings, users and vehicles table with the help of INNER JOIN (show rows if the both the tables have data).

---

### Query 2: EXISTS
- Here we are joining the vehicles table and bookings table. The requirements is to find vehicle that does not have bookings. So, we have used LEFT JOIN as vehicles is the primary table in the query which will bring all the vehicles even if they does not have any booking.

- Then we filter in which rows booking_id is null. That means those vehicles does not have any booking. Also I order the query result to match with the requirement output.

---

### Query 3: WHERE
In this query we are filtering vehicles that are type 'car' and the vehicle status is 'available'.

---

### Query 4: GROUP BY and HAVING
In this query as we need vehicle name and bookings table does not have vehicle name. So, we are joining bookings table with vehicle table. Then we are grouping records based on vehicle name. Then find out how many bookings each vehicle have? Then only showing the vehicle that have more than 2 bookings. 