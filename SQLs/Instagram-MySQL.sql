CREATE TABLE `User`(
    `id` CHAR(36) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `phoneNumber` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `User` ADD PRIMARY KEY `user_id_primary`(`id`);
CREATE TABLE `Photo`(
    `id` CHAR(36) NOT NULL,
    `albumID` CHAR(36) NOT NULL,
    `locationID` CHAR(36) NOT NULL,
    `memberID` CHAR(36) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `privacy` VARCHAR(255) NOT NULL,
    `uploadDate` DATE NOT NULL,
    `view` BIGINT NOT NULL,
    `imagePath` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Photo` ADD PRIMARY KEY `photo_id_primary`(`id`);
CREATE TABLE `Comment`(
    `id` CHAR(36) NOT NULL,
    `photoID` CHAR(36) NOT NULL,
    `postDate` DATE NOT NULL,
    `content` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Comment` ADD PRIMARY KEY `comment_id_primary`(`id`);
CREATE TABLE `Album`(
    `id` CHAR(36) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `view` BIGINT NOT NULL
);
ALTER TABLE
    `Album` ADD PRIMARY KEY `album_id_primary`(`id`);
CREATE TABLE `Tag`(
    `id` CHAR(36) NOT NULL,
    `title` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Tag` ADD PRIMARY KEY `tag_id_primary`(`id`);
CREATE TABLE `Tag Photo`(
    `tagID` CHAR(36) NOT NULL,
    `photoID` CHAR(36) NOT NULL
);
ALTER TABLE
    `Tag Photo` ADD PRIMARY KEY `tag photo_tagid_primary`(`tagID`);
CREATE TABLE `Location`(
    `id` CHAR(36) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `shortname` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Location` ADD PRIMARY KEY `location_id_primary`(`id`);
CREATE TABLE `Following`(
    `id` CHAR(36) NOT NULL,
    `userID` CHAR(36) NOT NULL,
    `followerID` BIGINT NOT NULL
);
ALTER TABLE
    `Following` ADD PRIMARY KEY `following_id_primary`(`id`);
ALTER TABLE
    `Tag Photo` ADD CONSTRAINT `tag photo_tagid_foreign` FOREIGN KEY(`tagID`) REFERENCES `Photo`(`id`);
ALTER TABLE
    `User` ADD CONSTRAINT `user_id_foreign` FOREIGN KEY(`id`) REFERENCES `Photo`(`id`);
ALTER TABLE
    `Tag` ADD CONSTRAINT `tag_id_foreign` FOREIGN KEY(`id`) REFERENCES `Tag Photo`(`tagID`);
ALTER TABLE
    `Photo` ADD CONSTRAINT `photo_title_foreign` FOREIGN KEY(`title`) REFERENCES `Album`(`id`);
ALTER TABLE
    `Location` ADD CONSTRAINT `location_id_foreign` FOREIGN KEY(`id`) REFERENCES `Photo`(`id`);
ALTER TABLE
    `Photo` ADD CONSTRAINT `photo_id_foreign` FOREIGN KEY(`id`) REFERENCES `User`(`id`);
ALTER TABLE
    `Following` ADD CONSTRAINT `following_id_foreign` FOREIGN KEY(`id`) REFERENCES `User`(`id`);
ALTER TABLE
    `Comment` ADD CONSTRAINT `comment_id_foreign` FOREIGN KEY(`id`) REFERENCES `Photo`(`id`);