-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/oOGYqb
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Design a schema for a simple sports league. Your schema should keep track of
-- All of the teams in the league
-- All of the goals scored by every player for each game
-- All of the players in the league and their corresponding teams
-- All of the referees who have been part of each game
-- All of the matches played between teams
-- All of the start and end dates for season that a league has
-- The standings/rankings of each team in the league
-- (This doesn’t have to be its own table if the data can be captured somehow).

CREATE TABLE "Teams" (
    "TeamID" serial   NOT NULL,
    "Name" varchar(40)   NOT NULL,
    "City" string   NOT NULL,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "TeamID"
     )
);

CREATE TABLE "Players" (
    "PlayerID" serial   NOT NULL,
    "Name" varchar(40)   NOT NULL,
    "CurrentTeamID" int   NOT NULL,
    "Height" float   NOT NULL,
    "Birthday" date   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "PlayerID"
     )
);

CREATE TABLE "Matches" (
    "MatchID" serial   NOT NULL,
    "HomeTeam" int   NOT NULL,
    "AwayTeam" int   NOT NULL,
    "SeasonID" int   NOT NULL,
    "Date" date   NOT NULL,
    "City" string   NOT NULL,
    "StartTime" time   NOT NULL,
    "HeadReferee" int   NOT NULL,
    "AssistantReferee1" int   NOT NULL,
    "AssistantReferee2" int   NOT NULL,
    CONSTRAINT "pk_Matches" PRIMARY KEY (
        "MatchID"
     )
);

CREATE TABLE "Lineups" (
    "LineupID" serial   NOT NULL,
    "TeamID" int   NOT NULL,
    "PlayerID" int   NOT NULL,
    "MatchID" int   NOT NULL,
    CONSTRAINT "pk_Lineups" PRIMARY KEY (
        "LineupID"
     )
);

CREATE TABLE "Results" (
    "ResultID" serial   NOT NULL,
    "TeamID" int   NOT NULL,
    "MatchId" int   NOT NULL,
    "Win_Loss_Draw" string   NOT NULL,
    CONSTRAINT "pk_Results" PRIMARY KEY (
        "ResultID"
     )
);

CREATE TABLE "Goals" (
    "GoalID" serial   NOT NULL,
    "MatchID" int   NOT NULL,
    "PlayerID" int   NOT NULL,
    CONSTRAINT "pk_Goals" PRIMARY KEY (
        "GoalID"
     )
);

CREATE TABLE "Referees" (
    "RefereeID" serial   NOT NULL,
    "Name" varchar(40)   NOT NULL,
    CONSTRAINT "pk_Referees" PRIMARY KEY (
        "RefereeID"
     )
);

CREATE TABLE "Seasons" (
    "SeasonID" serial   NOT NULL,
    "StartDate" date   NOT NULL,
    "EndDate" date   NOT NULL,
    CONSTRAINT "pk_Seasons" PRIMARY KEY (
        "SeasonID"
     )
);

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_CurrentTeamID" FOREIGN KEY("CurrentTeamID")
REFERENCES "Teams" ("TeamID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_HomeTeam" FOREIGN KEY("HomeTeam")
REFERENCES "Teams" ("TeamID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_AwayTeam" FOREIGN KEY("AwayTeam")
REFERENCES "Teams" ("TeamID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_SeasonID" FOREIGN KEY("SeasonID")
REFERENCES "Seasons" ("SeasonID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_HeadReferee" FOREIGN KEY("HeadReferee")
REFERENCES "Referees" ("RefereeID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_AssistantReferee1" FOREIGN KEY("AssistantReferee1")
REFERENCES "Referees" ("RefereeID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_AssistantReferee2" FOREIGN KEY("AssistantReferee2")
REFERENCES "Referees" ("RefereeID");

ALTER TABLE "Lineups" ADD CONSTRAINT "fk_Lineups_TeamID" FOREIGN KEY("TeamID")
REFERENCES "Teams" ("TeamID");

ALTER TABLE "Lineups" ADD CONSTRAINT "fk_Lineups_PlayerID" FOREIGN KEY("PlayerID")
REFERENCES "Players" ("PlayerID");

ALTER TABLE "Lineups" ADD CONSTRAINT "fk_Lineups_MatchID" FOREIGN KEY("MatchID")
REFERENCES "Matches" ("MatchID");

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_TeamID" FOREIGN KEY("TeamID")
REFERENCES "Teams" ("TeamID");

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_MatchId" FOREIGN KEY("MatchId")
REFERENCES "Matches" ("MatchID");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_MatchID" FOREIGN KEY("MatchID")
REFERENCES "Matches" ("MatchID");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_PlayerID" FOREIGN KEY("PlayerID")
REFERENCES "Players" ("PlayerID");

CREATE INDEX "idx_Teams_Name"
ON "Teams" ("Name");

CREATE INDEX "idx_Players_Name"
ON "Players" ("Name");

