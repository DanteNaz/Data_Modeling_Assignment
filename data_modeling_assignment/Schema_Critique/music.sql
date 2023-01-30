-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music



CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artists TEXT[] NOT NULL,
  album TEXT NOT NULL,
  producers TEXT[] NOT NULL
);



CREATE TABLE bands 
(
  id SERIAL PRIMARY KEY,
  band_name TEXT NOT NULL,
  genre TEXT NOT NULL,
  started_in INTEGER NOT NULL,
  still_together BOOLEAN NOT NULL
);


CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  genre TEXT NOT NULL,
  started_in INTEGER NOT NULL,
  still_singing BOOLEAN NOT NULL
);






CREATE TABLE collaborations
(
  id SERIAL PRIMARY KEY,
  artist_1 INTEGER REFERENCES artists,
  artist_2 INTEGER REFERENCES artists,
  band_1 INTEGER REFERENCES bands,
  band_2 INTEGER REFERENCES bands,
  song_id INTEGER REFERENCES songs
);







INSERT INTO songs
  (title, duration_in_seconds, release_date, artists, album, producers)
VALUES
  ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
  ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
  ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
  ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
  ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
  ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
  ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
  ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
  ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
  ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');




INSERT INTO bands
  (band_name, genre, started_in, still_together)
VALUES
  ('Hanson', 'Rock', 1992, true),
  ('Queen', 'Rock', 1970, false),
  ('Nickelback', 'Rock', 1995, true),
  ('Maroon 5', 'Pop', 1994, true),
  ('Destiny"s Child', 'R&B', 1990, false),
  ('Boyz II Men', 'R&B', 1998, false);





INSERT INTO artists
  (first_name, last_name, genre, started_in, still_singing)
VALUES
  ('Mariah', 'Carey', 'Pop', 1998, true),
  ('Lady', 'Gaga', 'ElectroPop', 2007, true),
  ('Bradely', 'Cooper', 'Pop', 2018, true),
  ('Alicia', 'Keys', 'R&B', 1998, false),
  ('Katy', 'Perry', 'Pop', 1999, true),
  ('Juicy', 'J', 'Rap', 1997, false),
  ('Avril', 'Lavigne', 'Pop Punk', 1998, false),
  ('Christina', 'Aguilera', 'Hip Hop', 1999, true),
  ('Shawn', 'Corey', 'Rap', 1969, false);





INSERT INTO collaborations (artist_1, artist_2, band_1, band_2, song_id)
VALUES
(1, NULL, 6, NULL, 3),
(2, 3, NULL, NULL, 4),
(9, 4, NULL, NULL, 6),
(5, 6, NULL, NULL, 7),
(8, NULL, 4, NULL, 8);