SELECT substr("sentence", 98, 4) FROM "sentences" WHERE "id"=14;
SELECT substr("sentence", 3, 5) FROM "sentences" WHERE "id"=114;
SELECT substr("sentence", 72, 9) FROM "sentences" WHERE "id"=618;
SELECT substr("sentence", 7, 3) FROM "sentences" WHERE "id"=630;
SELECT substr("sentence", 12, 5) FROM "sentences" WHERE "id"=932;
SELECT substr("sentence", 50, 7) FROM "sentences" WHERE "id"=2230;
SELECT substr("sentence", 44, 10) FROM "sentences" WHERE "id"=2346;
SELECT substr("sentence", 14, 5) FROM "sentences" WHERE "id"=3041;
CREATE TABLE "temp" ("sen1" TEXT, "sen2" TEXT, "sen3" TEXT, "sen4" TEXT, "sen5" TEXT, "sen6" TEXT, "sen7" TEXT, "sen8" TEXT);
INSERT INTO "temp" ("sen1", "sen2", "sen3", "sen4", "sen5", "sen6", "sen7", "sen8")
SELECT (SELECT substr("sentence", 98, 4) FROM "sentences" WHERE "id"=14),
(SELECT substr("sentence", 3, 5) FROM "sentences" WHERE "id"=114),
(SELECT substr("sentence", 72, 9) FROM "sentences" WHERE "id"=618),
(SELECT substr("sentence", 7, 3) FROM "sentences" WHERE "id"=630),
(SELECT substr("sentence", 12, 5) FROM "sentences" WHERE "id"=932),
(SELECT substr("sentence", 50, 7) FROM "sentences" WHERE "id"=2230),
(SELECT substr("sentence", 44, 10) FROM "sentences" WHERE "id"=2346),
(SELECT substr("sentence", 14, 5) FROM "sentences" WHERE "id"=3041);
CREATE VIEW "message" AS
SELECT "sen1" || " " || "sen2" || " " || "sen3" || " " || "sen4" || " " || "sen5" || " " || "sen6" || " " || "sen7" || " " || "sen8" as "phrase" FROM "temp";
