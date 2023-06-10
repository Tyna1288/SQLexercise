-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/gzKhk1
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Patients" (
    "ID" int   NULL,
    "Name" text   NULL,
    "Address" string   NOT NULL,
    "Date_of_birth" int   NOT NULL,
    "Insurance" text   NOT NULL,
    CONSTRAINT "pk_Patients" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Disease" (
    "Disease_ID" int   NOT NULL,
    "Patient_ID" int   NOT NULL,
    "Disease_name" text   NOT NULL,
    "Disease_describe" TEXT   NOT NULL,
    CONSTRAINT "pk_Disease" PRIMARY KEY (
        "Disease_ID","Patient_ID"
     )
);

CREATE TABLE "Doctors_visits" (
    "ID" int   NOT NULL,
    "Doctor_ID" int   NOT NULL,
    "Patient_ID" int   NOT NULL,
    "Date" int   NOT NULL,
    CONSTRAINT "pk_Doctors_visits" PRIMARY KEY (
        "ID","Doctor_ID","Patient_ID"
     )
);

CREATE TABLE "Doctor" (
    "ID" int   NOT NULL,
    "Name" varchar(200)   NOT NULL,
    "specialty" text   NOT NULL,
    CONSTRAINT "pk_Doctor" PRIMARY KEY (
        "ID"
     ),
    CONSTRAINT "uc_Doctor_Name" UNIQUE (
        "Name"
    )
);

CREATE TABLE "Diagnoses" (
    "Visit_ID" int   NOT NULL,
    "Disease_Diagnosed" int   NOT NULL,
    "Notes" text   NOT NULL,
    CONSTRAINT "pk_Diagnoses" PRIMARY KEY (
        "Visit_ID"
     )
);

ALTER TABLE "Doctors_visits" ADD CONSTRAINT "fk_Doctors_visits_Doctor_ID" FOREIGN KEY("Doctor_ID")
REFERENCES "Doctor" ("ID");

ALTER TABLE "Doctors_visits" ADD CONSTRAINT "fk_Doctors_visits_Patient_ID" FOREIGN KEY("Patient_ID")
REFERENCES "Patients" ("ID");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_Visit_ID" FOREIGN KEY("Visit_ID")
REFERENCES "Doctors_visits" ("");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_Disease_Diagnosed" FOREIGN KEY("Disease_Diagnosed")
REFERENCES "Disease" ("Disease_ID");

CREATE INDEX "idx_Patients_Name"
ON "Patients" ("Name");

