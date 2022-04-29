
CREATE SCHEMA IF NOT EXISTS "Table";
CREATE SCHEMA IF NOT EXISTS "View";
CREATE SCHEMA IF NOT EXISTS "Proc";

--Drop tables in reverse order due to foreign key constraints
DROP TABLE IF EXISTS "Table"."Ref_Assessment_Type";
DROP TABLE IF EXISTS "Table"."Ref_Question_Set";

CREATE TABLE "Table"."Ref_Question_Set" (
    "Import_Date" DATE NOT NULL
    , "Import_Time" TIME NOT NULL
    , "Added_By" VARCHAR(100) NOT NULL
    , "Question_Set" INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY
    , "Name" VARCHAR(100) NOT NULL
    , "Active" BOOLEAN NOT NULL
    , "Notes" VARCHAR(1000) NULL
    , CONSTRAINT "Ref_Question_Set_Unique_Key" UNIQUE ("Name")
);

CREATE TABLE "Table"."Ref_Assessment_Type" (
    "Import_Date" DATE NOT NULL
    , "Import_Time" TIME NOT NULL
    , "Added_By" VARCHAR(100) NOT NULL
    , "Question_Set" INT NOT NULL
    , CONSTRAINT "Ref_Assessment_Type_Question_Set_Key" FOREIGN KEY("Question_Set") REFERENCES "Ref_Question_Set"("Question_Set")
    , "Assessment_Type" INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY
    , "Name" VARCHAR(100) NOT NULL
    , "Active" BOOLEAN NOT NULL
    , "Notes" VARCHAR(1000) NULL
    , CONSTRAINT "Ref_Assessment_Type_Unique_Key" UNIQUE ("Question_Set", "Name")
);

INSERT INTO "Table"."Ref_Question_Set" (
    "Import_Date"
    , "Import_Time"
    , "Added_By"
    , "Name"
    , "Active"
) VALUES (
    CAST(NOW() AS DATE)
    , CAST(NOW() AS TIME)
    , USER
    , "Compliance"
    , TRUE
), (
    CAST(NOW() AS DATE)
    , CAST(NOW() AS TIME)
    , USER
    , "Customer Experience"
    , TRUE
);

INSERT INTO "Table"."Ref_Assessment_Type" (
    "Import_Date"
    , "Import_Time"
    , "Added_By"
    , "Question_Set"
    , "Name"
    , "Active"
) VALUES (
    CAST(NOW() AS DATE)
    , CAST(NOW() AS TIME)
    , USER
    , 1
    , "Self Assessment"
    , TRUE
), (
    CAST(NOW() AS DATE)
    , CAST(NOW() AS TIME)
    , USER
    , 2
    , "Self Assessment"
    , TRUE
), (
    CAST(NOW() AS DATE)
    , CAST(NOW() AS TIME)
    , USER
    , 2
    , "Manager Assessment"
    , TRUE
);
