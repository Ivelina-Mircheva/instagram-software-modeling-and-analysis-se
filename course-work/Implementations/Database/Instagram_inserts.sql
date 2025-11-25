INSERT INTO Users (Username, Password, FirstName, LastName, Email, Phone, BirthDate, ProfilePicture, Bio)
VALUES
('ivan01', 'pass123', 'Ivan', 'Petrov', 'ivan01@mail.com', '0888000001', '1995-04-10', NULL, 'Hello, I am Ivan'),
('maria_k', 'pass456', 'Maria', 'Koleva', 'maria_k@mail.com', '0888000002', '1998-07-22', NULL, 'Love photography'),
('georgi98', 'pass789', 'Georgi', 'Ivanov', 'georgi98@mail.com', '0888000003', '1998-11-15', NULL, 'Traveler'),
('stefan_t', 'stef333', 'Stefan', 'Todorov', 'stefan_t@mail.com', '0888000004', '1993-09-01', NULL, 'Fitness and tech'),
('desi_d', 'd3s!pass', 'Desislava', 'Dimitrova', 'desi_d@mail.com', '0888000005', '1999-02-14', NULL, 'Food lover'),
('petar_m', 'p3tarm', 'Petar', 'Marinov', 'petar_m@mail.com', '0888000006', '1996-12-03', NULL, 'Cycling is life'),
('elena_p', 'el3napass', 'Elena', 'Pavlova', 'elena_p@mail.com', '0888000007', '1997-05-19', NULL, 'Designer'),
('hristo_hr', 'hrpass98', 'Hristo', 'Hristov', 'hristo_hr@mail.com', '0888000008', '1998-01-23', NULL, 'Nature fan'),
('kalina_v', 'kalv456', 'Kalina', 'Vasileva', 'kalina_v@mail.com', '0888000009', '1994-08-30', NULL, 'Bookworm'),
('niki_s', 'n1k1pass', 'Nikola', 'Stoyanov', 'niki_s@mail.com', '0888000010', '1995-03-11', NULL, 'Gamer'),
('viktor_g', 'vikt0r', 'Viktor', 'Genov', 'viktor_g@mail.com', '0888000011', '1996-04-26', NULL, 'Music producer'),
('radina_b', 'radb!12', 'Radina', 'Borisova', 'radina_b@mail.com', '0888000012', '1999-10-09', NULL, 'Animal lover'),
('boris_k', 'borisk99', 'Boris', 'Kanev', 'boris_k@mail.com', '0888000013', '1997-12-20', NULL, 'Developer'),
('anita_r', 'anitapass', 'Anita', 'Ruseva', 'anita_r@mail.com', '0888000014', '1998-06-17', NULL, 'Art and travel'),
('todorka_m', 'toda12', 'Todorka', 'Marinova', 'todorka_m@mail.com', '0888000015', '1995-11-03', NULL, 'Coffee addict');

Select * from Users;

INSERT INTO Posts ([Content], Caption, Location, UserID)
VALUES
('Forest', 'Nice day outside', 'Sofia', 1),
('Coffee cup', 'My coffee', 'Plovdiv', 2),
('Sea', 'Sunset', 'Varna', 1),
('Beautiful weather today!', 'Sunny mood', 'Sofia', 1),
('New camera test.', 'Love this shot', 'Plovdiv', 2),
('Mountain trip.', 'Amazing view', 'Rila', 3),
('Portfolio update.', NULL, 'Online', 4),
('Travel throwback.', 'Miss this place', 'Paris', 5),
('Workout complete!', 'Feeling strong', 'Varna', 6),
('Trying a new recipe.', 'Delicious!', 'Home', 7),
('Cycling day.', 'Road adventures', 'Burgas', 8),
('New project!', 'Design vibes', 'Sofia', 9),
('Morning walk.', 'Nature time', 'Stara Zagora', 10),
('Finished a great book.', 'Highly recommend', 'Sofia', 11),
('Gaming setup update.', 'New gear!', 'Home', 12),
('Studio session.', 'Music time', 'Sofia', 13),
('Cute puppy!', 'So adorable', 'Plovdiv', 14),
('Coding late night.', 'Productive', 'Sofia', 15),
('Sunset vibes.', NULL, 'Varna', 16),
('Morning coffee.', 'Perfect start', 'Sofia', 17);

Select * from Posts;


INSERT INTO Comments ([Content], PostID, UserID)
VALUES
('Great post!', 2, 3),
('Amazing!', 2, 3),
('Nice photo!', 3, 1),
('Looks great!', 2, 2),
('Amazing view!', 3, 5),
('Love this!', 7, 3),
('So cool!', 9, 10),
('Beautiful!', 14, 12),
('Great shot!', 11, 7),
('Nice idea!', 16, 9),
('Super!', 17, 13),
('Awesome!', 20, 4),
('Inspiring!', 24, 8),
('Love the colors!', 25, 5),
('Good job!', 18, 11),
('I want to go there!', 12, 14),
('Hahaha cool!', 21, 9),
('Amazing!', 19, 6),
('Keep it up!', 22, 15),
('Nice!', 12, 3),
('So cute!', 10, 1),
('Wow!', 16, 2);

Select * from Comments;

INSERT INTO Likes (PostID, UserID)
VALUES
(2, 2),(3, 3),
(2, 1),(11, 2),
(3, 7),(25,2),
(10,3),(15,4),
(2,1),(2,5),
(3,1),(3,2),
(3,6),(3,10),
(14,3),(24,8),
(7,1),(11,2),
(18,10),(20,11);

Select * from Likes;

INSERT INTO Stories ([Content], ViewCount, UserID)
VALUES
('Forest vibes', 58, 1),
('Team work', 10, 2),
('Another destination', 90, 5),
('Morning vibes', 14, 1),
('Coffee time', 21, 17),
('Beach moment', 33, 4),
('Working hard', 80, 13),
('Training session', 19, 6),
('Cooking something tasty', 12, 7),
('New drawings', 18, 16),
('Bike ride', 25, 8),
('Studio work', 50, 13),
('Reading time', 9, 11);

Select * from Stories;


INSERT INTO Follows (FollowerID, FollowedID)
VALUES
(1, 13),(1, 3),
(2, 1),(2, 3),
(3, 1),(1,4),
(1,5),(2,7),
(3,6),(4,1),
(4,2),(4,3),
(5,1),(5,15),
(6,3),(6,7),
(6,11),(9,14),
(10,11),(10,3),
(17,1), (8,2),
(9,12), (13,1),
(14,16), (17, 2);

Select * from Follows;


INSERT INTO DirectMessages ([Content], SenderID, ReceiverID)
VALUES
('Hey, how are you?', 1, 2),
('All good, you?', 2, 1),
('Want to meet tomorrow?', 3, 1),
('Sure, let’s do it!', 1, 3),
('Check this out!', 5,6),
('Looks cool!', 6,5),
('How’s the project going?', 7,13),
('Pretty well!', 13,7),
('Can you send the file?', 10,11),
('Sent!', 11,10),
('Good morning!', 14,9),
('Morning!', 9,14),
('Let’s play tonight?', 10,1),
('I’m in!', 1,10),
('Love this picture!', 12,2),
('Thanks!', 2,12),
('You free tomorrow?', 15,5),
('Yes!', 5,15),
('Need help with code?', 13,3),
('Sure, thanks!', 3,13);

Select * from DirectMessages;