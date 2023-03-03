CREATE TABLE `List`(
    `id` CHAR(36) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `genre` VARCHAR(255) NOT NULL,
    `content` VARCHAR(255) NOT NULL,
    `createdAt` TIMESTAMP NOT NULL
);
ALTER TABLE
    `List` ADD PRIMARY KEY `list_id_primary`(`id`);
CREATE TABLE `Views`(
    `id` CHAR(36) NOT NULL,
    `userID` CHAR(36) NOT NULL,
    `videoID` CHAR(36) NOT NULL,
    `movieID` CHAR(36) NOT NULL,
    `offset` INT NOT NULL,
    `platform` ENUM('') NOT NULL,
    `createdAt` TIMESTAMP NOT NULL
);
ALTER TABLE
    `Views` ADD PRIMARY KEY `views_id_primary`(`id`);
CREATE TABLE `Videos`(
    `id` CHAR(36) NOT NULL,
    `userID` CHAR(36) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `thumbnailURL` VARCHAR(255) NOT NULL,
    `streamURL` VARCHAR(255) NOT NULL,
    `tags` CHAR(36) NOT NULL,
    `uploadedAt` TIMESTAMP NOT NULL
);
ALTER TABLE
    `Videos` ADD PRIMARY KEY `videos_id_primary`(`id`);
CREATE TABLE `Movies`(
    `id` CHAR(36) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `image` VARCHAR(255) NOT NULL,
    `imageTitle` VARCHAR(255) NOT NULL,
    `imageSm` VARCHAR(255) NOT NULL,
    `trailer` VARCHAR(255) NOT NULL,
    `video` VARCHAR(255) NOT NULL,
    `year` VARCHAR(255) NOT NULL,
    `limit` INT NOT NULL,
    `genre` VARCHAR(255) NOT NULL,
    `isSeries` TINYINT(1) NOT NULL,
    `tags` VARCHAR(255) NOT NULL,
    `createdAt` TIMESTAMP NOT NULL
);
ALTER TABLE
    `Movies` ADD PRIMARY KEY `movies_id_primary`(`id`);
CREATE TABLE `Tags`(
    `id` CHAR(36) NOT NULL,
    `value` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Tags` ADD PRIMARY KEY `tags_id_primary`(`id`);
CREATE TABLE `Users`(
    `id` CHAR(36) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `dob` DATE NOT NULL,
    `location` POINT NOT NULL,
    `createdAt` TIMESTAMP NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `profilePic` VARCHAR(255) NOT NULL,
    `isAdmin` TINYINT(1) NOT NULL,
    `createdAt` TIMESTAMP NOT NULL
);
ALTER TABLE
    `Users` ADD PRIMARY KEY `users_id_primary`(`id`);
CREATE TABLE `Comments`(
    `id` CHAR(36) NOT NULL,
    `userID` CHAR(36) NOT NULL,
    `videoID` CHAR(36) NOT NULL,
    `comment` VARCHAR(255) NOT NULL,
    `createdAt` TIMESTAMP NOT NULL
);
ALTER TABLE
    `Comments` ADD PRIMARY KEY `comments_id_primary`(`id`);
CREATE TABLE `Games`(
    `id` CHAR(36) NOT NULL,
    `playerID` CHAR(36) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `thumbnailURL` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `limit` INT NOT NULL,
    `createdAt` TIMESTAMP NOT NULL
);
ALTER TABLE
    `Games` ADD PRIMARY KEY `games_id_primary`(`id`);
CREATE TABLE `Series`(
    `id` CHAR(36) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `image` VARCHAR(255) NOT NULL,
    `imageTitle` VARCHAR(255) NOT NULL,
    `imageSm` VARCHAR(255) NOT NULL,
    `trailer` VARCHAR(255) NOT NULL,
    `video` VARCHAR(255) NOT NULL,
    `year` VARCHAR(255) NOT NULL,
    `limit` INT NOT NULL,
    `genre` VARCHAR(255) NOT NULL,
    `episodes` INT NOT NULL,
    `createdAt` TIMESTAMP NOT NULL
);
ALTER TABLE
    `Series` ADD PRIMARY KEY `series_id_primary`(`id`);
ALTER TABLE
    `Videos` ADD CONSTRAINT `videos_userid_foreign` FOREIGN KEY(`userID`) REFERENCES `Users`(`id`);
ALTER TABLE
    `Users` ADD CONSTRAINT `users_id_foreign` FOREIGN KEY(`id`) REFERENCES `List`(`id`);
ALTER TABLE
    `Series` ADD CONSTRAINT `series_episodes_foreign` FOREIGN KEY(`episodes`) REFERENCES `Views`(`id`);
ALTER TABLE
    `Comments` ADD CONSTRAINT `comments_videoid_foreign` FOREIGN KEY(`videoID`) REFERENCES `Videos`(`id`);
ALTER TABLE
    `Videos` ADD CONSTRAINT `videos_tags_foreign` FOREIGN KEY(`tags`) REFERENCES `Tags`(`id`);
ALTER TABLE
    `Views` ADD CONSTRAINT `views_id_foreign` FOREIGN KEY(`id`) REFERENCES `Series`(`id`);
ALTER TABLE
    `Movies` ADD CONSTRAINT `movies_tags_foreign` FOREIGN KEY(`tags`) REFERENCES `Tags`(`id`);
ALTER TABLE
    `Games` ADD CONSTRAINT `games_id_foreign` FOREIGN KEY(`id`) REFERENCES `Users`(`id`);
ALTER TABLE
    `Series` ADD CONSTRAINT `series_episodes_foreign` FOREIGN KEY(`episodes`) REFERENCES `List`(`id`);
ALTER TABLE
    `Videos` ADD CONSTRAINT `videos_id_foreign` FOREIGN KEY(`id`) REFERENCES `List`(`id`);
ALTER TABLE
    `List` ADD CONSTRAINT `list_genre_foreign` FOREIGN KEY(`genre`) REFERENCES `Movies`(`genre`);
ALTER TABLE
    `Movies` ADD CONSTRAINT `movies_id_foreign` FOREIGN KEY(`id`) REFERENCES `List`(`id`);
ALTER TABLE
    `Games` ADD CONSTRAINT `games_id_foreign` FOREIGN KEY(`id`) REFERENCES `Users`(`id`);
ALTER TABLE
    `Comments` ADD CONSTRAINT `comments_userid_foreign` FOREIGN KEY(`userID`) REFERENCES `Users`(`id`);
ALTER TABLE
    `Series` ADD CONSTRAINT `series_genre_foreign` FOREIGN KEY(`genre`) REFERENCES `List`(`id`);
ALTER TABLE
    `Users` ADD CONSTRAINT `users_location_foreign` FOREIGN KEY(`location`) REFERENCES `Videos`(`id`);
ALTER TABLE
    `Users` ADD CONSTRAINT `users_id_foreign` FOREIGN KEY(`id`) REFERENCES `Movies`(`id`);
ALTER TABLE
    `Views` ADD CONSTRAINT `views_movieid_foreign` FOREIGN KEY(`movieID`) REFERENCES `Movies`(`id`);
ALTER TABLE
    `Views` ADD CONSTRAINT `views_videoid_foreign` FOREIGN KEY(`videoID`) REFERENCES `Videos`(`id`);
ALTER TABLE
    `Movies` ADD CONSTRAINT `movies_isseries_foreign` FOREIGN KEY(`isSeries`) REFERENCES `Series`(`id`);
ALTER TABLE
    `Views` ADD CONSTRAINT `views_userid_foreign` FOREIGN KEY(`userID`) REFERENCES `Users`(`id`);
ALTER TABLE
    `Movies` ADD CONSTRAINT `movies_id_foreign` FOREIGN KEY(`id`) REFERENCES `Users`(`id`);
ALTER TABLE
    `Users` ADD CONSTRAINT `users_location_foreign` FOREIGN KEY(`location`) REFERENCES `Movies`(`id`);