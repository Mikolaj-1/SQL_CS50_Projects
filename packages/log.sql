
-- *** The Lost Letter ***
SELECT "id","type" FROM "addresses" WHERE "address" = "900 Somerville Avenue";
SELECT "id","contents","to_address_id" FROM "packages" WHERE "from_address_id"=432;
SELECT "address_id","action","timestamp" FROM "scans" WHERE "package_id"=384;
SELECT "type","address" FROM "addresses" WHERE "id"=854;
-- *** The Devious Delivery ***
SELECT "contents" FROM "packages" WHERE "contents" LIKE "%duck%";
SELECT "type" FROM "addresses" WHERE "id"=50;
-- *** The Forgotten Gift ***
SELECT "id","address" FROM "addresses" WHERE "address"="109 Tileston Street";
SELECT "contents","id" FROM "packages" WHERE "from_address_id"="9873";
SELECT "action","driver_id" FROM "scans" WHERE "package_id"=9523
SELECT "name" FROM "drivers" WHERE "id"=17;
