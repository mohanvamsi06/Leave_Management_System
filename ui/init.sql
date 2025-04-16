CREATE DATABASE IF NOT EXISTS sem_project;
USE sem_project;

ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'rootpass';
FLUSH PRIVILEGES;

CREATE TABLE IF NOT EXISTS details (
    id VARCHAR(20) PRIMARY KEY,
    passwd VARCHAR(255) NOT NULL,
    advisor INT NOT NULL DEFAULT 0,
    email VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    advisor_id VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS requests (
    req_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL,
    sub_type VARCHAR(255),
    from_date DATE NOT NULL,
    fslot INT,
    to_date DATE NOT NULL,
    tslot INT,
    description TEXT NOT NULL,
    applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    file MEDIUMBLOB,
    status VARCHAR(255) NOT NULL DEFAULT 'Pending',
    comments TEXT
);

-- Insert 2 sample users
INSERT INTO details (id, passwd, advisor, email, name, advisor_id)
VALUES
('student', 'pass123', 0, 'mohanavamsi991@gmail.com', 'student', 'advisor'),
('advisor', 'pass123', 1, 'mohanavamsi99@gmail.com', 'advisor', NULL);
