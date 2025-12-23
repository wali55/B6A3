CREATE TABLE IF NOT EXISTS users (
  user_id SERIAL PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  email VARCHAR(150) UNIQUE NOT NULL,
  phone VARCHAR(50) NOT NULL,
  role VARCHAR(50) NOT NULL CHECK (role IN ('Admin', 'Customer'))
);


CREATE TABLE IF NOT EXISTS vehicles (
  vehicle_id SERIAL PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  type VARCHAR(50) NOT NULL CHECK (type IN ('car', 'bike', 'truck')),
  model VARCHAR(150) NOT NULL,
  registration_number VARCHAR(150) UNIQUE NOT NULL,
  rental_price INT NOT NULL CHECK (rental_price >= 0),
  status VARCHAR(50) NOT NULL CHECK (status IN ('available', 'rented', 'maintenance'))
);


CREATE TABLE IF NOT EXISTS bookings (
  booking_id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(user_id) NOT NULL,
  vehicle_id INT REFERENCES vehicles(vehicle_id) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  status VARCHAR(50) NOT NULL CHECK (status IN ('pending', 'confirmed', 'completed', 'cancelled')),
  total_cost INT NOT NULL CHECK (total_cost >= 0),
  CHECK (end_date >= start_date)
);

-- Query 1: JOIN
SELECT b.booking_id, u.name AS customer_name, v.name AS vehicle_name, b.start_date, b.end_date, b.status FROM bookings AS b INNER JOIN users AS u USING(user_id) INNER JOIN vehicles AS v USING(vehicle_id);

-- Query 2: EXISTS
SELECT v.vehicle_id, v.name, v.type, v.model, v.registration_number, v.rental_price, v.status FROM vehicles AS v LEFT JOIN bookings AS b USING(vehicle_id) WHERE b.booking_id IS NULL ORDER BY v.vehicle_id ASC;

-- Query 3: WHERE
SELECT * FROM vehicles WHERE type = 'car' AND status = 'available';

-- Query 4: GROUP BY and HAVING
SELECT v.name AS vehicle_name, COUNT(*) AS total_bookings FROM bookings AS b JOIN vehicles AS v USING(vehicle_id) GROUP BY v.name HAVING COUNT(*) > 2;