.import --csv meteorites.csv meteorites_temp
CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT,
    "class" TEXT,
    "mass" REAL DEFAULT NULL,
    "discovery" TEXT CHECK("discovery" IN ("Fell","Found")),
    "year" INTEGER DEFAULT NULL,
    "lat" REAL DEFAULT NULL,
    "long" REAL DEFAULT NULL,
    PRIMARY KEY ("id")
);
INSERT INTO "meteorites" ("name","class","mass","discovery","year","lat","long")
SELECT "name", "class", ROUND("mass", 2), "discovery", "year", ROUND("lat", 2), ROUND("long", 2)
FROM "meteorites_temp" WHERE "nametype"="Valid" ORDER BY "year","name";
UPDATE meteorites
SET mass = NULL WHERE TRIM(mass) = '';
UPDATE meteorites
SET year = NULL WHERE TRIM(year) = '';
UPDATE meteorites
SET lat = NULL WHERE TRIM(lat) = '';
UPDATE meteorites
SET long = NULL WHERE TRIM(long) = '';

