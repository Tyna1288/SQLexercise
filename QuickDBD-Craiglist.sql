-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/V0a2HM
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
CREATE TABLE "Region" (
    "ID" int   NULL,
    "Name" text   NULL,
    CONSTRAINT "pk_Region" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Users" (
    "ID" int   NOT NULL,
    "username" text   NOT NULL,
    "Password" varchar(70)   NOT NULL,
    "Region_ID" int   NOT NULL,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "ID","Region_ID"
     )
);

CREATE TABLE "Posts" (
    "ID" int   NOT NULL,
    "Title" text   NOT NULL,
    "Post_Text" text   NOT NULL,
    "User_ID" int   NOT NULL,
    "Location" int   NOT NULL,
    "Region_ID" int   NOT NULL,
    "Category_ID" int   NOT NULL,
    CONSTRAINT "pk_Posts" PRIMARY KEY (
        "ID","Title","User_ID","Region_ID","Category_ID"
     )
);

CREATE TABLE "Category" (
    "ID" int   NOT NULL,
    "Name" text   NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_User_ID" FOREIGN KEY("User_ID")
REFERENCES "Users" ("ID");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_Region_ID" FOREIGN KEY("Region_ID")
REFERENCES "Region" ("ID");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_Category_ID" FOREIGN KEY("Category_ID")
REFERENCES "Category" ("ID");

CREATE INDEX "idx_Region_Name"
ON "Region" ("Name");

