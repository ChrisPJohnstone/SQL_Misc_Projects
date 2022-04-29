
CREATE SCHEMA IF NOT EXISTS "Table";
CREATE SCHEMA IF NOT EXISTS "View";
CREATE SCHEMA IF NOT EXISTS "Proc";

--Drop tables in reverse order due to foreign key constraints
DROP TABLE IF EXISTS "Table"."Ref_Assessment_Type"
DROP TABLE IF EXISTS "Table"."Ref_Question_Set"

CREATE TABLE "Table"."Ref_Question_Set" (
    "Import_Date" DATE NOT NULL
    , "Import_Time" TIME NOT NULL
    , "Added_By" VARCHAR(100) NOT NULL
    , "Question_Set" INT IDENTITY NOT NULL PRIMARY KEY
    , "Name" VARCHAR(100) NOT NULL
    , "Notes" VARCHAR(1000) NULL
);

CREATE TABLE "Table"."Ref_Assessment_Type" (
    "Import_Date" DATE NOT NULL
    , "Import_Time" TIME NOT NULL
    , "Added_By" VARCHAR(100) NOT NULL
    , "Question_Set" INT NOT NULL
    , CONSTRAINT FOREIGN KEY("Question_Set") REFERENCES "Ref_Question_Set"("Question_Set")
    , "Assessment_Type" INT IDENTITY NOT NULL PRIMARY KEY
    , "Name" VARCHAR(100) NOT NULL
    , "Notes" NOT NULL
);

INSERT INTO "Table"."Ref_Question_Set" (
    "Import_Date"
    , "Import_Time"
    , "Added_By"
    , "Name"
) VALUES (
    CAST(NOW AS DATE) AS "Import_Date"
    , CAST(NOW() AS TIME) AS "Import_Time"
    , USER AS "Added_By"
    , "Compliance" AS "Name"
), (
    CAST(NOW AS DATE) AS "Import_Date"
    , CAST(NOW() AS TIME) AS "Import_Time"
    , USER AS "Added_By"
    , "Customer Experience" AS "Name"
);