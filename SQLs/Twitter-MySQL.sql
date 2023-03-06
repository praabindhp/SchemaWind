CREATE TABLE `Users`(
    `id` BIGINT NOT NULL,
    `name` VARCHAR(255) NULL,
    `email` VARCHAR(255) NULL,
    `password_digest` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `remember_token` VARCHAR(255) NULL,
    `slug` VARCHAR(255) NULL
);
ALTER TABLE
    `Users` ADD PRIMARY KEY `users_id_primary`(`id`);
ALTER TABLE
    `Users` ADD UNIQUE `users_email_unique`(`email`);
ALTER TABLE
    `Users` ADD INDEX `users_remember_token_index`(`remember_token`);
ALTER TABLE
    `Users` ADD UNIQUE `users_slug_unique`(`slug`);
CREATE TABLE `Liked By`(
    `tweet_id` INT NULL,
    `user_id` INT NULL
);
CREATE TABLE `Draft Scheduled Tweets`(
    `userid` INT NULL,
    `draft_tweet_id` INT NULL,
    `scheduled_tweet_id` INT NULL
);
CREATE TABLE `Posts`(
    `tweet_id` INT NULL AUTO_INCREMENT,
    `tweet_user_id` INT NULL,
    `tweet_content` VARCHAR(255) NULL,
    `like` INT NULL AUTO_INCREMENT,
    `retweet` INT NULL AUTO_INCREMENT,
    `reply` INT NULL AUTO_INCREMENT,
    `views` INT NULL AUTO_INCREMENT,
    `createdAt` TIMESTAMP NULL
);
ALTER TABLE
    `Posts` ADD PRIMARY KEY `posts_tweet_user_id_primary`(`tweet_user_id`);
CREATE TABLE `Languages`(
    `lang_id` INT NULL,
    `lang_name` VARCHAR(255) NULL
);
CREATE TABLE `Trending`(
    `Tweets_id` INT NULL,
    `Tweet_hashtag` VARCHAR(255) NULL
);
CREATE TABLE `Twittercircle`(
    `count` INT NULL AUTO_INCREMENT,
    `user_id` INT NULL,
    `friend_id` INT NULL
);
CREATE TABLE `Replies`(
    `reply_count` INT NULL AUTO_INCREMENT,
    `tweet_id` INT NULL,
    `user_id` INT NULL,
    `reply_content` VARCHAR(255) NULL,
    `mention_id` INT NULL,
    `like` INT NULL AUTO_INCREMENT,
    `retweet` INT NULL AUTO_INCREMENT,
    `reply` INT NULL AUTO_INCREMENT,
    `views` INT NULL AUTO_INCREMENT,
    `createdAt` TIMESTAMP NULL
);
CREATE TABLE `User Languages`(
    `id` INT NULL,
    `language` VARCHAR(255) NULL
);
CREATE TABLE `Tweets`(
    `id` BIGINT NOT NULL,
    `content` VARCHAR(255) NULL,
    `user_id` INT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL
);
ALTER TABLE
    `Tweets` ADD INDEX `tweets_user_id_created_at_index`(`user_id`, `created_at`);
ALTER TABLE
    `Tweets` ADD PRIMARY KEY `tweets_id_primary`(`id`);
CREATE TABLE `UserAccount`(
    `id` INT NULL AUTO_INCREMENT,
    `Name` VARCHAR(255) NULL,
    `username` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NULL,
    `BirthDate` DATE NULL,
    `Birthmonth` INT NULL,
    `Birthyear` INT NULL,
    `category` VARCHAR(255) NULL,
    `phonenumber` INT NOT NULL,
    `profilepicture_url` VARCHAR(255) NULL,
    `bio` VARCHAR(255) NULL,
    `website` VARCHAR(255) NULL,
    `Location` VARCHAR(255) NULL,
    `verified` TINYINT(1) NULL,
    `createdAt` TIMESTAMP NULL,
    `two_auth` TINYINT(1) NULL
);
ALTER TABLE
    `UserAccount` ADD PRIMARY KEY `useraccount_id_primary`(`id`);
ALTER TABLE
    `UserAccount` ADD UNIQUE `useraccount_username_unique`(`username`);
ALTER TABLE
    `UserAccount` ADD UNIQUE `useraccount_email_unique`(`email`);
ALTER TABLE
    `UserAccount` ADD UNIQUE `useraccount_phonenumber_unique`(`phonenumber`);
CREATE TABLE `Relationships`(
    `id` BIGINT NOT NULL,
    `follower_id` INT NULL,
    `followed_id` INT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL
);
ALTER TABLE
    `Relationships` ADD UNIQUE `relationships_follower_id_followed_id_unique`(`follower_id`, `followed_id`);
ALTER TABLE
    `Relationships` ADD PRIMARY KEY `relationships_id_primary`(`id`);
ALTER TABLE
    `Relationships` ADD INDEX `relationships_follower_id_index`(`follower_id`);
ALTER TABLE
    `Relationships` ADD INDEX `relationships_followed_id_index`(`followed_id`);
CREATE TABLE `Quote Tweet`(
    `tweet_id` INT NULL,
    `user_id` INT NULL
);
CREATE TABLE `Login Activity`(
    `login_count` INT NULL AUTO_INCREMENT,
    `user_id` INT NULL,
    `login_time` TIMESTAMP NULL
);
CREATE TABLE `Retweet`(
    `tweet_id` INT NULL,
    `user_id` INT NULL
);
ALTER TABLE
    `Posts` ADD CONSTRAINT `posts_tweet_id_foreign` FOREIGN KEY(`tweet_id`) REFERENCES `UserAccount`(`id`);
ALTER TABLE
    `Liked By` ADD CONSTRAINT `liked by_tweet_id_foreign` FOREIGN KEY(`tweet_id`) REFERENCES `Tweets`(`id`);
ALTER TABLE
    `Draft Scheduled Tweets` ADD CONSTRAINT `draft scheduled tweets_userid_foreign` FOREIGN KEY(`userid`) REFERENCES `Replies`(`reply_count`);
ALTER TABLE
    `Tweets` ADD CONSTRAINT `tweets_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`);
ALTER TABLE
    `User Languages` ADD CONSTRAINT `user languages_id_foreign` FOREIGN KEY(`id`) REFERENCES `Languages`(`lang_id`);
ALTER TABLE
    `Users` ADD CONSTRAINT `users_id_foreign` FOREIGN KEY(`id`) REFERENCES `UserAccount`(`id`);
ALTER TABLE
    `Relationships` ADD CONSTRAINT `relationships_follower_id_foreign` FOREIGN KEY(`follower_id`) REFERENCES `Users`(`id`);
ALTER TABLE
    `Retweet` ADD CONSTRAINT `retweet_tweet_id_foreign` FOREIGN KEY(`tweet_id`) REFERENCES `Tweets`(`id`);
ALTER TABLE
    `Languages` ADD CONSTRAINT `languages_lang_id_foreign` FOREIGN KEY(`lang_id`) REFERENCES `UserAccount`(`id`);
ALTER TABLE
    `Relationships` ADD CONSTRAINT `relationships_followed_id_foreign` FOREIGN KEY(`followed_id`) REFERENCES `Users`(`id`);
ALTER TABLE
    `Draft Scheduled Tweets` ADD CONSTRAINT `draft scheduled tweets_userid_foreign` FOREIGN KEY(`userid`) REFERENCES `Tweets`(`id`);
ALTER TABLE
    `Liked By` ADD CONSTRAINT `liked by_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `UserAccount`(`id`);
ALTER TABLE
    `Login Activity` ADD CONSTRAINT `login activity_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`);
ALTER TABLE
    `Retweet` ADD CONSTRAINT `retweet_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `UserAccount`(`id`);
ALTER TABLE
    `Twittercircle` ADD CONSTRAINT `twittercircle_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `UserAccount`(`id`);
ALTER TABLE
    `Trending` ADD CONSTRAINT `trending_tweets_id_foreign` FOREIGN KEY(`Tweets_id`) REFERENCES `Tweets`(`id`);
ALTER TABLE
    `User Languages` ADD CONSTRAINT `user languages_id_foreign` FOREIGN KEY(`id`) REFERENCES `UserAccount`(`id`);
ALTER TABLE
    `Quote Tweet` ADD CONSTRAINT `quote tweet_tweet_id_foreign` FOREIGN KEY(`tweet_id`) REFERENCES `UserAccount`(`id`);
ALTER TABLE
    `Tweets` ADD CONSTRAINT `tweets_id_foreign` FOREIGN KEY(`id`) REFERENCES `UserAccount`(`id`);