create database Instagram
use Instagram

-- Create User Table
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(30) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
	FirstName VARCHAR(25) NOT NULL,
	LastName VARCHAR(25) NOT NULL,
	Email VARCHAR(30) NOT NULL UNIQUE,
    Phone VARCHAR(20) NOT NULL UNIQUE,
	BirthDate DATE UNIQUE,
    ProfilePicture VARCHAR(255),
    Bio TEXT,
    RegisterDate DATETIME NOT NULL DEFAULT GETDATE()
);

-- Create Post Table
CREATE TABLE Posts (
    PostID INT PRIMARY KEY IDENTITY(1,1),
	[Content] VARCHAR(1000) NOT NULL,
    Caption TEXT,
	Location TEXT,
    UploadDate DATETIME NOT NULL DEFAULT GETDATE(),
    UserID INT NOT NULL,
    CONSTRAINT FK_Posts_UserId FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Comment Table
CREATE TABLE Comments (
    CommentID INT PRIMARY KEY IDENTITY(1,1),
    [Content] VARCHAR(1000) NOT NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    PostID INT NOT NULL,
    UserID INT NOT NULL,
    CONSTRAINT FK_Comments_PostId FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    CONSTRAINT FK_Comments_UserId FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Like Table
CREATE TABLE Likes (
    LikeID INT PRIMARY KEY IDENTITY(1,1),
    LikedAt DATETIME NOT NULL DEFAULT GETDATE(),
    PostID INT NOT NULL,
    UserID INT NOT NULL,
    CONSTRAINT FK_Likes_PostId FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    CONSTRAINT FK_Likes_UserId FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Story Table
CREATE TABLE Stories (
	StoryID INT PRIMARY KEY IDENTITY(1,1),
	[Content] VARCHAR(1000) NOT NULL,
	ViewCount INT NOT NULL CHECK(ViewCount > -1),
    UploadDate DATETIME NOT NULL DEFAULT GETDATE(),
	ExpireDate DATETIME NOT NULL DEFAULT GETDATE() CHECK(ExpireDate >= GETDATE()),
    UserID INT NOT NULL,
    CONSTRAINT FK_Stories_UserId FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Follow Table
CREATE TABLE Follows (
    FollowerID INT NOT NULL,
    FollowedID INT NOT NULL,
    FollowDate DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (FollowerID, FollowedID),
    FOREIGN KEY (FollowerID) REFERENCES Users(UserID),
    FOREIGN KEY (FollowedID) REFERENCES Users(UserID)
);

-- Create DirectMessage Table
CREATE TABLE DirectMessages (
	MessageID INT PRIMARY KEY IDENTITY(1,1),
	[Content] VARCHAR(1000) NOT NULL,
	SenderID INT NOT NULL,
    ReceiverID INT NOT NULL,
    SendDate DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (SenderID) REFERENCES Users(UserID),
    FOREIGN KEY (ReceiverID) REFERENCES Users(UserID)
);


/*Съхранена процедура, която извежда списък с публикациите на 
определен потребител, както и информация за самия потребител. */

SELECT * FROM Posts p JOIN Users u on p.UserID = u.UserID
WHERE u.UserID = 1;


CREATE PROCEDURE SP_GetUserPosts
    @UserID INT
AS
BEGIN
    SELECT
	p.PostID, p.Content, p.Caption, p.Location, p.UploadDate, u.UserID, u.Username, u.FirstName, u.LastName
    FROM Posts p
    JOIN Users u ON p.UserID = u.UserID
    WHERE u.UserID = @UserID;
END;


EXECUTE SP_GetUserPosts 1;


/*Функция, връщаща като резултат резултатен набор 
публикациите с техните коментари. */

CREATE FUNCTION DBO.POST_COMMENTS_FUNCTION() RETURNS TABLE AS
RETURN 
SELECT P.Content, C.Content AS "Comment" FROM Posts P JOIN Comments C
ON C.PostID = P.PostID

SELECT * FROM DBO.POST_COMMENTS_FUNCTION()


/*Тригер, който ще се изпълнява след добавяне и изтриване на записи 
в таб. STORIES и ще извежда всички записи от inserted и deleted, за 
да се види какво те ще съдържат след всяка команда. */

CREATE TRIGGER STORIES_TGR
	ON STORIES
	AFTER INSERT, DELETE AS
	PRINT 'INSERTED: ' SELECT * FROM INSERTED
	PRINT 'DELETED: '  SELECT * FROM DELETED

	--ТРИГЕРИРАЩИТЕ ДЕЙСТВИЯ:
	INSERT INTO Stories(Content, ViewCount, UploadDate, ExpireDate, UserID)
	VALUES('Image url', '123', '2025-11-21', '2025-12-21', 2)

	Select * from Stories;
	DELETE FROM Stories WHERE StoryID = 20