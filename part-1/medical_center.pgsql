DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    DOB DATE NOT NULL
);

CREATE TABLE diseases (
    disease_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    notes TEXT
);

CREATE TABLE visits (
    visit_id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients (patient_id),
    doctor_id INTEGER REFERENCES doctors (doctor_id),
    visit_date DATE NOT NULL
);


CREATE TABLE diagnoses (
    diagnoses_id SERIAL PRIMARY KEY,
    disease_id INTEGER REFERENCES diseases (disease_id),
    visit_id INTEGER REFERENCES visits (visit_id)
);


INSERT INTO doctors (first_name, last_name) VALUES ('Greg', 'Perrin');
INSERT INTO doctors (first_name, last_name) VALUES ('Bob', 'Smith');
INSERT INTO doctors (first_name, last_name) VALUES ('Llewyn', 'Lock');

INSERT INTO patients (first_name, last_name, DOB) VALUES ('Kevin', 'Nichols', '1994-09-07');
INSERT INTO patients (first_name, last_name, DOB) VALUES ('Michelle', 'Nichols', '1992-10-16');

INSERT INTO diseases (name, notes) VALUES ('Influenza', 'Respiratory illness effecting nose and throat');
INSERT INTO diseases (name) VALUES ('Food poisoning');

INSERT INTO visits (patient_id, doctor_id, visit_date) VALUES (1, 1, '2020-01-13');
INSERT INTO visits (patient_id, doctor_id, visit_date) VALUES (2, 3, '2021-05-20');

INSERT INTO diagnoses (disease_id, visit_id) VALUES (1, 1);
INSERT INTO diagnoses (disease_id, visit_id) VALUES (2, 2);