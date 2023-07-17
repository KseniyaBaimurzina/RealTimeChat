export $(grep -v '^#' .env | xargs)

DB_NAME="chat_db"

MYSQL_COMMAND=" 
    CREATE DATABASE IF NOT EXISTS ${DB_NAME}; 
    CREATE USER IF NOT EXISTS '${DB_USERNAME}'@'${DB_HOSTNAME}' IDENTIFIED BY '${DB_PASSWORD}';
    GRANT ALL PRIVILEGES ON * . * TO '${DB_USERNAME}'@'${DB_HOSTNAME}';
    FLUSH PRIVILEGES;
    USE ${DB_NAME};

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
"

mysql -u${DB_ROOT} -p${DB_ROOT_PASSWORD} -e "$MYSQL_COMMAND";