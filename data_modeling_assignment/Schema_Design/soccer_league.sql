--psql < soccer_league.sql
--psql
--\c soccer_league



DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league





CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    season TEXT NOT NULL
);




CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL 
);





CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    team TEXT NOT NULL,
    rank TEXT NOT NULL
);





CREATE TABLE games
(
    season_id INTEGER REFERENCES seasons NOT NULL,
    team_1_id INTEGER REFERENCES teams NOT NULL,
    team_2_id INTEGER REFERENCES teams NOT NULL,
    match_results TEXT NOT NULL,
    referee_id INTEGER REFERENCES referees NOT NULL
);





CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams NOT NULL,
    goals_scored INTEGER NOT NULL    
);




INSERT INTO seasons (season)
VALUES
('Spring'),
('Summer'),
('Autumn'),
('Winter');





INSERT INTO referees (first_name, last_name)
VALUES
('John', 'Baker'), 
('Max', 'Zelinsky'), 
('Dmitri', 'Patrenenko'),
('Hasim', 'Shirzad'), 
('Danny', 'Lazar'), 
('Mohammad', 'Tamim');



INSERT INTO teams (team, rank)
VALUES
('Arsenal', 'Rank 1'),
('Man City', 'Rank 2'),
('Newcastle', 'Rank 3'),
('Man United', 'Rank 4'),
('Tottenham', 'Rank 5'),
('Brighton', 'Rank 6'),
('Fulham', 'Rank 7');




INSERT INTO games
(season_id, team_1_id, team_2_id, match_results, referee_id)
VALUES
(4, 1, 3, '2-1', 2),
(1, 1, 6, '4-1', 3),
(2, 2, 4, '2-1', 4),
(3, 5, 7, '1-1', 6),
(4, 6, 4, '2-4', 3),
(1, 3, 5, '1-2', 2),
(2, 7, 1, '1-5', 1);






INSERT INTO players
(first_name, last_name, team_id, goals_scored)
VALUES
('Thierry', 'Henry', 1, 51),
('David', 'Seaman', 1, 62),
('David', 'Silva', 2, 70),
('Kevin', 'De Bruyne', 2, 64),
('Alan', 'Shearer', 3, 58),
('Andy', 'Cole', 3, 47),
('Christiano', 'Ronaldo', 4, 96),
('Bobby', 'Charlton', 4, 54),
('Harry', 'Kane', 5, 64),
('Robbie', 'Keane', 5, 49),
('Glenn', 'Murray', 6, 48),
('Bobby', 'Zamora', 6, 54),
('Dimitar', 'Berbatov', 7, 44),
('Danny', 'Murphy', 7, 56);
