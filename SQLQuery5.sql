/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
CREATE TABLE Faculties 
(
FacultyID int IDENTITY NOT NULL PRIMARY KEY,
FacultyNumber int NOT NULL,
UniversityID int NOT NULL FOREIGN KEY REFERENCES Universities (UniversityID)
)

CREATE TABLE Students
(
StudentID int IDENTITY NOT NULL PRIMARY KEY,
StudentName varchar (30) NOT NULL,
Email varchar (30) NOT NULL,
GroupNumber int NOT NULL
)

CREATE TABLE FormOfEducation
(
FormID int IDENTITY NOT NULL PRIMARY KEY,
StudentID int NOT NULL FOREIGN KEY REFERENCES Students (StudentID),
FacultyID int NOT NULL FOREIGN KEY REFERENCES Faculties (FacultyID),
FormEducation varchar (20) NOT NULL,
)

SELECT TOP (1000) [UniversityID]
      ,[UniversityName]
      ,[PlaceInUkraineRanking]
      ,[CreationYear]
      ,[Adress]
  FROM [UniversityUkraineDB].[dbo].[Universities]

  SELECT TOP (1000) [StudentID]
      ,[StudentName]
      ,[Email]
      ,[GroupNumber]
  FROM [UniversityUkraineDB].[dbo].[Students]

  SELECT TOP (1000) [FacultyID]
      ,[FacultyNumber]
      ,[UniversityID]
  FROM [UniversityUkraineDB].[dbo].[Faculties]

  SELECT TOP (1000) [FormID]
      ,[StudentID]
      ,[FacultyID]
      ,[FormEducation]
  FROM [UniversityUkraineDB].[dbo].[FormOfEducation]

  SELECT Students.StudentID, Students.StudentName, Students.Email, Students.GroupNumber FROM Students WHERE GroupNumber = 451
  SELECT Students.StudentName, Students.GroupNumber FROM Students
  SELECT Students.StudentID, Students.StudentName  FROM Students
  SELECT * FROM Students
  SELECT * FROM Students WHERE GroupNumber = 151
  SELECT * FROM Students WHERE GroupNumber = 451
  SELECT * FROM Students WHERE StudentName LIKE 'K%'
  SELECT * FROM Students WHERE StudentName LIKE 'Koz%'
  SELECT * FROM Students WHERE StudentName LIKE '%a'
  SELECT * FROM Students WHERE StudentName LIKE '%a%'
  SELECT * FROM Students WHERE Email LIKE '%@gmail%'
  SELECT * FROM Students WHERE StudentName LIKE 'Nikitina Ir_na'
  SELECT * FROM Students ORDER BY StudentName
  SELECT * FROM Students ORDER BY StudentName DESC

  SELECT Count(GroupNumber) as GroupNumberCount FROM Students WHERE GroupNumber = 151
  SELECT SUM(GroupNumber) as GroupNumberSum FROM Students WHERE StudentName LIKE '%a%'
  SELECT AVG(GroupNumber) as GroupNumberAvg FROM Students WHERE StudentName LIKE '%a%'
  SELECT MAX(GroupNumber) as GroupNumberMax FROM Students WHERE StudentName LIKE '%a%'
  SELECT MIN(GroupNumber) as GroupNumberMin FROM Students WHERE StudentName LIKE '%a%'
  SELECT GroupNumber, Count(GroupNumber) FROM Students GROUP BY GroupNumber

  SELECT FacultyNumber, Count(FacultyNumber) FROM Faculties GROUP BY FacultyNumber HAVING FacultyNumber > 110
  SELECT FacultyNumber, Count(FacultyNumber) FROM Faculties GROUP BY FacultyNumber HAVING FacultyNumber < 110

  SELECT * FROM Universities

  SELECT * FROM Faculties
  SELECT * FROM Faculties ORDER BY FacultyNumber
  SELECT * FROM Faculties ORDER BY FacultyNumber DESC

  SELECT FormEducation, COUNT (FormEducation) FROM FormOfEducation GROUP BY FormEducation
  SELECT * FROM FormOfEducation

  SELECT * FROM FormOfEducation JOIN Students on Students.StudentID = FormOfEducation.StudentID
  SELECT * FROM FormOfEducation JOIN Faculties on FormOfEducation.FacultyID = Faculties.FacultyID
  SELECT * FROM Universities JOIN Faculties on Universities.UniversityID = Faculties.UniversityID
  SELECT * FROM Universities LEFT JOIN Faculties on Universities.UniversityID = Faculties.UniversityID
  SELECT * FROM Universities RIGHT JOIN Faculties on Universities.UniversityID = Faculties.UniversityID
  SELECT * FROM Faculties RIGHT JOIN Universities on Universities.UniversityID = Faculties.UniversityID
  SELECT * FROM Faculties INNER JOIN Universities on Universities.UniversityID = Faculties.UniversityID

  UPDATE Universities SET PlaceInUkraineRanking = 3 WHERE UniversityID = 2
  UPDATE Universities SET PlaceInUkraineRanking = 2 WHERE UniversityID = 2

  INSERT INTO Faculties (FacultyNumber, UniversityID) VALUES
  (091, 1),
  (021, 1),
  (162, 1),
  (106, 1),
  (193, 1),
  (101, 1),
  (051, 1),
  (134, 2),
  (173, 2),
  (151, 2),
  (143, 2),
  (162, 2),
  (186, 2)

  INSERT INTO Universities (UniversityName, PlaceInUkraineRanking, CreationYear, Adress) VALUES
  ('Ivan Franko National University of Lviv', 3, 1661, 'Universytetska St, 1, Lviv, 79000'),
  ('Kharkiv University or Karazin University or officially V. N. Karazin', 4, 1804, 'Nezalezhnosti Ave, 6, Kharkiv, 61000')

  INSERT INTO Students (StudentName, Email, GroupNumber) VALUES
  ('Kozar Ivan', 'kozar14@ukr.net', 121),
  ('Nikitina Irina', 'irishkan@gmail.com', 151),
  ('Koval Karolina', 'koval_karol@i.ua', 151),
  ('Pavlenko Taras', 'pavl_taras229@gmail.com', 236),
  ('Topol Kateryna', 'topol_k_15@i.ua', 321),
  ('Kozubovska Maryna', 'summer158@icloud.com', 451),
  ('Honcharuk Valentyn', 'honchar2021@ukr.net', 451)

  INSERT INTO FormOfEducation (StudentID, FacultyID, FormEducation) VALUES
  (20, 1, 'full-time'),
  (21, 13, 'external'),
  (22, 2, 'full-time'),
  (23, 4, 'full-time'),
  (24, 3, 'full-time'),
  (25, 6, 'full-time'),
  (26, 5, 'external'),
  (27, 10, 'external'),
  (28, 7, 'full-time'),
  (29, 9, 'full-time'),
  (30, 8, 'full-time'),
  (31, 11, 'external'),
  (32, 12, 'external'),
  (33, 11, 'full-time')

  DELETE FROM Students