CREATE TABLE `Android Metadata`(
    `locale` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT
);
ALTER TABLE
    `Android Metadata` ADD PRIMARY KEY `android metadata_locale_primary`(`locale`);
CREATE TABLE `Messages`(
    `id` CHAR(36) NOT NULL,
    `keyRemoteJID` CHAR(36) NOT NULL,
    `keyFromMe` VARCHAR(255) NOT NULL,
    `keyID` CHAR(36) NOT NULL,
    `status` VARCHAR(255) NOT NULL,
    `needsPush` TINYINT(1) NOT NULL,
    `data` VARCHAR(255) NOT NULL,
    `timestamp` TIMESTAMP NOT NULL,
    `mediaURL` VARCHAR(255) NOT NULL,
    `mediaMimeType` VARCHAR(255) NOT NULL,
    `mediaWAType` VARCHAR(255) NOT NULL,
    `mediaSize` BIGINT NOT NULL,
    `mediaName` VARCHAR(255) NOT NULL,
    `latitude` VARCHAR(255) NOT NULL,
    `longitude` VARCHAR(255) NOT NULL,
    `thumbImage` BLOB NOT NULL,
    `remoteResource` VARCHAR(255) NOT NULL,
    `recievedTimestamp` TIMESTAMP NOT NULL,
    `sendTimestamp` TIMESTAMP NOT NULL,
    `receiptServer` TIMESTAMP NOT NULL,
    `receiptDevice` TIMESTAMP NOT NULL
);
ALTER TABLE
    `Messages` ADD PRIMARY KEY `messages_id_primary`(`id`);
CREATE TABLE `SQLite Sequence`(
    `name` VARCHAR(255) NOT NULL,
    `sequence` BIGINT NOT NULL
);
ALTER TABLE
    `SQLite Sequence` ADD PRIMARY KEY `sqlite sequence_name_primary`(`name`);
CREATE TABLE `chatList`(
    `id` CHAR(36) NOT NULL,
    `keyRemoteID` CHAR(36) NOT NULL,
    `messageTableID` CHAR(36) NOT NULL
);
ALTER TABLE
    `chatList` ADD PRIMARY KEY `chatlist_id_primary`(`id`);
CREATE TABLE `WA Contacts`(
    `id` CHAR(36) NOT NULL,
    `jid` CHAR(36) NOT NULL,
    `isWhatsappUser` TINYINT(1) NOT NULL,
    `isIphone` TINYINT(1) NOT NULL,
    `status` BLOB NOT NULL,
    `number` BIGINT NOT NULL,
    `rawContactID` CHAR(36) NOT NULL,
    `displayName` VARCHAR(255) NOT NULL,
    `phoneType` VARCHAR(255) NOT NULL,
    `phoneLabel` VARCHAR(255) NOT NULL,
    `unseenMessageCount` INT NOT NULL,
    `photoTs` BLOB NOT NULL
);
ALTER TABLE
    `WA Contacts` ADD PRIMARY KEY `wa contacts_id_primary`(`id`);
ALTER TABLE
    `Messages` ADD CONSTRAINT `messages_id_foreign` FOREIGN KEY(`id`) REFERENCES `SQLite Sequence`(`name`);
ALTER TABLE
    `chatList` ADD CONSTRAINT `chatlist_id_foreign` FOREIGN KEY(`id`) REFERENCES `Messages`(`id`);
ALTER TABLE
    `WA Contacts` ADD CONSTRAINT `wa contacts_id_foreign` FOREIGN KEY(`id`) REFERENCES `SQLite Sequence`(`name`);
ALTER TABLE
    `WA Contacts` ADD CONSTRAINT `wa contacts_id_foreign` FOREIGN KEY(`id`) REFERENCES `Android Metadata`(`locale`);