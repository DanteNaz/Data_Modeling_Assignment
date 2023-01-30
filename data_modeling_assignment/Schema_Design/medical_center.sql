--psql < medical_center.sql
--psql
--\c medical_center



DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center



CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    disease TEXT NOT NULL
);



CREATE TABLE doctors 
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);



CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);




CREATE TABLE patients_disease
(
    id SERIAL PRIMARY KEY,
    patients_id INTEGER REFERENCES patients NOT NULL,
    disease_id INTEGER REFERENCES diseases NOT NULL
);





CREATE TABLE patients_doctors
(
    id SERIAL PRIMARY KEY,
    patients_id INTEGER REFERENCES patients NOT NULL,
    doctor_id INTEGER REFERENCES doctors NOT NULL
);







CREATE TABLE medical_center
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors NOT NULL
); 







INSERT INTO diseases (disease)
VALUES
('Flu'),
('Chickenpox'),
('Diarrhea'),
('Stomach Ache'),
('Headache'),
('Allergies');





INSERT INTO doctors (first_name, last_name)
VALUES
('John', 'Garrick'),
('Steven', 'Laurent'),
('James', 'May'),
('Susanna', 'Frezno'),
('Misha', 'Brando'),
('Harout', 'Pamboukjian');


INSERT INTO patients
(first_name, last_name)
VALUES
('Jeremy', 'Lawson'),
('Joel', 'Faire'),
('Josh', 'Enzo'),
('Armen', 'Aloyan');


INSERT INTO medical_center (doctor_id)
VALUES
(1), 
(2), 
(3),
(4), 
(5), 
(6);



INSERT INTO patients_disease(patients_id, disease_id)
VALUES
(1,2),
(1,3),
(2,4),
(2,1),
(3,3),
(4,1),
(4,5);




INSERT INTO patients_doctors(patients_id, doctor_id)
VALUES
(1, 2),
(1, 3),
(1, 6),
(2, 1),
(2, 5),
(3, 3),
(3, 4),
(4, 6),
(4, 3);


