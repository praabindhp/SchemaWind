CREATE TABLE `users`(
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
    `users` ADD PRIMARY KEY `users_id_primary`(`id`);
ALTER TABLE
    `users` ADD UNIQUE `users_email_unique`(`email`);
ALTER TABLE
    `users` ADD INDEX `users_remember_token_index`(`remember_token`);
ALTER TABLE
    `users` ADD UNIQUE `users_slug_unique`(`slug`);
CREATE TABLE `tweets`(
    `id` BIGINT NOT NULL,
    `content` VARCHAR(255) NULL,
    `user_id` INT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL
);
ALTER TABLE
    `tweets` ADD INDEX `tweets_user_id_created_at_index`(`user_id`, `created_at`);
ALTER TABLE
    `tweets` ADD PRIMARY KEY `tweets_id_primary`(`id`);
CREATE TABLE `relationships`(
    `id` BIGINT NOT NULL,
    `follower_id` INT NULL,
    `followed_id` INT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL
);
ALTER TABLE
    `relationships` ADD UNIQUE `relationships_follower_id_followed_id_unique`(`follower_id`, `followed_id`);
ALTER TABLE
    `relationships` ADD PRIMARY KEY `relationships_id_primary`(`id`);
ALTER TABLE
    `relationships` ADD INDEX `relationships_follower_id_index`(`follower_id`);
ALTER TABLE
    `relationships` ADD INDEX `relationships_followed_id_index`(`followed_id`);
ALTER TABLE
    `tweets` ADD CONSTRAINT `tweets_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `relationships` ADD CONSTRAINT `relationships_follower_id_foreign` FOREIGN KEY(`follower_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `relationships` ADD CONSTRAINT `relationships_followed_id_foreign` FOREIGN KEY(`followed_id`) REFERENCES `users`(`id`);