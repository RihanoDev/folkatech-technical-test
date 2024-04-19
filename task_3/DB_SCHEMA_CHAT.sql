CREATE DATABASE IF NOT EXISTS basic_message;

CREATE TABLE Users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    phoneNumber VARCHAR(20) NOT NULL UNIQUE,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Personal_Message (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_sender INT,
    id_receiver INT,
    body TEXT,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    read_at TIMESTAMP,
    status ENUM('Sent', 'Read', 'Pending'),
    messageType ENUM('Text', 'Image', 'File'),
    FOREIGN KEY (id_sender) REFERENCES Users(id),
    FOREIGN KEY (id_receiver) REFERENCES Users(id)
);

CREATE TABLE Groups (
    id INT PRIMARY KEY AUTO_INCREMENT,
    group_name VARCHAR(100),
    id_admin INT, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_admin) REFERENCES Users(id)
);

CREATE TABLE Group_Members (
    id_group INT,
    id_user INT,
    role ENUM('Admin', 'Member')
    PRIMARY KEY (id_group, id_user),
    FOREIGN KEY (id_group) REFERENCES Groups(id),
    FOREIGN KEY (id_user) REFERENCES Users(id)
);

CREATE TABLE Group_Messages (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_group INT,
    id_sender INT NOT NULL,
    body TEXT,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Sent', 'Read', 'Pending'),
    messageType ENUM('Text', 'Image', 'File'),
    FOREIGN KEY (id_group) REFERENCES Groups(id),
    FOREIGN KEY (id_sender) REFERENCES Users(id)
);

/*
    Dalam schema ini saya menggunakan database sql karena sebelumnya
    saya cukup memahami sql daripada nosql, kemudian sql dapat digunakan
    sebagai penggunaan basic messaging chat karena memiliki primary key dan
    foreign key yang berguna untuk mengetahui hubungan antara entitas yang ada
    pada database tersebut.
*/