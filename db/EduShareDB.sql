DROP SCHEMA IF EXISTS `edusharehub` ;
CREATE SCHEMA IF NOT EXISTS `edusharehub` DEFAULT CHARACTER SET latin1 ;
USE `edusharehub` ;

-- User Table
CREATE TABLE IF NOT EXISTS `edusharehub`.`User` (
  UserID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL UNIQUE
);

-- Textbook Table
CREATE TABLE IF NOT EXISTS `edusharehub`.`textbooks` (
  TextbookID INT AUTO_INCREMENT PRIMARY KEY,
  ISBN CHAR(13) NOT NULL,
  Author VARCHAR(255) NOT NULL,
  Title VARCHAR(255) NOT NULL,
  UserID INT NOT NULL,
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Wishlist Table
CREATE TABLE IF NOT EXISTS  `edusharehub`.`Wishlist` (
  WishlistID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  UserID INT NOT NULL,
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Wishlist Item Table
CREATE TABLE IF NOT EXISTS WishlistItem (
  WishlistItemID INT AUTO_INCREMENT PRIMARY KEY,
  WishlistID INT NOT NULL,
  TextbookID INT NOT NULL,
  FOREIGN KEY (WishlistID) REFERENCES Wishlist(WishlistID),
  FOREIGN KEY (TextbookID) REFERENCES textbooks(TextbookID)
);

-- Exchange Offer Table
CREATE TABLE IF NOT EXISTS `edusharehub`.`ExchangeOffer` (
  OfferID INT AUTO_INCREMENT PRIMARY KEY,
  TextbookID INT NOT NULL,
  UserID INT NOT NULL,
  ConditionState VARCHAR(255) NOT NULL,
  Price DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (TextbookID) REFERENCES textbooks(TextbookID),
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Community Table
CREATE TABLE IF NOT EXISTS `edusharehub`.`Community` (
  CommunityID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Description TEXT NOT NULL
);

-- Membership Table
CREATE TABLE IF NOT EXISTS `edusharehub`.`Membership` (
  CommunityID INT,
  UserID INT,
  Role VARCHAR(255) NOT NULL,
  PRIMARY KEY (CommunityID, UserID),
  FOREIGN KEY (CommunityID) REFERENCES Community(CommunityID),
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Sharing Session Table
CREATE TABLE IF NOT EXISTS `edusharehub`.`SharingSession` (
  SessionID INT AUTO_INCREMENT PRIMARY KEY,
  CommunityID INT NOT NULL,
  ResourceID INT,
  Schedule DATETIME NOT NULL,
  FOREIGN KEY (CommunityID) REFERENCES Community(CommunityID),
  FOREIGN KEY (ResourceID) REFERENCES textbooks(TextbookID)
);

-- Digital Resource Table
CREATE TABLE IF NOT EXISTS `edusharehub`.`DigitalResource` (
  ResourceID INT AUTO_INCREMENT PRIMARY KEY,
  UserID INT NOT NULL,
  Title VARCHAR(255) NOT NULL,
  Format VARCHAR(50) NOT NULL,
  AccessURL VARCHAR(255) NOT NULL,
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Recycling Event Table
CREATE TABLE IF NOT EXISTS `edusharehub`.`RecyclingEvent` (
  EventID INT AUTO_INCREMENT PRIMARY KEY,
  Location VARCHAR(255) NOT NULL,
  Date DATE NOT NULL,
  Description TEXT NOT NULL
);

-- Event Participation Table
CREATE TABLE IF NOT EXISTS `edusharehub`.`EventParticipation` (
  UserID INT,
  EventID INT,
  Role VARCHAR(255) NOT NULL,
  PRIMARY KEY (UserID, EventID),
  FOREIGN KEY (UserID) REFERENCES User(UserID),
  FOREIGN KEY (EventID) REFERENCES RecyclingEvent(EventID)
);


INSERT INTO User (Name, Email) VALUES
('Alex Johnson', 'alex.johnson@university.edu'),
('Jordan Lee', 'jordan.lee@university.edu'),
('Taylor Kim', 'taylor.kim@university.edu'),
('Morgan Rivera', 'morgan.rivera@university.edu');


INSERT INTO textbooks (ISBN, Author, Title, UserID) VALUES
('978-0-13-6083', 'Robert Sedgewick', 'Algorithms', 1),
('978-0-07-0324', 'Abraham Silberschatz', 'Database System', 1),
('978-0-13-9038', 'David Curr', 'Physics', 1),
('978-0-32-1558', 'Andrew S. Tanenbaum', 'Computer Networks', 1),
('978-0-26-2033', 'Tom M. Mitchell', 'Machine Learning', 1),
('978-0-59-6005', 'O\'Reilly Media', 'Learning Python', 1),
('978-1-11-8651', 'Robert Sedgewick', 'Algorithms', 1),
('978-0-13-3966', 'Erich Gamma', 'Design Patterns', 1),
('978-0-33-1776', 'Robert L. Boylestad', 'Electronic Devices and Circuit Theory', 1),
('978-0-13-4457', 'Andrew Ng', 'Deep Learning', 1),
('978-1-29-3275', 'Al Sweigart', 'Automate the Boring Stuff with Python', 1),
('978-0-13-1103', 'Richard Stevens', 'Advanced Programming in the UNIX Environment', 1),
('978-0-13-1872', 'Harvey Deitel', 'C++ How to Program', 2),
('978-0-32-1776', 'Robert L. Boylestad', 'Electronic Devices and Circuit Theory', 2),
('978-0-13-4437', 'Andrew Ng', 'Deep Learning', 2),
('978-1-59-3275', 'Al Sweigart', 'Automate the Boring Stuff with Python', 2),
('978-0-13-1103', 'Richard Stevens', 'Advanced Programming in the UNIX Environment', 2),
('978-0-13-1872', 'Harvey Deitel', 'C++ How to Program', 3),
('978-0-32-1774', 'Robert L. Boylestad', 'Electronic Devices and Circuit Theory', 3),
('978-0-13-4457', 'Andrew Ng', 'Deep Learning', 3),
('978-1-59-9570', 'Al Sweigart', 'Automate the Boring Stuff with Python', 3),
('978-0-13-1103', 'Richard Stevens', 'Advanced Programming in the UNIX Environment', 3),
('978-0-13-9038', 'David Curr', 'Physics', 2),
('978-0-32-1558', 'Andrew S. Tanenbaum', 'Computer Networks', 2),
('978-0-26-2033', 'Tom M. Mitchell', 'Machine Learning', 2),
('978-0-59-6005', 'O\'Reilly Media', 'Learning Python', 2),
('978-1-11-8651', 'Robert Sedgewick', 'Algorithms', 2);



INSERT INTO Wishlist (Name, UserID) VALUES
('My Favorite Textbooks', 1),
('Study Materials', 2),
('Data Science', 1),
('Algorithms', 1),
('Operating Systems', 1),
('Computer Graphics', 1),
('Artificial Intelligence', 1),
('Database Management Systems', 1),
('Web Development', 1),
('Software Engineering', 1),
('Networking', 1),
('Cybersecurity', 1),
('Machine Learning', 1),
('Computer Architecture', 1),
('Data Structures', 1),
('Mobile App Development', 1),
('Game Development', 1),
('Embedded Systems', 1),
('Robotics', 1),
('Bioinformatics', 1),
('Cryptography', 1),
('Computer Vision', 1),
('Cloud Computing', 1),
('Natural Language Processing', 1),
('Quantum Computing', 1),
('Big Data Analytics', 1),
('Internet of Things (IoT)', 1);

INSERT INTO WishlistItem (WishlistID, TextbookID) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 8),
(4, 9),
(4, 10),
(5, 11),
(5, 12),
(6, 13),
(6, 14),
(7, 15),
(7, 16),
(8, 17),
(8, 18),
(9, 19),
(9, 20);


INSERT INTO ExchangeOffer (TextbookID, UserID, ConditionState, Price) VALUES
(1, 1, 'Very Good', 20.00),
(2, 1, 'Good', 15.50),
(3, 2, 'Good', 18.75),
(4, 2, 'Fair', 12.00),
(5, 3, 'Very Good', 22.50),
(6, 3, 'Poor', 10.00),
(7, 1, 'Good', 17.00),
(8, 2, 'Very Good', 21.25),
(9, 3, 'Fair', 13.75),
(10, 1, 'Good', 16.50),
(11, 2, 'Good', 18.25),
(12, 3, 'Very Good', 23.75),
(13, 1, 'Fair', 11.50),
(14, 2, 'Good', 17.25),
(15, 3, 'Very Good', 20.50),
(16, 1, 'Good', 19.25),
(17, 2, 'Fair', 14.75),
(18, 3, 'Very Good', 24.00),
(19, 1, 'Good', 16.75),
(20, 2, 'Very Good', 21.50);


INSERT INTO Community (Name, Description) VALUES
('Sustainability Club', 'Focused on promoting sustainability in campus life.'),
('Programming Hub', 'Community for sharing coding resources and knowledge.'),
('Mathematics Enthusiasts', 'A community for students passionate about mathematics.'),
('Science Club', 'A club dedicated to exploring various branches of science.'),
('Literature Lovers', 'A group of students who appreciate and discuss literature.'),
('Programming Wizards', 'A community for coding enthusiasts and aspiring software developers.'),
('Artistic Creations', 'A space for students to share and discuss their creative works.'),
('History Buffs', 'A group of students interested in exploring historical events and topics.'),
('Language Learners', 'A community for students learning new languages.'),
('Business Minds', 'A group focused on discussing and exploring business concepts.'),
('Music Makers', 'A club for musicians and music lovers.'),
('Environmental Activists', 'A community dedicated to promoting environmental awareness and sustainability.'),
('Health and Wellness', 'A group focused on discussing health-related topics and promoting wellness.'),
('Film Fanatics', 'A community for students passionate about cinema and filmmaking.'),
('Photography Club', 'A club for photography enthusiasts to share and critique photos.'),
('Culinary Explorers', 'A group interested in exploring different cuisines and cooking techniques.'),
('Travel Enthusiasts', 'A community for students who love to travel and explore new destinations.'),
('Debate Society', 'A club for students interested in debating and discussing various topics.'),
('Chess Club', 'A community for chess players to meet and play games.'),
('Robotics Team', 'A group dedicated to designing and building robots for competitions.'),
('Fitness Freaks', 'A club focused on promoting physical fitness and healthy lifestyle habits.'),
('Fashion Forward', 'A community for students interested in fashion and style trends.'),
('Book Club', 'A club for avid readers to discuss and recommend books.'),
('Volunteer Network', 'A group dedicated to organizing and participating in volunteer activities.'),
('Film Production', 'A community for students interested in filmmaking and video production.'),
('Data Science Society', 'A club for students interested in data analysis and machine learning.'),
('Gaming Guild', 'A group of gamers who gather to play and discuss video games.'),
('Investment Club', 'A community for students interested in learning about investing and finance.'),
('Sustainability Club', 'A group focused on promoting sustainable practices and initiatives.'),
('Entrepreneurship Society', 'A club for aspiring entrepreneurs to collaborate and share ideas.'),
('Artificial Intelligence Hub', 'A community for students interested in AI and machine learning technologies.');


INSERT INTO Membership (CommunityID, UserID, Role) VALUES
(1, 1, 'Moderator'),
(1, 2, 'Member'),
(1, 3, 'Member'),
(2, 1, 'Member'),
(2, 2, 'Member'),
(3, 2, 'Moderator'),
(3, 3, 'Member'),
(4, 1, 'Member'),
(4, 2, 'Moderator'),
(5, 2, 'Member'),
(5, 3, 'Member'),
(6, 1, 'Member'),
(6, 2, 'Member'),
(7, 2, 'Moderator'),
(8, 1, 'Member'),
(8, 3, 'Member'),
(9, 2, 'Member'),
(10, 1, 'Moderator'),
(11, 1, 'Member'),
(12, 2, 'Member');



INSERT INTO SharingSession (CommunityID, ResourceID, Schedule) VALUES
(1, 1, '2024-04-20 10:00:00'),
(1, 2, '2024-04-21 14:30:00'),
(2, 3, '2024-04-22 09:00:00'),
(2, NULL, '2024-04-23 11:00:00'),
(3, 5, '2024-04-25 13:00:00'),
(3, 6, '2024-04-26 10:30:00'),
(4, NULL, '2024-04-27 12:00:00'),
(5, 9, '2024-04-28 15:00:00'),
(5, 10, '2024-04-29 16:00:00'),
(6, NULL, '2024-04-30 14:00:00'),
(7, 13, '2024-05-01 09:30:00'),
(8, 16, '2024-05-02 11:30:00'),
(8, 17, '2024-05-03 13:30:00'),
(9, 19, '2024-05-04 10:00:00'),
(9, 20, '2024-05-05 12:00:00'),
(10, 22, '2024-05-06 15:30:00'),
(11, NULL, '2024-05-07 11:00:00'),
(12, 25, '2024-05-08 09:00:00'),
(12, 26, '2024-05-09 10:30:00');



INSERT INTO DigitalResource (UserID, Title, Format, AccessURL) VALUES
(1, 'Introduction to Biology', 'PDF', 'https://example.com/biology_intro.pdf'),
(1, 'Chemistry Essentials', 'ePub', 'https://example.com/chemistry_essentials.epub'),
(1, 'Physics Fundamentals', 'PDF', 'https://example.com/physics_fundamentals.pdf'),
(1, 'Calculus Basics', 'PDF', 'https://example.com/calculus_basics.pdf'),
(1, 'Computer Science 101', 'ePub', 'https://example.com/cs101.epub'),
(1, 'Art History Overview', 'PDF', 'https://example.com/art_history.pdf'),
(1, 'Spanish Grammar Guide', 'PDF', 'https://example.com/spanish_grammar.pdf'),
(2, 'Literature Classics', 'ePub', 'https://example.com/literature_classics.epub'),
(2, 'Economics Principles', 'PDF', 'https://example.com/economics_principles.pdf'),
(2, 'Psychology Basics', 'PDF', 'https://example.com/psychology_basics.pdf'),
(2, 'Sociology Introduction', 'PDF', 'https://example.com/sociology_intro.pdf'),
(2, 'History Overview', 'PDF', 'https://example.com/history_overview.pdf'),
(2, 'Environmental Science', 'ePub', 'https://example.com/environmental_science.epub'),
(2, 'Geology Fundamentals', 'PDF', 'https://example.com/geology_fundamentals.pdf'),
(3, 'Statistics Essentials', 'PDF', 'https://example.com/statistics_essentials.pdf'),
(3, 'Music Theory Basics', 'PDF', 'https://example.com/music_theory.pdf'),
(3, 'Political Science Intro', 'ePub', 'https://example.com/political_science_intro.epub'),
(3, 'Anthropology Insights', 'PDF', 'https://example.com/anthropology_insights.pdf'),
(3, 'Philosophy Fundamentals', 'PDF', 'https://example.com/philosophy_fundamentals.pdf'),
(3, 'Engineering Basics', 'ePub', 'https://example.com/engineering_basics.epub'),
(3, 'Marketing Essentials', 'PDF', 'https://example.com/marketing_essentials.pdf'),
(3, 'Finance Principles', 'PDF', 'https://example.com/finance_principles.pdf'),
(3, 'Nutrition Basics', 'PDF', 'https://example.com/nutrition_basics.pdf'),
(3, 'Foreign Language Learning', 'ePub', 'https://example.com/foreign_language.epub');


INSERT INTO RecyclingEvent (Location, Date, Description) VALUES
('Campus Center', '2024-04-22', 'Campus Recycling Drive'),
('Student Center Lobby', '2024-05-01', 'Donate your old textbooks and get discounts on new ones!'),
('Library Entrance', '2024-05-03', 'Exchange your used study materials and help others!'),
('Science Building Atrium', '2024-05-06', 'Join us in our book swap event and reduce waste!'),
('Quad Area', '2024-05-08', 'Recycle your textbooks and receive eco-friendly giveaways!'),
('Art Gallery Hall', '2024-05-10', 'Donate your old books and promote sustainability!'),
('Engineering Lab Building', '2024-05-12', 'Participate in our recycling drive and win prizes!'),
('Cafeteria', '2024-05-15', 'Bring your used textbooks and trade them for ones you need!'),
('Student Union Plaza', '2024-05-18', 'Support our book exchange event and save money!'),
('Business School Lobby', '2024-05-20', 'Recycle your textbooks and earn rewards!'),
('Dormitory Common Room', '2024-05-22', 'Donate your study materials and make a difference!'),
('Gymnasium Entrance', '2024-05-25', 'Join our recycling event and win exciting prizes!'),
('Auditorium Foyer', '2024-05-28', 'Exchange your old textbooks for ones you want!'),
('Health Center Lobby', '2024-05-30', 'Donate your used books and support sustainability!'),
('Music Hall Lobby', '2024-06-02', 'Participate in our book swap and meet new friends!'),
('Theater Lobby', '2024-06-05', 'Recycle your textbooks and contribute to the community!'),
('Student Lounge', '2024-06-08', 'Bring your old textbooks and exchange them for new ones!'),
('Art Studio Lobby', '2024-06-10', 'Support our recycling initiative and get rewards!'),
('Athletic Center Entrance', '2024-06-13', 'Donate your study materials and help the environment!'),
('Computer Lab Lobby', '2024-06-16', 'Join our book exchange event and save money!'),
('Outdoor Amphitheater', '2024-06-19', 'Recycle your textbooks and win exciting prizes!'),
('Student Government Office', '2024-06-22', 'Donate your old books and support sustainability!'),
('Language Lab Lobby', '2024-06-25', 'Participate in our recycling drive and make a difference!'),
('Dance Studio Lobby', '2024-06-28', 'Exchange your old textbooks for ones you want!'),
('Research Center Atrium', '2024-07-01', 'Recycle your textbooks and earn rewards!'),
('Library Study Room', '2024-07-04', 'Donate your study materials and get eco-friendly giveaways!'),
('Mathematics Department Lobby', '2024-07-07', 'Join our book swap event and reduce waste!'),
('History Department Lobby', '2024-07-10', 'Recycle your textbooks and support our initiative!'),
('Physics Department Lobby', '2024-07-13', 'Donate your old books and make a difference!'),
('Chemistry Department Lobby', '2024-07-16', 'Participate in our recycling drive and win prizes!'),
('Biology Department Lobby', '2024-07-19', 'Exchange your old textbooks for ones you need!'),
('Computer Science Department Lobby', '2024-07-22', 'Recycle your textbooks and save money!');


INSERT INTO EventParticipation (UserID, EventID, Role) VALUES
(1, 1, 'Organizer'),
(2, 2, 'Participant'),
(3, 3, 'Participant'),
(1, 4, 'Participant'),
(2, 5, 'Participant'),
(3, 6, 'Participant'),
(1, 7, 'Participant'),
(2, 8, 'Participant'),
(3, 9, 'Participant'),
(1, 10, 'Participant'),
(2, 11, 'Participant'),
(3, 12, 'Participant'),
(1, 13, 'Participant'),
(2, 14, 'Participant'),
(3, 15, 'Participant'),
(1, 16, 'Participant'),
(2, 17, 'Participant'),
(3, 18, 'Participant'),
(1, 19, 'Participant'),
(2, 20, 'Participant');

