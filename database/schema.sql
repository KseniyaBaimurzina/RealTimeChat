CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};

CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'${MYSQL_HOSTNAME}' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';
GRANT ALL PRIVILEGES ON * . * TO '${MYSQL_USER}'@'${MYSQL_HOSTNAME}';
FLUSH PRIVILEGES;

USE ${MYSQL_DATABASE};

CREATE TABLE IF NOT EXISTS Users (
    email VARCHAR(100) NOT NULL UNIQUE,
    username VARCHAR(50) NOT NULL UNIQUE,
    last_activity DATETIME,
    password VARCHAR(100) NOT NULL,
    PRIMARY KEY (username)
);

CREATE TABLE IF NOT EXISTS Dialogues (
    dialogue_id int NOT NULL UNIQUE AUTO_INCREMENT,
    first_user_email VARCHAR(100) NOT NULL,
    second_user_email VARCHAR(50) NOT NULL,
    creation_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (dialogue_id),
    FOREIGN KEY (first_user_email) REFERENCES Users(email),
    FOREIGN KEY (second_user_email) REFERENCES Users(email)
);

CREATE TABLE IF NOT EXISTS Messages (
    message_id int NOT NULL UNIQUE AUTO_INCREMENT,
    dialogue_id int NOT NULL,
    sender_email VARCHAR(100) NOT NULL,
    message_text TEXT NOT NULL,
    is_read TINYINT(1) NOT NULL,
    sending_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (message_id),
    FOREIGN KEY (dialogue_id) REFERENCES Dialogues(dialogue_id) ON DELETE CASCADE,
    FOREIGN KEY (sender_email) REFERENCES Users(email)
);