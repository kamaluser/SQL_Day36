CREATE DATABASE Restaurant
USE Restaurant

CREATE TABLE Meals
(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(50) NOT NULL,
	Price SMALLMONEY 
)

CREATE TABLE Categories
(
	Id INT PRIMARY KEY,
	Name NVARCHAR(50) NOT NULL
)

ALTER TABLE Meals 
ADD Category_Id INT FOREIGN KEY REFERENCES Categories(Id)


CREATE TABLE Ingredients
(
	Id INT PRIMARY KEY ,
	Name NVARCHAR(50) NOT NULL
)


CREATE TABLE Meal_Ingredients
(

	Meal_Id INT FOREIGN KEY REFERENCES Meals(Id),
	Ingredient_Id INT FOREIGN KEY REFERENCES Categories(Id)
)

INSERT INTO Categories
VALUES
(1, 'Fast Food'),
(2, 'Soup'),
(3, 'Main Meal'),
(4, 'Salad')

INSERT INTO Categories
VALUES
(5, 'Sweet')

SELECT * FROM Categories


INSERT INTO Ingredients(Id, Name)
VALUES
(1, N'Yumurta'),
(2, N'Sud'),
(3, N'Biber'),
(4, N'Un'),
(5, N'Pomidor')


INSERT INTO Meals
VALUES
('Pizza', 17, 1),
('Piroq', 12, 2),
('Xengel', 10, 2),
('Merci Supu', 7, 3),
('Dusbere', 17, 2)




INSERT INTO Meal_Ingredients
VALUES
(1,2),
(1,4),
(2,1),
(2,2),
(3,3),
(4,3),
(5,4)

UPDATE Meals 
SET Category_Id = 5
WHERE Id = 2


SELECT * , (SELECT COUNT(*) FROM Meal_Ingredients AS MI WHERE MI.Meal_Id = M.Id) AS Ingredients_Count FROM Meals AS M


SELECT 
Id ,
NAME ,
(SELECT MIN(Price) FROM Meals AS M WHERE M.Category_Id = C.ID) AS En_Ucuz,
(SELECT MAX(Price) FROM Meals AS M WHERE M.Category_Id = C.ID) AS En_Baha
FROM Categories AS C


SELECT * ,
(SELECT C.Name FROM Categories AS C WHERE C.Id=M.Category_Id) AS Category_Name
FROM Meals AS M



SELECT * FROM Categories AS C WHERE NOT EXISTS(SELECT * FROM Meals AS M WHERE C.Id=M.Category_Id)