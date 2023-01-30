-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period TEXT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy TEXT NOT NULL,
  moons TEXT[]
);



CREATE TABLE solar_system
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  identifier TEXT NOT NULL,
  size TEXT NOT NULL
);



CREATE TABLE quick_facts
(
  id SERIAL PRIMARY KEY,
  name_id INTEGER REFERENCES solar_system NOT NULL,
  quick_fact TEXT NOT NULL
);








INSERT INTO planets (name, orbital_period, orbits_around, galaxy, moons)
VALUES
('Earth', '1 Year', 'The Sun', 'Milky Way', '{"The Moon"}'),
('Mars', '687 Days', 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
('Venus', '225 Days', 'The Sun', 'Milky Way', '{}'),
('Neptune', '165 Years', 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
('Uranus', '84 Years', 'The Sun', 'Milky Way', '{"Titania", "Ariel", "Umbriel", "Moon", "Miranda", "Oberon", "Puck", "Cressida", "Sycorax"}'),
('Mercury', '88 Days', 'The Sun', 'Milky Way', '{"Moon", "Titan", "Ganymede", "Europa", "Phobos"}'),
('Jupiter', '12 Years', 'The Sun', 'Milky Way', '{"Moon", "Callisto", "Ganymede", "Europa", "Lo", "Amalthea"}'),
('Saturn', '29 years', 'The Sun', 'Milky Way', '{"Titan", "Enceladus", "Mimas", "Dione", "Lapetus", "Tethys", "Hyperion", "Telesto"}'),
('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');




INSERT INTO solar_system
  (name, identifier, size)
VALUES
('Earth', 'Planet', 'Radius: 3,958.8 mi'),
('Mars', 'Planet', 'Radius: 2,106.1 mi'),
('Venus', 'Planet', 'Radius: 3,760.4 mi'),
('Neptune', 'Planet', 'Radius: 15,299 mi'),
('Uranus', 'Planet', 'Radius: 15,759 mi'),
('Mercury', 'Planet', 'Radius: 1,516 mi'),
('Jupiter', 'Planet', 'Radius: 43,441 mi'),
('Saturn', 'Planet', 'Radius: 36,184 mi'),
('Moon', 'Moon', 'Radius: 1,079.6 mi'),
('Milky Way', 'Galaxy', '52,850 light years'),
('Sun', 'Star', 'radius: 432,690 mi');




INSERT INTO quick_facts (name_id, quick_fact)
VALUES
(1, 'Earth rotates at around 1000 miles an hour.'),
(2, 'You could jump around three times higher on Mars than you can on Earth.'),
(3, 'A day on Venus is longer than a year.'),
(4, 'Neptune is Blue because of Methane.'),
(5, 'Uranus is the coldest planet in the Solar System.'),
(6, 'Mercury has a crater named after Dr Suess.'),
(7, 'Jupiter has 80 moons.'),
(8, 'A day on Saturn is only 10.7 hours and a year is 29 Earth years.'),
(9, 'The Moon was made when a rock smashed into Earth.'),
(10, 'The Milky Way has over 200 billion stars.'),
(11, 'The Sun is 15 million degrees Celsius.');




