-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy TEXT NOT NULL,
  moons TEXT[]
);

CREATE TABLE moons 
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE planet_moons (
    id SERIAL PRIMARY KEY,
    planetId int   NOT NULL,
    moonId int   NOT NULL
);

ALTER TABLE planet_moons ADD CONSTRAINT fk_planet_moons_planetId FOREIGN KEY(planetId)
REFERENCES planets (id);

ALTER TABLE planet_moons ADD CONSTRAINT fk_planet_moons_moonId FOREIGN KEY(moonId)
REFERENCES moons (id);

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy, moons)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
  ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
  ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');


INSERT INTO moons (name) SELECT unnest(moons) FROM planets;

INSERT INTO planet_moons (planetId, moonId) VALUES
(1,1),
(2,2),
(2,3),
(4,4),
(4,5),
(4,6),
(4,7),
(4,8),
(4,9),
(4,10),
(4,11),
(4,12),
(4,13),
(4,14),
(4,15),
(4,16),
(4,17);


ALTER TABLE planets DROP COLUMN moons;

SELECT planets.name, orbital_period_in_years, orbits_around, galaxy, moons.name FROM planet_moons 
JOIN planets ON planets.id= planetId 
JOIN moons ON moons.id = moonId;