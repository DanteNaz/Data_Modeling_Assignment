--psql < craigslist.sql
--psql
--\c craigslist



DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist





CREATE TABLE region
(
    id SERIAL PRIMARY KEY,
    city TEXT NOT NULL
);





CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category TEXT NOT NULL
);




CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    username TEXT UNIQUE NOT NULL,
    region_id INTEGER REFERENCES region NOT NULL
    
);




CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users NOT NULL,
    region_id INTEGER REFERENCES region NOT NULL,
    category_id INTEGER REFERENCES categories NOT NULL,
    title TEXT NOT NULL,
    description TEXT NOT NULL
);







INSERT INTO categories (category)
VALUES
('Design'),
('Racing'),
('Drinks'),
('Cars'),
('Army'),
('Vacation'),
('Games');




INSERT INTO region (city)
VALUES
('San Jose'), 
('Los Angeles'), 
('Santa Barbra'),
('Atlanta'), 
('Seattle'), 
('San Francisco');



INSERT INTO users (first_name, last_name, username, region_id)
VALUES
('Trish', 'Lauren', 'T.Lauren45', 1),
('Steve', 'Garrick', 'Steves55', 3),
('Hammond', 'May', 'Fastest31', 5),
('Grisha', 'Rafaelyov','Lada1996', 6),
('Garry', 'Trent','GarrisonT56', 4),
('Harrison', 'Palms','H.Palms1985', 2),
('Kyle', 'Krane','K.Krane77', 4);



INSERT INTO posts
(user_id, region_id, category_id, title, description)
VALUES
(1, 1, 1, 'Fashion Trends', 'Best Fashion Tips for anyone!'),
(2, 3, 4, 'Best Cars For Teens', 'If your a teenager and your looking for a first car, check this out!'),
(3, 5, 2, 'Nurburgring', 'Come to the Nurburgring if your looking for a good time with your car!'),
(4, 6, 3, 'Best Drinks in Our Time', 'Check out the best drinks from wine to vodka!'),
(5, 4, 5, 'Recruiting', 'Come recruit for the army, and serve for your country!'),
(6, 2, 6, 'Relaxation Nation', 'Come over to Palm Springs California and your never gonna leave!'),
(7, 4, 7, 'Best Video Games', 'If your looking for the best video games right now, we got a list for you!');


