-- Create medicines table
CREATE TABLE medicines (
    medicine_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    expiry_date DATE
);

-- Insert data into medicines table
INSERT INTO medicines (name, category, price, expiry_date) VALUES
('Aspirin', 'Painkiller', 5.50, '2025-12-31'),
('Paracetamol', 'Painkiller', 2.30, '2026-06-30'),
('Amoxicillin', 'Antibiotic', 10.00, '2025-11-01'),
('Ibuprofen', 'Painkiller', 8.75, '2025-09-20'),
('Cetirizine', 'Antihistamine', 4.50, '2026-01-15'),
('Loratadine', 'Antihistamine', 6.00, '2026-03-10'),
('Metformin', 'Diabetic', 15.00, '2025-08-05'),
('Omeprazole', 'Antacid', 7.50, '2026-04-18'),
('Simvastatin', 'Cholesterol', 12.00, '2025-07-12'),
('Warfarin', 'Anticoagulant', 18.00, '2025-12-01');

-- Create patients table
CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    dob DATE,
    gender VARCHAR(10)
);

-- Insert data into patients table
INSERT INTO patients (name, dob, gender) VALUES
('John Doe', '1985-05-15', 'Male'),
('Jane Smith', '1990-11-30', 'Female'),
('Robert Brown', '1978-01-21', 'Male'),
('Emily Davis', '2000-07-19', 'Female'),
('Michael Johnson', '1982-09-25', 'Male'),
('Sarah Lee', '1995-03-12', 'Female'),
('David Wilson', '1965-02-02', 'Male'),
('Linda Harris', '1993-10-10', 'Female'),
('William Clark', '1980-05-05', 'Male'),
('Jessica Lewis', '1998-08-22', 'Female');

-- Create prescriptions table
CREATE TABLE prescriptions (
    prescription_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(patient_id),
    medicine_id INT REFERENCES medicines(medicine_id),
    prescribed_date DATE,
    quantity INT
);

-- Insert data into prescriptions table
INSERT INTO prescriptions (patient_id, medicine_id, prescribed_date, quantity) VALUES
(1, 1, '2025-01-10', 30),
(2, 2, '2025-02-15', 20),
(3, 3, '2025-03-12', 15),
(4, 4, '2025-04-05', 25),
(5, 5, '2025-05-10', 10),
(6, 6, '2025-06-14', 40),
(7, 7, '2025-07-18', 50),
(8, 8, '2025-08-20', 30),
(9, 9, '2025-09-22', 20),
(10, 10, '2025-10-01', 15);

-- Create sales table
CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    prescription_id INT REFERENCES prescriptions(prescription_id),
    medicine_id INT REFERENCES medicines(medicine_id),
    sale_date DATE,
    quantity_sold INT,
    amount DECIMAL(10, 2)
);

-- Insert data into sales table
INSERT INTO sales (prescription_id, medicine_id, sale_date, quantity_sold, amount) VALUES
(1, 1, '2025-01-15', 30, 165.00),
(2, 2, '2025-02-17', 20, 46.00),
(3, 3, '2025-03-14', 15, 150.00),
(4, 4, '2025-04-07', 25, 218.75),
(5, 5, '2025-05-12', 10, 45.00),
(6, 6, '2025-06-18', 40, 240.00),
(7, 7, '2025-07-21', 50, 750.00),
(8, 8, '2025-08-22', 30, 225.00),
(9, 9, '2025-09-24', 20, 240.00),
(10, 10, '2025-10-03', 15, 270.00);

-- Create inventory table
CREATE TABLE inventory (
    medicine_id INT PRIMARY KEY REFERENCES medicines(medicine_id),
    stock_qty INT,
    last_updated DATE
);

-- Insert data into inventory table
INSERT INTO inventory (medicine_id, stock_qty, last_updated) VALUES
(1, 100, '2025-01-01'),
(2, 150, '2025-02-01'),
(3, 200, '2025-03-01'),
(4, 120, '2025-04-01'),
(5, 180, '2025-05-01'),
(6, 250, '2025-06-01'),
(7, 300, '2025-07-01'),
(8, 110, '2025-08-01'),
(9, 90, '2025-09-01'),
(10, 80, '2025-10-01');

-- Create suppliers table
CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(100),
    medicine_id INT REFERENCES medicines(medicine_id),
    last_supplied_date DATE
);

-- Insert data into suppliers table
INSERT INTO suppliers (supplier_name, medicine_id, last_supplied_date) VALUES
('PharmaCorp', 1, '2025-01-05'),
('MediSupply', 2, '2025-02-10'),
('BioPharm', 3, '2025-03-15'),
('MediWell', 4, '2025-04-10'),
('CureAll', 5, '2025-05-12'),
('HealthMart', 6, '2025-06-14'),
('MediLink', 7, '2025-07-16'),
('PharmaLink', 8, '2025-08-18'),
('MediCare', 9, '2025-09-20'),
('CureMax', 10, '2025-10-02');
