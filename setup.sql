DROP DATABASE IF EXISTS racedb;
CREATE DATABASE racedb;

--This is database specific (Postgres). Other systems (MySQL or Oracle)
--would be a different command to connect.
\c racedb;

CREATE TABLE runner(
  bib_id SERIAL PRIMARY KEY,
  division VARCHAR(100),
  sponsor VARCHAR(100),
  name VARCHAR(100) NOT NULL

);

CREATE TABLE venue(
  venue_id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  location VARCHAR(100)
);

CREATE TABLE race(
  race_id SERIAL PRIMARY KEY,
  name VARCHAR(250) NOT NULL,
  distance FLOAT NOT NULL,
  race_date TIMESTAMP NOT NULL,
  venue_id INTEGER,
  FOREIGN KEY(venue_id) REFERENCES venue(venue_id)
);



CREATE TABLE results(
  race_id INTEGER,
  FOREIGN KEY (race_id) REFERENCES race(race_id),
  bib_id INTEGER,
  FOREIGN KEY (bib_id) REFERENCES runner(bib_id),
  result_time FLOAT NOT NULL,
  PRIMARY KEY (race_id, bib_id)
);

INSERT INTO runner(division, sponsor, name)
VALUES ('m30', 'The Iron Yard', 'Myron Flakes'),
       ('m40', 'The Iron Yard', 'Vincent Cobb'),
       ('m20', 'UCF bootcamp, Maximus Felius'),
       ('m50', 'UCG bootcamp, Marvin Felus'),
       ('m60', 'Self taught, John Smith')
        ;
