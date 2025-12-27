
CREATE DATABASE IF NOT EXISTS quiz_app;
USE quiz_app;


CREATE TABLE IF NOT EXISTS questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question VARCHAR(255) NOT NULL,
    option1 VARCHAR(100) NOT NULL,
    option2 VARCHAR(100) NOT NULL,
    option3 VARCHAR(100) NOT NULL,
    option4 VARCHAR(100) NOT NULL,
    correct_answer VARCHAR(100) NOT NULL
);


CREATE TABLE IF NOT EXISTS results (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    score INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO questions (question, option1, option2, option3, option4, correct_answer) VALUES
('What does HTML stand for?', 
 'Hyper Text Markup Language', 
 'High Text Machine Language', 
 'Hyperlinks and Text Markup Language', 
 'Home Tool Markup Language', 
 'Hyper Text Markup Language'),

('Which language is used for styling web pages?', 
 'HTML', 
 'JQuery', 
 'CSS', 
 'XML', 
 'CSS'),

('Which is a server-side scripting language?', 
 'JavaScript', 
 'Python', 
 'PHP', 
 'HTML', 
 'PHP'),

('Which database is used with PHP in XAMPP?', 
 'Oracle', 
 'PostgreSQL', 
 'MySQL', 
 'MongoDB', 
 'MySQL');
