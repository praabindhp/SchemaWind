CREATE TABLE `Saved Post`(
    `postId` INT NULL,
    `userId` INT NULL
);
ALTER TABLE
    `Saved Post` ADD PRIMARY KEY `saved post_postid_userid_primary`(`postId`, `userId`);
ALTER TABLE
    `Saved Post` ADD UNIQUE `saved post_postid_unique`(`postId`);
ALTER TABLE
    `Saved Post` ADD UNIQUE `saved post_userid_unique`(`userId`);
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
CREATE TABLE `Hash Tag`(
    `hashTagId` INT NULL,
    `postId` INT NULL,
    `content` VARCHAR(255) NULL
);
CREATE TABLE `Profile`(
    `userId` INT NULL,
    `photourl` VARCHAR(255) NULL,
    `publicType` TINYINT(1) NULL,
    `bio` VARCHAR(255) NULL
);
CREATE TABLE `Post Comment`(
    `id` CHAR(36) NOT NULL,
    `photoID` CHAR(36) NOT NULL,
    `postDate` DATE NOT NULL,
    `content` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Post Comment` ADD PRIMARY KEY `post comment_id_primary`(`id`);
CREATE TABLE `User`(
    `id` CHAR(36) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `phoneNumber` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `User` ADD PRIMARY KEY `user_id_primary`(`id`);
CREATE TABLE `User Comments`(
    `usersId` INT NULL,
    `postId` INT NULL,
    `commentId` INT NULL,
    `replyId` INT NULL,
    `likes` INT NULL AUTO_INCREMENT,
    `time` TIMESTAMP NULL
);
CREATE TABLE `Post`(
    `postId` INT NULL AUTO_INCREMENT,
    `userId` INT NOT NULL,
    `urlLink` VARCHAR(255) NULL,
    `caption` VARCHAR(255) NULL,
    `music` VARCHAR(255) NULL,
    `likes` INT NULL,
    `commentId` INT NULL,
    `hashTagId` INT NULL,
    `tags` VARCHAR(255) NULL,
    `saved` TINYINT(1) NULL,
    `time` TIMESTAMP NULL
);
ALTER TABLE
    `Post` ADD PRIMARY KEY `post_postid_primary`(`postId`);
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
CREATE TABLE `Likes`(
    `postId` INT NOT NULL,
    `likedId` INT NULL
);
ALTER TABLE
    `Likes` ADD UNIQUE `likes_postid_unique`(`postId`);
ALTER TABLE
    `Likes` ADD UNIQUE `likes_likedid_unique`(`likedId`);
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
    `Hash Tag` ADD CONSTRAINT `hash tag_postid_foreign` FOREIGN KEY(`postId`) REFERENCES `Photo`(`id`);
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
    `Hash Tag` ADD CONSTRAINT `hash tag_postid_foreign` FOREIGN KEY(`postId`) REFERENCES `Saved Post`(`postId`);
ALTER TABLE
    `User Comments` ADD CONSTRAINT `user comments_usersid_foreign` FOREIGN KEY(`usersId`) REFERENCES `User`(`id`);
ALTER TABLE
    `Saved Post` ADD CONSTRAINT `saved post_postid_foreign` FOREIGN KEY(`postId`) REFERENCES `Post`(`postId`);
ALTER TABLE
    `Saved Post` ADD CONSTRAINT `saved post_userid_foreign` FOREIGN KEY(`userId`) REFERENCES `User`(`id`);
ALTER TABLE
    `Profile` ADD CONSTRAINT `profile_userid_foreign` FOREIGN KEY(`userId`) REFERENCES `User`(`id`);
ALTER TABLE
    `Post` ADD CONSTRAINT `post_userid_foreign` FOREIGN KEY(`userId`) REFERENCES `User`(`id`);
ALTER TABLE
    `Likes` ADD CONSTRAINT `likes_postid_foreign` FOREIGN KEY(`postId`) REFERENCES `Post`(`postId`);
ALTER TABLE
    `Following` ADD CONSTRAINT `following_id_foreign` FOREIGN KEY(`id`) REFERENCES `User`(`id`);
ALTER TABLE
    `Hash Tag` ADD CONSTRAINT `hash tag_postid_foreign` FOREIGN KEY(`postId`) REFERENCES `Photo`(`id`);
ALTER TABLE
    `Post Comment` ADD CONSTRAINT `post comment_id_foreign` FOREIGN KEY(`id`) REFERENCES `Photo`(`id`);
ALTER TABLE
    `Post Comment` ADD CONSTRAINT `post comment_photoid_foreign` FOREIGN KEY(`photoID`) REFERENCES `Photo`(`id`);