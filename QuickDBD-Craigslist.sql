-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/oOGYqb
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Design a schema for Craigslist! Your schema should keep track of the following
-- The region of the craigslist post (San Francisco, Atlanta, Seattle, etc)
-- Users and preferred region
-- Posts: contains title, text, the user who has posted, the location of the posting, the region of the posting
-- Categories that each post belongs to

CREATE TABLE "Users" (
    "UserID" serial   NOT NULL,
    "Name" string   NOT NULL,
    "Username" string   NOT NULL,
    "Password" en   NOT NULL,
    "PreferredRegionID" int   NOT NULL,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "UserID"
     )
);

CREATE TABLE "Region" (
    "RegionID" int   NOT NULL,
    "Name" string   NOT NULL,
    CONSTRAINT "pk_Region" PRIMARY KEY (
        "RegionID"
     )
);

CREATE TABLE "Posts" (
    "PostID" int   NOT NULL,
    "Title" string   NOT NULL,
    "Text" string   NOT NULL,
    "UserId" int   NOT NULL,
    "Location" string   NOT NULL,
    "RegionID" int   NOT NULL,
    "CategoryID" int   NOT NULL,
    CONSTRAINT "pk_Posts" PRIMARY KEY (
        "PostID"
     )
);

CREATE TABLE "Categories" (
    "CategoryID" int   NOT NULL,
    "Name" string   NOT NULL,
    CONSTRAINT "pk_Categories" PRIMARY KEY (
        "CategoryID"
     )
);

ALTER TABLE "Region" ADD CONSTRAINT "fk_Region_RegionID" FOREIGN KEY("RegionID")
REFERENCES "Users" ("PreferredRegionID");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_UserId" FOREIGN KEY("UserId")
REFERENCES "Users" ("UserID");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_RegionID" FOREIGN KEY("RegionID")
REFERENCES "Region" ("RegionID");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_CategoryID" FOREIGN KEY("CategoryID")
REFERENCES "Categories" ("CategoryID");

CREATE INDEX "idx_Users_Name"
ON "Users" ("Name");

CREATE INDEX "idx_Region_Name"
ON "Region" ("Name");

