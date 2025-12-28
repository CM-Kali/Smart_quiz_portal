-- =========================
-- Database: quiz_app
-- =========================

CREATE DATABASE IF NOT EXISTS quiz_app;
USE quiz_app;

-- =========================
-- QUESTIONS TABLE
-- =========================
CREATE TABLE IF NOT EXISTS questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question TEXT NOT NULL,
    option1 VARCHAR(150) NOT NULL,
    option2 VARCHAR(150) NOT NULL,
    option3 VARCHAR(150) NOT NULL,
    option4 VARCHAR(150) NOT NULL,
    correct_answer VARCHAR(150) NOT NULL,
    subject VARCHAR(100) NOT NULL,
    level ENUM('Easy','Intermediate','Pro') NOT NULL
);

-- =========================
-- RESULTS TABLE
-- =========================
CREATE TABLE IF NOT EXISTS results (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    subject VARCHAR(100) NOT NULL,
    level ENUM('Easy','Intermediate','Pro') NOT NULL,
    total_questions INT NOT NULL,
    correct_answers INT NOT NULL,
    score INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- SAMPLE QUESTIONS (5 Subjects × 3 Levels × 5 Questions)
-- =========================

INSERT INTO questions (question, option1, option2, option3, option4, correct_answer, subject, level)
VALUES
-- Web Development - Easy
('HTML stands for?', 'Hyper Text Markup Language', 'High Text Machine Language', 'Hyperlinks Text Markup', 'Home Tool Markup', 'Hyper Text Markup Language', 'Web Development', 'Easy'),
('Which tag is used for a line break?', '<br>', '<break>', '<lb>', '<newline>', '<br>', 'Web Development', 'Easy'),
('Which attribute links a CSS file?', 'href', 'src', 'link', 'rel', 'href', 'Web Development', 'Easy'),
('What tag is used for bold text?', '<b>', '<strong>', '<bold>', '<bt>', '<b>', 'Web Development', 'Easy'),
('What is the default display of <div>?', 'Block', 'Inline', 'None', 'Flex', 'Block', 'Web Development', 'Easy'),

-- Web Development - Intermediate
('CSS stands for?', 'Cascading Style Sheets', 'Computer Style Sheets', 'Creative Style Sheets', 'Colorful Style Sheets', 'Cascading Style Sheets', 'Web Development', 'Intermediate'),
('Which property changes text color?', 'font-color', 'text-color', 'color', 'font-style', 'color', 'Web Development', 'Intermediate'),
('Which HTML element is for the largest heading?', '<h1>', '<head>', '<heading>', '<h6>', '<h1>', 'Web Development', 'Intermediate'),
('Which tag is used for hyperlinks?', '<a>', '<link>', '<hyper>', '<url>', '<a>', 'Web Development', 'Intermediate'),
('Which CSS property sets background color?', 'background', 'color', 'bgcolor', 'backcolor', 'background', 'Web Development', 'Intermediate'),

-- Web Development - Pro
('Select element with id "demo" in CSS?', '#demo {}', '.demo {}', 'demo {}', '*demo {}', '#demo {}', 'Web Development', 'Pro'),
('Semantic HTML5 element?', '<section>', '<div>', '<span>', '<b>', '<section>', 'Web Development', 'Pro'),
('HTML5 element for navigation links?', '<nav>', '<navigation>', '<menu>', '<header>', '<nav>', 'Web Development', 'Pro'),
('CSS flex container property?', 'display:flex', 'display:block', 'display:inline', 'display:grid', 'display:flex', 'Web Development', 'Pro'),
('Responsive design framework example?', 'Bootstrap', 'jQuery', 'NodeJS', 'PHP', 'Bootstrap', 'Web Development', 'Pro'),

-- App Development - Easy
('Flutter is developed by?', 'Apple', 'Google', 'Microsoft', 'Facebook', 'Google', 'App Development', 'Easy'),
('Language used for Flutter apps?', 'Java', 'Kotlin', 'Dart', 'Swift', 'Dart', 'App Development', 'Easy'),
('Widget to display text?', 'Text', 'Label', 'Paragraph', 'String', 'Text', 'App Development', 'Easy'),
('Flutter is for?', 'Web only', 'Mobile only', 'Mobile & Web', 'Desktop only', 'Mobile & Web', 'App Development', 'Easy'),
('Hot reload helps?', 'Restart app', 'Rebuild UI instantly', 'Clear cache', 'Update theme', 'Rebuild UI instantly', 'App Development', 'Easy'),

-- App Development - Intermediate
('Widget that scrolls?', 'ListView', 'Column', 'Row', 'Container', 'ListView', 'App Development', 'Intermediate'),
('Method that builds UI in StatefulWidget?', 'createState()', 'build()', 'initState()', 'setState()', 'build()', 'App Development', 'Intermediate'),
('Hot reload does?', 'Rebuilds app', 'Restarts app fully', 'Clears cache', 'Updates theme', 'Rebuilds app', 'App Development', 'Intermediate'),
('Widget for layouts?', 'Container', 'Row', 'Column', 'Stack', 'Column', 'App Development', 'Intermediate'),
('Recommended state management in large apps?', 'GetX', 'setState', 'InheritedWidget', 'Bloc', 'GetX', 'App Development', 'Intermediate'),

-- App Development - Pro
('State management for complex apps?', 'GetX', 'setState', 'InheritedWidget', 'Bloc', 'GetX', 'App Development', 'Pro'),
('Widget used for layouts?', 'Container', 'Row', 'Column', 'Stack', 'Column', 'App Development', 'Pro'),
('Function called to update UI after state change?', 'setState()', 'updateUI()', 'refresh()', 'rebuild()', 'setState()', 'App Development', 'Pro'),
('Best practice for large Flutter app?', 'MVVM', 'MVC', 'Singleton', 'Provider', 'MVVM', 'App Development', 'Pro'),
('Flutter widget tree starts from?', 'MaterialApp', 'Scaffold', 'Container', 'Column', 'MaterialApp', 'App Development', 'Pro'),

-- Artificial Intelligence - Easy
('AI stands for?', 'Artificial Intelligence', 'Automated Interface', 'Advanced Internet', 'Applied Intelligence', 'Artificial Intelligence', 'Artificial Intelligence', 'Easy'),
('Which is an AI technique?', 'Machine Learning', 'HTML', 'CSS', 'SQL', 'Machine Learning', 'Artificial Intelligence', 'Easy'),
('What does NLP stand for?', 'Natural Language Processing', 'Near Language Processing', 'Neural Language Programming', 'Natural Learning Processing', 'Natural Language Processing', 'Artificial Intelligence', 'Easy'),
('AI can simulate?', 'Human intelligence', 'Database management', 'CSS styles', 'HTML tags', 'Human intelligence', 'Artificial Intelligence', 'Easy'),
('Which AI type is for pattern recognition?', 'Machine Learning', 'Deep Learning', 'Natural Language Processing', 'Expert System', 'Machine Learning', 'Artificial Intelligence', 'Easy'),

-- Artificial Intelligence - Intermediate
('Which algorithm is used in supervised learning?', 'KNN', 'K-Means', 'Apriori', 'DBSCAN', 'KNN', 'Artificial Intelligence', 'Intermediate'),
('What is a neural network?', 'A network of neurons', 'A database', 'A protocol', 'A type of server', 'A network of neurons', 'Artificial Intelligence', 'Intermediate'),
('Which technique is used for clustering?', 'K-Means', 'Linear Regression', 'Naive Bayes', 'Decision Tree', 'K-Means', 'Artificial Intelligence', 'Intermediate'),
('Which AI type is for prediction?', 'Machine Learning', 'Expert System', 'Deep Learning', 'NLP', 'Machine Learning', 'Artificial Intelligence', 'Intermediate'),
('Which technique uses reward/punishment?', 'Reinforcement Learning', 'Supervised Learning', 'Unsupervised Learning', 'Genetic Algorithm', 'Reinforcement Learning', 'Artificial Intelligence', 'Intermediate'),

-- Artificial Intelligence - Pro
('Which AI algorithm is used for deep learning?', 'Neural Network', 'Decision Tree', 'KNN', 'Random Forest', 'Neural Network', 'Artificial Intelligence', 'Pro'),
('What is reinforcement learning?', 'Learning from feedback', 'Supervised labeling', 'Clustering', 'Data mining', 'Learning from feedback', 'Artificial Intelligence', 'Pro'),
('Which AI model is generative?', 'GPT', 'SVM', 'Decision Tree', 'KNN', 'GPT', 'Artificial Intelligence', 'Pro'),
('Which AI technique handles sequential data?', 'RNN', 'CNN', 'GAN', 'SVM', 'RNN', 'Artificial Intelligence', 'Pro'),
('Which AI framework is developed by Google?', 'TensorFlow', 'PyTorch', 'Keras', 'Scikit-Learn', 'TensorFlow', 'Artificial Intelligence', 'Pro'),

-- Databases - Easy
('Which database is used in XAMPP?', 'Oracle', 'MongoDB', 'MySQL', 'PostgreSQL', 'MySQL', 'Databases', 'Easy'),
('What does SQL stand for?', 'Structured Query Language', 'Simple Query Language', 'Sequential Query Language', 'Standard Question Language', 'Structured Query Language', 'Databases', 'Easy'),
('Which command gets all records from a table?', 'SELECT *', 'GET *', 'SHOW ALL', 'READ ALL', 'SELECT *', 'Databases', 'Easy'),
('Primary language to query DB?', 'SQL', 'Python', 'PHP', 'HTML', 'SQL', 'Databases', 'Easy'),
('Which type of DB is MySQL?', 'Relational', 'NoSQL', 'Graph', 'Key-Value', 'Relational', 'Databases', 'Easy'),

-- Databases - Intermediate
('Which key uniquely identifies a record?', 'Primary Key', 'Foreign Key', 'Index', 'Unique Key', 'Primary Key', 'Databases', 'Intermediate'),
('Which command deletes a table?', 'DROP TABLE', 'DELETE TABLE', 'TRUNCATE TABLE', 'REMOVE TABLE', 'DROP TABLE', 'Databases', 'Intermediate'),
('Which command adds a new column?', 'ALTER TABLE', 'MODIFY TABLE', 'UPDATE TABLE', 'CHANGE TABLE', 'ALTER TABLE', 'Databases', 'Intermediate'),
('Which command removes a record?', 'DELETE FROM', 'DROP FROM', 'REMOVE FROM', 'CLEAR FROM', 'DELETE FROM', 'Databases', 'Intermediate'),
('Which key enforces referential integrity?', 'Foreign Key', 'Primary Key', 'Unique Key', 'Candidate Key', 'Foreign Key', 'Databases', 'Intermediate'),

-- Databases - Pro
('Which SQL command joins two tables?', 'SELECT JOIN', 'INNER JOIN', 'LEFT JOIN', 'RIGHT JOIN', 'INNER JOIN', 'Databases', 'Pro'),
('Command to create index?', 'CREATE INDEX', 'CREATE UNIQUE', 'ADD INDEX', 'CREATE TABLE', 'CREATE INDEX', 'Databases', 'Pro'),
('Which normalization form eliminates redundant data?', '3NF', '2NF', '1NF', 'BCNF', '3NF', 'Databases', 'Pro'),
('Transaction type that cannot be rolled back?', 'Autocommit', 'Manual', 'Savepoint', 'Commit', 'Autocommit', 'Databases', 'Pro'),
('Which SQL clause filters records?', 'WHERE', 'FILTER', 'HAVING', 'SELECT', 'WHERE', 'Databases', 'Pro'),

-- Computer Networks - Easy
('Which device connects networks?', 'Switch', 'Router', 'Hub', 'Repeater', 'Router', 'Computer Networks', 'Easy'),
('What does LAN stand for?', 'Local Area Network', 'Large Area Network', 'Long Access Node', 'Logical Area Network', 'Local Area Network', 'Computer Networks', 'Easy'),
('Which protocol is used to send emails?', 'SMTP', 'FTP', 'HTTP', 'POP3', 'SMTP', 'Computer Networks', 'Easy'),
('Which device is used for wireless networks?', 'Router', 'Access Point', 'Hub', 'Switch', 'Access Point', 'Computer Networks', 'Easy'),
('Which IP version is most widely used?', 'IPv4', 'IPv5', 'IPv6', 'IPv7', 'IPv4', 'Computer Networks', 'Easy'),

-- Computer Networks - Intermediate
('Which protocol is used for secure HTTP?', 'SSL', 'TCP', 'HTTPS', 'UDP', 'HTTPS', 'Computer Networks', 'Intermediate'),
('Which device routes packets?', 'Router', 'Switch', 'Hub', 'Bridge', 'Router', 'Computer Networks', 'Intermediate'),
('Which layer does TCP operate?', 'Transport Layer', 'Network Layer', 'Data Link Layer', 'Physical Layer', 'Transport Layer', 'Computer Networks', 'Intermediate'),
('Which topology has no central node?', 'Mesh', 'Star', 'Bus', 'Ring', 'Mesh', 'Computer Networks', 'Intermediate'),
('Protocol for transferring files?', 'FTP', 'HTTP', 'SMTP', 'POP3', 'FTP', 'Computer Networks', 'Intermediate'),

-- Computer Networks - Pro
('Network topology with central node?', 'Star', 'Mesh', 'Bus', 'Ring', 'Star', 'Computer Networks', 'Pro'),
('Protocol translating IP to MAC?', 'ARP', 'DNS', 'DHCP', 'ICMP', 'ARP', 'Computer Networks', 'Pro'),
('Network type for long distances?', 'WAN', 'LAN', 'MAN', 'PAN', 'WAN', 'Computer Networks', 'Pro'),
('Routing protocol in large networks?', 'OSPF', 'RIP', 'BGP', 'EIGRP', 'BGP', 'Computer Networks', 'Pro'),
('Which network layer handles routing?', 'Network Layer', 'Transport Layer', 'Data Link Layer', 'Physical Layer', 'Network Layer', 'Computer Networks', 'Pro');
SELECT * FROM results;
INSERT INTO results (username, subject, level, total_questions, correct_answers, score)
VALUES ('Test User', 'Web Development', 'Easy', 5, 4, 80);
