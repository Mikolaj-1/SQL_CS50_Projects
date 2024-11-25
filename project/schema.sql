-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it
--Authors table, stores informations about authors
CREATE TABLE "authors" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "greatest_hit" TEXT,
    PRIMARY KEY("id")
);
--Music table, stores informations about music tracs
CREATE TABLE "music" (
    "id" INTEGER,
    "title" TEXT NOT NULL,
    "author_id" INTEGER,
    "type" TEXT,
    "lyrics" TEXT,
    "length" REAL,
    "release_year" INTEGER,
    FOREIGN KEY("author_id") REFERENCES authors("id"),
    PRIMARY KEY("id")
);
--Albums table, stores informations about albums
CREATE TABLE "albums" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "music" TEXT,
    PRIMARY KEY("id")
);
--Users table, stores informations about users
CREATE TABLE "users" (
    "id" INTEGER,
    "username" TEXT NOT NULL,
    "e-mail" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT "normal" CHECK ("status" IN ("premium", "normal")),
    "password" TEXT NOT NULL,
    "liked_music" TEXT,
    "playlists" TEXT,
    PRIMARY KEY("id")
);
--Playlists table, in public column when content is equal 0 then it is private but when its 1 its public
CREATE TABLE "playlists" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "author_id" TEXT NOT NULL,
    "content" TEXT,
    "public" INTEGER DEFAULT 0 CHECK ("public" IN (0,1)),
    FOREIGN KEY("author_id") REFERENCES users("id"),
    PRIMARY KEY("id")
);
--Payments table is storing informations about the payments
CREATE TABLE "payments" (
    "id" INTEGER,
    "user_id" TEXT NOT NULL,
    "amount" REAL CHECK ("amount" IN (4.99)),
    "date" NUMERIC NUMERIC DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("user_id") REFERENCES users("id")
    PRIMARY KEY("id")
);
--User1 is following the user2, if user1 will unfollow user2, unfollow column will change to 1 and trigger will delete this record
CREATE TABLE "followings" (
    "user1_id" INTEGER,
    "user2_id" INTEGER,
    "date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "unfollow" INTEGER DEFAULT 0 CHECK ("unfollow" IN (0,1)),
    FOREIGN KEY("user1_id") REFERENCES users("id"),
    FOREIGN KEY("user2_id") REFERENCES users("id"),
    PRIMARY KEY("user1_id", "user2_id")
);
--Likes is storing informaions about likes given to a music by user, if user will unlike given track, unlike column will change from 0 to 1, trigger will delete this record
CREATE TABLE "likes" (
    "user_id" INTEGER,
    "music_id" INTEGER,
    "unlike" INTEGER DEFAULT 0 CHECK ("unlike" IN (0,1)),
    FOREIGN KEY ("user_id") REFERENCES users("id"),
    FOREIGN KEY ("music_id") REFERENCES music("id"),
    PRIMARY KEY("user_id", "music_id")
);
--Created_playlist is storing informations about playlists created by users
CREATE TABLE "created_playlists" (
    "user_id" INTEGER,
    "playlist_id" INTEGER,
    FOREIGN KEY ("user_id") REFERENCES users("id"),
    FOREIGN KEY ("playlist_id") REFERENCES playlists("id")
    PRIMARY KEY("user_id", "playlist_id")
);
--This trigger is responsible for deleting records when user will unfollow other user
CREATE TRIGGER delete_unfollow
AFTER UPDATE OF unfollow ON followings
FOR EACH ROW
WHEN NEW.unfollow = 1
BEGIN
    DELETE FROM followings
    WHERE user1_id = NEW.user1_id AND user2_id = NEW.user2_id;
END;
--This trigger is responsible for deleting records when user will unlike a music track
CREATE TRIGGER delete_like
AFTER UPDATE OF unlike ON likes
FOR EACH ROW
WHEN NEW.unlike = 1
BEGIN
    DELETE FROM likes
    WHERE user_id = NEW.user_id AND music_id = NEW.music_id;
END;
--This trigger is responsible for updating user status after making a payment
CREATE TRIGGER status_update
AFTER INSERT ON payments
FOR EACH ROW
WHEN NEW.amount=4.99
BEGIN
    UPDATE users
    SET status= "premium"
    WHERE id=NEW.user_id;
END;
--This index will help to find authors by name faster
CREATE INDEX "authors_name_index" ON "authors"("name");
--This index will help to find faster titles in music releasted above 2020 year
CREATE INDEX "new_music_index" ON "music"("title") WHERE "release_year" LIKE "202%";

