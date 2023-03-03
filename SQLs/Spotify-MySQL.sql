CREATE TABLE `Playlist Tracks`(
    `playlistID` CHAR(36) NOT NULL,
    `trackID` CHAR(36) NOT NULL,
    `order` INT NOT NULL
);
ALTER TABLE
    `Playlist Tracks` ADD INDEX `playlist tracks_playlistid_trackid_index`(`playlistID`, `trackID`);
ALTER TABLE
    `Playlist Tracks` ADD INDEX `playlist tracks_playlistid_index`(`playlistID`);
ALTER TABLE
    `Playlist Tracks` ADD INDEX `playlist tracks_trackid_index`(`trackID`);
ALTER TABLE
    `Playlist Tracks` ADD PRIMARY KEY `playlist tracks_playlistid_primary`(`playlistID`);
CREATE TABLE `User`(
    `userID` CHAR(36) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `dateOfBirth` DATE NOT NULL,
    `profileImage` BLOB NOT NULL
);
ALTER TABLE
    `User` ADD PRIMARY KEY `user_userid_primary`(`userID`);
CREATE TABLE `Likes`(
    `userID` CHAR(36) NOT NULL,
    `trackID` CHAR(36) NOT NULL,
    `likeDateTime` TIMESTAMP NOT NULL
);
ALTER TABLE
    `Likes` ADD PRIMARY KEY `likes_userid_trackid_primary`(`userID`, `trackID`);
ALTER TABLE
    `Likes` ADD INDEX `likes_userid_index`(`userID`);
ALTER TABLE
    `Likes` ADD INDEX `likes_trackid_index`(`trackID`);
ALTER TABLE
    `Likes` ADD PRIMARY KEY `likes_userid_primary`(`userID`);
CREATE TABLE `Playlists`(
    `playlistID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `userID` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `image` BLOB NOT NULL
);
ALTER TABLE
    `Playlists` ADD INDEX `playlists_userid_index`(`userID`);
ALTER TABLE
    `Playlists` ADD PRIMARY KEY `playlists_playlistid_primary`(`playlistID`);
CREATE TABLE `Albums`(
    `albumID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `artistID` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `releaseDate` DATE NOT NULL,
    `image` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Albums` ADD INDEX `albums_artistid_index`(`artistID`);
ALTER TABLE
    `Albums` ADD PRIMARY KEY `albums_albumid_primary`(`albumID`);
CREATE TABLE `Artist`(
    `artistID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `genre` VARCHAR(255) NOT NULL,
    `image` BLOB NOT NULL
);
ALTER TABLE
    `Artist` ADD PRIMARY KEY `artist_artistid_primary`(`artistID`);
CREATE TABLE `Tracks`(
    `trackID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `albumID` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `duration` INT NOT NULL,
    `path` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Tracks` ADD INDEX `tracks_albumid_index`(`albumID`);
ALTER TABLE
    `Tracks` ADD PRIMARY KEY `tracks_trackid_primary`(`trackID`);
CREATE TABLE `Followers`(
    `userID` CHAR(36) NOT NULL,
    `artistID` CHAR(36) NOT NULL
);
ALTER TABLE
    `Followers` ADD PRIMARY KEY `followers_userid_artistid_primary`(`userID`, `artistID`);
ALTER TABLE
    `Followers` ADD INDEX `followers_userid_index`(`userID`);
ALTER TABLE
    `Followers` ADD INDEX `followers_artistid_index`(`artistID`);
ALTER TABLE
    `Followers` ADD PRIMARY KEY `followers_userid_primary`(`userID`);
ALTER TABLE
    `Likes` ADD CONSTRAINT `likes_trackid_foreign` FOREIGN KEY(`trackID`) REFERENCES `Tracks`(`trackID`);
ALTER TABLE
    `Playlist Tracks` ADD CONSTRAINT `playlist tracks_trackid_foreign` FOREIGN KEY(`trackID`) REFERENCES `Tracks`(`trackID`);
ALTER TABLE
    `Playlists` ADD CONSTRAINT `playlists_userid_foreign` FOREIGN KEY(`userID`) REFERENCES `User`(`userID`);
ALTER TABLE
    `User` ADD CONSTRAINT `user_userid_foreign` FOREIGN KEY(`userID`) REFERENCES `Followers`(`userID`);
ALTER TABLE
    `Albums` ADD CONSTRAINT `albums_artistid_foreign` FOREIGN KEY(`artistID`) REFERENCES `Artist`(`artistID`);
ALTER TABLE
    `User` ADD CONSTRAINT `user_userid_foreign` FOREIGN KEY(`userID`) REFERENCES `Likes`(`userID`);
ALTER TABLE
    `Tracks` ADD CONSTRAINT `tracks_albumid_foreign` FOREIGN KEY(`albumID`) REFERENCES `Albums`(`albumID`);
ALTER TABLE
    `Playlists` ADD CONSTRAINT `playlists_playlistid_foreign` FOREIGN KEY(`playlistID`) REFERENCES `Playlist Tracks`(`playlistID`);