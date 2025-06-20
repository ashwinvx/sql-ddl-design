-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/oOGYqb
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- from the terminal run:
-- psql < outer_space.sql

CREATE TABLE "planets" (
    "id" serial   NOT NULL,
    "name" TEXT   NOT NULL,
    "orbital_period_in_years" FLOAT   NOT NULL,
    "orbits_around" TEXT   NOT NULL,
    "galaxy" TEXT   NOT NULL,
    CONSTRAINT "pk_planets" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "moons" (
    "id" serial   NOT NULL,
    "name" TEXT   NOT NULL,
    CONSTRAINT "pk_moons" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "planet-moons" (
    "id" serial   NOT NULL,
    "planetID" int   NOT NULL,
    "moonId" int   NOT NULL,
    CONSTRAINT "pk_planet-moons" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "planet-moons" ADD CONSTRAINT "fk_planet-moons_planetID" FOREIGN KEY("planetID")
REFERENCES "planets" ("id");

ALTER TABLE "planet-moons" ADD CONSTRAINT "fk_planet-moons_moonId" FOREIGN KEY("moonId")
REFERENCES "moons" ("id");

