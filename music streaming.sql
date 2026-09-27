CREATE DATABASE MusicStreamingPlayerDB;
USE MusicStreamingPlayerDB;

CREATE TABLE Users (
    User_ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Password VARCHAR(50)
);

CREATE TABLE Artist (
    Artist_ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Album (
    Album_ID INT IDENTITY(1,1) PRIMARY KEY,
    Album_Name VARCHAR(150),
    Release_Date DATE,
    Artist_ID INT,
    FOREIGN KEY (Artist_ID)
        REFERENCES Artist(Artist_ID)
);

CREATE TABLE Song (
    Song_ID INT IDENTITY(1,1) PRIMARY KEY,
    Title VARCHAR(150),
    Duration VARCHAR(10),
    Artist_ID INT,
    Album_ID INT,
    FOREIGN KEY (Artist_ID)
        REFERENCES Artist(Artist_ID),
    FOREIGN KEY (Album_ID)
        REFERENCES Album(Album_ID)
);

CREATE TABLE Playlist (
    Playlist_ID INT IDENTITY(1,1) PRIMARY KEY,
    Playlist_Name VARCHAR(100),
    User_ID INT,
    FOREIGN KEY (User_ID)
        REFERENCES Users(User_ID) ON DELETE CASCADE
);

CREATE TABLE PlaylistSong (
    Playlist_ID INT,
    Song_ID INT,
    PRIMARY KEY (Playlist_ID, Song_ID),
    FOREIGN KEY (Playlist_ID)
        REFERENCES Playlist(Playlist_ID) ON DELETE CASCADE,
    FOREIGN KEY (Song_ID)
        REFERENCES Song(Song_ID) ON DELETE CASCADE
);

-- ARTIST DATA

INSERT INTO Artist (Name) VALUES
('Atif Aslam'),
('Ali Zafar'),
('Rahat Fateh Ali Khan'),
('Ed Sheeran'),
('Adele'),
('The Weeknd'),
('Dua Lipa'),
('Justin Bieber'),
('Taylor Swift'),
('Bruno Mars'),
('Billie Eilish'),
('Arijit Singh'),
('Shreya Ghoshal'),
('Nusrat Fateh Ali Khan'),
('Imran Khan');

-- ALBUM DATA

INSERT INTO Album (Album_Name, Release_Date, Artist_ID) VALUES
('Jal Pari', '2004-06-15', 1),
('Huqa Pani', '2003-03-10', 2),
('Back 2 Love', '2014-09-05', 3),
('Divide', '2017-03-03', 4),
('25', '2015-11-20', 5),
('After Hours', '2020-03-20', 6),
('Future Nostalgia', '2020-03-27', 7),
('Purpose', '2015-11-13', 8),
('1989', '2014-10-27', 9),
('24K Magic', '2016-11-18', 10),
('When We All Fall Asleep, Where Do We Go?', '2019-03-29', 11),
('Ae Dil Hai Mushkil', '2016-10-21', 12),
('Bhairavi', '2005-01-01', 13),
('Shahen-Shah', '1989-01-01', 14),
('Unforgettable', '2009-05-01', 15);

-- SONG DATA

INSERT INTO Song (Title, Duration, Artist_ID, Album_ID) VALUES
('Tera Hone Laga Hoon', '04:32', 1, 1),
('Channo', '04:10', 2, 2),
('Zaroori Tha', '05:02', 3, 3),
('Shape of You', '03:53', 4, 4),
('Hello', '04:55', 5, 5),
('Blinding Lights', '03:20', 6, 6),
('Don''t Start Now', '03:03', 7, 7),
('Sorry', '03:20', 8, 8),
('Blank Space', '03:51', 9, 9),
('24K Magic', '03:46', 10, 10),
('Bad Guy', '03:14', 11, 11),
('Channa Mereya', '04:49', 12, 12),
('Teri Meri', '04:15', 13, 13),
('Sanu Ek Pal Chain', '05:40', 14, 14),
('Amplifier', '03:47', 15, 15);

-- USERS DATA

INSERT INTO Users (Name, Email, Password) VALUES
('Ahmed Raza', 'ahmed.raza@example.com', 'Pass@123'),
('Sara Khan', 'sara.khan@example.com', 'Pass@123'),
('Bilal Ahmed', 'bilal.ahmed@example.com', 'Pass@123'),
('Ayesha Siddiqui', 'ayesha.siddiqui@example.com', 'Pass@123'),
('Hamza Tariq', 'hamza.tariq@example.com', 'Pass@123'),
('Fatima Noor', 'fatima.noor@example.com', 'Pass@123'),
('Usman Ali', 'usman.ali@example.com', 'Pass@123'),
('Mehak Iqbal', 'mehak.iqbal@example.com', 'Pass@123'),
('Zain Malik', 'zain.malik@example.com', 'Pass@123'),
('Hira Shahzad', 'hira.shahzad@example.com', 'Pass@123'),
('Danish Khan', 'danish.khan@example.com', 'Pass@123'),
('Sana Yousuf', 'sana.yousuf@example.com', 'Pass@123'),
('Faizan Rasheed', 'faizan.rasheed@example.com', 'Pass@123'),
('Nimra Aslam', 'nimra.aslam@example.com', 'Pass@123'),
('Omar Farooq', 'omar.farooq@example.com', 'Pass@123');

-- PLAYLIST DATA

INSERT INTO Playlist (Playlist_Name, User_ID) VALUES
('Morning Vibes', 1),
('Workout Mix', 2),
('Chill Nights', 3),
('Road Trip', 4),
('Study Focus', 5),
('Party Anthems', 6),
('Throwback Hits', 7),
('Coke Studio Favorites', 8),
('Bollywood Beats', 9),
('English Top 40', 10),
('Sad Songs', 11),
('Sufi Vibes', 12),
('Gym Pump', 13),
('Late Night Drive', 14),
('All Time Favorites', 15);

-- PLAYLIST SONG DATA

INSERT INTO PlaylistSong (Playlist_ID, Song_ID) VALUES
(1, 1),
(1, 4),
(2, 6),
(2, 10),
(3, 5),
(3, 12),
(4, 4),
(5, 13),
(6, 7),
(6, 9),
(7, 2),
(8, 3),
(9, 12),
(10, 8),
(11, 5);

-- SHOW ALL SONGS

SELECT * FROM Song;


-- USERS WHO HAVE EXAMPLE.COM EMAIL

SELECT Name, Email
FROM Users
WHERE Email LIKE '%example.com';

-- SONGS ORDERED BY DURATION

SELECT Title, Duration
FROM Song
ORDER BY Duration DESC;


-- UPDATE USER PASSWORD

UPDATE Users
SET Password = 'NewPass@123'
WHERE User_ID = 1;

--  UPDATE PLAYLIST NAME

UPDATE Playlist
SET Playlist_Name = 'Weekend Vibes'
WHERE Playlist_ID = 1;

--  DELETE SONG FROM PLAYLIST

DELETE FROM PlaylistSong
WHERE Playlist_ID = 4
AND Song_ID = 4;

--COUNT TOTAL SONGS

SELECT COUNT(*) AS Total_Songs
FROM Song;


--  COUNT TOTAL USERS

SELECT COUNT(*) AS Total_Users
FROM Users;

-- OLDEST AND NEWEST ALBUM

SELECT
    MIN(Release_Date) AS Oldest_Album,
    MAX(Release_Date) AS Newest_Album
FROM Album;

--  SONGS BY EACH ARTIST

SELECT Artist_ID, COUNT(*) AS Total_Songs
FROM Song
GROUP BY Artist_ID;


--  SONGS IN EACH PLAYLIST

SELECT Playlist_ID, COUNT(*) AS Songs_In_Playlist
FROM PlaylistSong
GROUP BY Playlist_ID;

--PLAYLISTS HAVING MORE THAN 1 SONG

SELECT Playlist_ID, COUNT(*) AS Songs_In_Playlist
FROM PlaylistSong
GROUP BY Playlist_ID
HAVING COUNT(*) > 1;


-- PLAYLIST SONG COUNT

SELECT
    p.Playlist_ID,
    p.Playlist_Name,
    COUNT(ps.Song_ID) AS Songs_In_Playlist
FROM Playlist p
JOIN PlaylistSong ps
ON p.Playlist_ID = ps.Playlist_ID
WHERE p.User_ID <= 10
GROUP BY p.Playlist_ID, p.Playlist_Name
HAVING COUNT(ps.Song_ID) >= 1
ORDER BY Songs_In_Playlist DESC;


--  SONG WITH ARTIST AND ALBUM

SELECT
    s.Title,
    a.Name AS Artist_Name,
    al.Album_Name
FROM Song s
INNER JOIN Artist a
ON s.Artist_ID = a.Artist_ID
INNER JOIN Album al
ON s.Album_ID = al.Album_ID;
GO


--USERS AND THEIR PLAYLISTS

SELECT
    u.Name AS User_Name,
    p.Playlist_Name
FROM Users u
LEFT JOIN Playlist p
ON u.User_ID = p.User_ID;

--SONG PAIRS IN SAME PLAYLIST

SELECT
    ps1.Playlist_ID,
    s1.Title AS Song_A,
    s2.Title AS Song_B
FROM PlaylistSong ps1
JOIN PlaylistSong ps2
ON ps1.Playlist_ID = ps2.Playlist_ID
AND ps1.Song_ID < ps2.Song_ID
JOIN Song s1
ON ps1.Song_ID = s1.Song_ID
JOIN Song s2
ON ps2.Song_ID = s2.Song_ID;
GO


-- USER, PLAYLIST, SONG AND ARTIST

SELECT
    u.Name AS User_Name,
    p.Playlist_Name,
    s.Title AS Song_Title,
    ar.Name AS Artist_Name
FROM Users u
JOIN Playlist p
ON u.User_ID = p.User_ID
JOIN PlaylistSong ps
ON p.Playlist_ID = ps.Playlist_ID
JOIN Song s
ON ps.Song_ID = s.Song_ID
JOIN Artist ar
ON s.Artist_ID = ar.Artist_ID
ORDER BY u.Name;

--SONGS FROM DIVIDE ALBUM

SELECT Title
FROM Song
WHERE Album_ID =
(
    SELECT Album_ID
    FROM Album
    WHERE Album_Name = 'Divide'
);


-- ARTISTS HAVING SONG LONGER THAN 4 MINUTES

SELECT Name
FROM Artist
WHERE Artist_ID IN
(
    SELECT Artist_ID
    FROM Song
    WHERE Duration > '04:00'
);

-- USERS WHO HAVE PLAYLISTS

SELECT Name
FROM Users u
WHERE EXISTS
(
    SELECT 1
    FROM Playlist p
    WHERE p.User_ID = u.User_ID
);

--PLAYLISTS HAVING MORE THAN 1 SONG

SELECT Playlist_ID, Songs_In_Playlist
FROM
(
    SELECT Playlist_ID, COUNT(*) AS Songs_In_Playlist
    FROM PlaylistSong
    GROUP BY Playlist_ID
) AS PlaylistCounts
WHERE Songs_In_Playlist > 1;


--SONGS LONGER THAN ALL SONGS OF ARTIST 5

SELECT Title, Duration
FROM Song
WHERE Duration > ALL
(
    SELECT Duration
    FROM Song
    WHERE Artist_ID = 5
);

--INDEX ON SONG TITLE

CREATE NONCLUSTERED INDEX IX_Song_Title
ON Song(Title);

--INDEX ON USER NAME

CREATE NONCLUSTERED INDEX IX_Users_Name
ON Users(Name);
GO


--SHOW INDEX

EXEC sp_helpindex 'Song';


-- SHOW STATISTICS

SET STATISTICS IO ON;

SELECT *
FROM Song
WHERE Title = 'Hello';

SET STATISTICS IO OFF;


--TRANSACTION

BEGIN TRANSACTION;

INSERT INTO Playlist (Playlist_Name, User_ID)
VALUES ('Focus Flow', 5);

COMMIT TRANSACTION;



--TRANSACTION WITH TRY CATCH

BEGIN TRY

    BEGIN TRANSACTION;

    DELETE FROM PlaylistSong
    WHERE Playlist_ID = 6
    AND Song_ID = 9;

    INSERT INTO PlaylistSong (Playlist_ID, Song_ID)
    VALUES (7, 9);

    COMMIT TRANSACTION;

    PRINT 'Song moved successfully.';

END TRY

BEGIN CATCH

    ROLLBACK TRANSACTION;

    PRINT 'Error occurred, transaction rolled back: '
          + ERROR_MESSAGE();

END CATCH;

--SAVEPOINT TRANSACTION

BEGIN TRANSACTION;

INSERT INTO Artist (Name)
VALUES ('New Test Artist');

SAVE TRANSACTION BeforeSecondInsert;

INSERT INTO Artist (Name)
VALUES ('Temp Artist To Undo');

ROLLBACK TRANSACTION BeforeSecondInsert;

COMMIT TRANSACTION;
GO


--READ COMMITTED

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

BEGIN TRANSACTION;

SELECT *
FROM Song
WHERE Artist_ID = 1;

COMMIT TRANSACTION;
GO


--VIEW

CREATE VIEW vw_UserPlaylistReport AS
SELECT
    u.User_ID,
    u.Name AS User_Name,
    p.Playlist_Name,
    (
        SELECT COUNT(*)
        FROM PlaylistSong ps
        WHERE ps.Playlist_ID = p.Playlist_ID
    ) AS Total_Songs
FROM Users u
JOIN Playlist p
ON u.User_ID = p.User_ID;
GO

--SHOW VIEW

SELECT *
FROM vw_UserPlaylistReport
ORDER BY Total_Songs DESC;