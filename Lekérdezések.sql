--egyszerû lekérdezések
SELECT * FROM Games;
SELECT * FROM Licenses;
SELECT * FROM Purchases;
SELECT * FROM UserGames;
SELECT * FROM Users;

SELECT * FROM Games WHERE ReleaseDate > '2015-12-31';
SELECT * FROM Games WHERE Genre LIKE '%Akcio%';
SELECT * FROM Games ORDER BY ReleaseDate DESC;

SELECT * FROM Purchases WHERE GameID = '5';
SELECT * FROM Purchases WHERE UserID = '9';
SELECT COUNT(PurchaseID) AS All_Purchases FROM Purchases;

SELECT * FROM UserGames WHERE ExpirationDate IS  NOT NULL;
SELECT * FROM UserGames WHERE ExpirationDate IS  NULL;

SELECT * FROM Users WHERE Username LIKE '%gamer%';

--középhaladó lekérdezések
SELECT  Users.Username, SUM(Games.Price) AS TotalSpent FROM Purchases 
JOIN Users ON Users.UserID = Purchases.UserID
JOIN Games ON Purchases.GameID = Games.GameID
GROUP BY Users.Username
ORDER BY TotalSpent DESC;

SELECT Users.Username, Games.Title AS GameTitle, UserGames.ExpirationDate AS Expiration_Date FROM Users
JOIN UserGames ON Users.UserID = UserGames.UserID
JOIN Games ON UserGames.GameID = Games.GameID
WHERE Users.Username = 'proplayer';


