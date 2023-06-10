-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/8nm6MQ
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
CREATE TABLE "Teams" (
    "ID" int   NULL,
    "Name" text   NULL,
    "City" text   NULL,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Goals" (
    "ID" int   NOT NULL,
    "Player_ID" int   NOT NULL,
    "Match_ID" int   NOT NULL,
    CONSTRAINT "pk_Goals" PRIMARY KEY (
        "ID","Player_ID","Match_ID"
     )
);

CREATE TABLE "Players" (
    "ID" int   NOT NULL,
    "Name" text   NOT NULL,
    "Birthday" string   NOT NULL,
    "Height" int   NOT NULL,
    "Current_Team_ID" int   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "ID","Name","Current_Team_ID"
     )
);

CREATE TABLE "Referees" (
    "ID" int   NOT NULL,
    "Name" text   NOT NULL,
    CONSTRAINT "pk_Referees" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Results" (
    "ID" int   NOT NULL,
    "Team_ID" int   NOT NULL,
    "Match_ID" int   NOT NULL,
    "Result" string   NOT NULL,
    CONSTRAINT "pk_Results" PRIMARY KEY (
        "ID","Team_ID","Match_ID"
     )
);

CREATE TABLE "Matches" (
    "ID" int   NOT NULL,
    "Location" text   NOT NULL,
    "Date" string   NOT NULL,
    "Season_ID" int   NOT NULL,
    "Home_Team_ID" int   NOT NULL,
    "Away_Team_ID" int   NOT NULL,
    "Start_Time" string   NOT NULL,
    "Head_Referee_ID" int   NOT NULL,
    "Assistant_Referee1_ID" int   NOT NULL,
    "Assistant_Referee2_ID" int   NOT NULL,
    CONSTRAINT "pk_Matches" PRIMARY KEY (
        "ID","Season_ID","Home_Team_ID","Head_Referee_ID"
     )
);

CREATE TABLE "LineUps" (
    "ID" int   NOT NULL,
    "Player_ID" int   NOT NULL,
    "Team_ID" int   NOT NULL,
    "Match_ID" int   NOT NULL,
    CONSTRAINT "pk_LineUps" PRIMARY KEY (
        "ID","Player_ID"
     )
);

CREATE TABLE "Seasons" (
    "ID" int   NOT NULL,
    "Start_Date" string   NOT NULL,
    "Password" varchar(70)   NOT NULL,
    "End_Date" string   NOT NULL,
    CONSTRAINT "pk_Seasons" PRIMARY KEY (
        "ID","End_Date"
     )
);

ALTER TABLE "Teams" ADD CONSTRAINT "fk_Teams_ID" FOREIGN KEY("ID")
REFERENCES "LineUps" ("Team_ID");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_Player_ID" FOREIGN KEY("Player_ID")
REFERENCES "Players" ("ID");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_Match_ID" FOREIGN KEY("Match_ID")
REFERENCES "Matches" ("ID");

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_Current_Team_ID" FOREIGN KEY("Current_Team_ID")
REFERENCES "Teams" ("ID");

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_Team_ID" FOREIGN KEY("Team_ID")
REFERENCES "Teams" ("ID");

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_Match_ID" FOREIGN KEY("Match_ID")
REFERENCES "Matches" ("ID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_Season_ID" FOREIGN KEY("Season_ID")
REFERENCES "Seasons" ("ID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_Home_Team_ID" FOREIGN KEY("Home_Team_ID")
REFERENCES "Teams" ("ID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_Head_Referee_ID" FOREIGN KEY("Head_Referee_ID")
REFERENCES "Referees" ("ID");

ALTER TABLE "LineUps" ADD CONSTRAINT "fk_LineUps_Player_ID" FOREIGN KEY("Player_ID")
REFERENCES "Players" ("ID");

ALTER TABLE "LineUps" ADD CONSTRAINT "fk_LineUps_Match_ID" FOREIGN KEY("Match_ID")
REFERENCES "Matches" ("ID");

CREATE INDEX "idx_Teams_Name"
ON "Teams" ("Name");

CREATE INDEX "idx_Teams_City"
ON "Teams" ("City");

