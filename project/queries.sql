-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database
--Users uploading their music
INSERT INTO music ("title", "author_id", "type", "lyrics", "length", "release_year") VALUES ("Burning love", 1, "Pop","...",2.50,1972);
INSERT INTO music ("title", "author_id", "type", "lyrics", "length", "release_year") VALUES ("Firework", 3, "Pop","...",3.48,2010);
INSERT INTO music ("title", "author_id", "type", "lyrics", "length", "release_year") VALUES ("Can't Help Falling in Love", 1, "Pop","...",2.59,1961);
--User adding music track to his favorite
INSERT INTO likes ("user_id", "music_id") VALUES (3,1);
--User deleting music track from favorite
UPDATE likes SET "unlike"=1 WHERE "user_id"=3 AND "music_id"=1;
--User creating playlist
INSERT INTO playlists ("name", "author_id", "content", "public") VALUES ("Elvis", 1, (SELECT GROUP_CONCAT("title", ", ") FROM "music" WHERE "id" = 1 OR "id" = 3), 1);
--User making a payment
INSERT INTO payments ("user_id", "amount") VALUES (1, 4.99);
--User following another user
INSERT INTO followings ("user1_id", "user2_id") VALUES (2,4);
--User deleting another user from followers
UPDATE followings SET "unfollow"=1 WHERE "user1_id"= 2 AND "user2_id"=4;
--User searching all informations about given music track
SELECT * FROM "music" WHERE "title" = "Firework";
--User searching all informations about given artis
SELECT * FROM "authors" WHERE "name" = "Snoop Dogg";
--User checking content of a playlist
SELECT "content" FROM "playlists" WHERE "name"="Elvis";
--User checking list of his favorites songs
SELECT "title" FROM "music" WHERE "id" IN (SELECT "music_id" FROM "likes" WHERE "user_id"=1);
