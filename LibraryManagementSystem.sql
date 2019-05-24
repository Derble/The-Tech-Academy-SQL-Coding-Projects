/*Derry Lammerding, 5/21/2019*/

--DATABASE CREATION------------------------------
Create Database db_libraryManagementSystem



USE db_libraryManagementSystem
GO

--TABLE CREATION----------------------------------

CREATE TABLE tbl_LIBRARY_BRANCH (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL,
	BranchAddress VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_PUBLISHER (
	PublisherName VARCHAR(30) PRIMARY KEY NOT NULL,
	PublisherAddress VARCHAR(50) NOT NULL,
	PublisherPhone VARCHAR(20) NOT NULL
);

CREATE TABLE tbl_BORROWER (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (500,1),
	BorrowerName VARCHAR(50) NOT NULL,
	BorrowerAddress VARCHAR(50) NOT NULL,
	BorrowerPhone VARCHAR(20) NOT NULL
);

CREATE TABLE tbl_BOOKS (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (3,1),--originally set to (1000,1) but it didn't work for some reason, it started at 3 instead? So I made that change to reflect that.
	Title VARCHAR(50) NOT NULL,
	BOOKS_PublisherName VARCHAR(30) NOT NULL CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES tbl_PUBLISHER(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tbl_BOOK_LOANS (
	BOOK_LOANS_BookID INT NOT NULL CONSTRAINT fk_book_id_loans FOREIGN KEY REFERENCES tbl_BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BOOK_LOANS_BranchID INT NOT NULL CONSTRAINT fk_branch_id_loans FOREIGN KEY REFERENCES tbl_LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	BOOK_LOANS_CardNo INT NOT NULL CONSTRAINT fk_card_no FOREIGN KEY REFERENCES tbl_BORROWER(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut VARCHAR(50) NOT NULL,
	DateDue VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_BOOK_AUTHORS (
	BOOK_AUTHORS_BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES tbl_BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_BOOK_COPIES (
	BOOK_COPIES_BookID INT NOT NULL CONSTRAINT fk_book_id FOREIGN KEY REFERENCES tbl_BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BOOK_COPIES_BranchID INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL
);



--INSERT STATEMENTS_---------------------------------


INSERT INTO tbl_LIBRARY_BRANCH
	(BranchName, BranchAddress)
	VALUES 
	('Central', '11111 Sharpie Drive'),
	('Sharpstown', '5555 Middleton Parkway'),
	('Winterfell', '0 North Way'),
	('Stardew Valley', '42 Stardew Street')
;
SELECT * FROM tbl_LIBRARY_BRANCH--for my error checking




INSERT INTO tbl_PUBLISHER
	(PublisherName, PublisherAddress, PublisherPhone)
	VALUES --No requirement
	('Hachette', '1290 6th Ave', '(212) 364-1100'),
	('HarperCollins', '195 Broadway', '(212) 207-7000'),
	('Macmillan', '175 5th Ave', '(212) 226-7521'),
	('Penguin', '6228 3rd Ave NW', '(206) 783-2498'),
	('Simon & Schuster', '1230 6th Ave', '(866) 506-1949')
;
SELECT * FROM tbl_PUBLISHER




INSERT INTO tbl_BORROWER
	(BorrowerName, BorrowerAddress, BorrowerPhone)--Card No taken care of using pk identity 500,1
	VALUES --at least 8
	('Jeff Gerstmann', '3287 Buckhannan Avenue', '201-495-7125'),
	('Vinny Caravella', '3827 Tibbs Avenue', '580-515-7473'),
	('Patrick Klepek', '4509 Sycamore Circle', '252-358-2476'),
	('Ben Pack', '794 Green Gate Lane', '256-679-6188'),
	('Dan Rykert', '320 Davisson Street', '518-455-4790'),
	('Alex Navarro', '1423 Hardesty Street', '518-448-4335'),
	('Abby Russell', '2794 Ferry Street', '256-698-4156'),
	('Brad Shoemaker', '1721 Yorkshire Circle', '336-518-1038'),
	('Jason Oestreicher', '2871 Late Avenue', '580-691-8295'),
	('Jan Ochoa', '3878 Mahlon Street', '732-928-2407')--10 total
;
SELECT * FROM tbl_BORROWER




INSERT INTO tbl_BOOKS
	(Title, BOOKS_PublisherName)--at least 20, 2 by stephen king
	VALUES
	('The Dark Tower: The Gunslinger', 'Hachette'),
	('The Mist', 'HarperCollins'),
	('The Lost Tribe', 'Macmillan'),
	('Armada', 'Hachette'),
	('A Game of Thrones', 'Penguin'),
	('Dark Run', 'Macmillan'),
	('Redwall', 'Penguin'),
	('Harry Potter and the Goblet of Fire', 'Simon & Schuster'),
	('The Hobbit', 'Penguin'),
	('Dune', 'Macmillan'),
	('So Long, and Thanks for All the Fish', 'Simon & Schuster'),
	('Dead Air', 'Hachette'),
	('Brave New World', 'Macmillan'),
	('Clockwork Angels', 'HarperCollins'),
	('Ghost Rider: Travels on the Healing Road', 'Simon & Schuster'),
	('Neuromancer', 'HarperCollins'),
	('The A. B. C. Murders', 'Penguin'),
	('Sphere', 'Hachette'),
	('Paddle Your Own Canoe', 'Macmillan'),
	('Midnight at the Electric', 'HarperCollins')
;
SELECT * FROM tbl_BOOKS




INSERT INTO tbl_BOOK_AUTHORS
	(BOOK_AUTHORS_BookID, AuthorName)
	VALUES--20 total, 2 repeat
	(3, 'Stephen King'),
	(4, 'Stephen King'),
	(5, 'Mark Lee'),
	(6, 'Ernest Cline'),
	(7, 'George R. R. Martin'),
	(8, 'Mike Brooks'),
	(9, 'Brian Jacques'),
	(10, 'J. K. Rowling'),
	(11, 'J. R. R. Tolkien'),
	(12, 'Frank Herbert'),
	(13, 'Douglas Adams'),
	(14, 'Jak Koke'),
	(15, 'Aldous Huxley'),
	(16, 'Neil Peart'),
	(17, 'Neil Peart'),
	(18, 'William Gibson'),
	(19, 'Agatha Christie'),
	(20, 'Michael Chrichton'),
	(21, 'Nick Offerman'),
	(22, 'Jodi Lynn Anderson')
;
SELECT * FROM tbl_BOOK_AUTHORS




INSERT INTO tbl_BOOK_COPIES
	(BOOK_COPIES_BookID, BOOK_COPIES_BranchID, Number_Of_Copies)
	VALUES
	(3, 1, 5),
	(4, 1, 4),
	(5, 1, 3),--the lost tribe 
	(6, 1, 5),--'Ernest Cline'
	(7, 1, 2),--'George R. R. Martin'
	(8, 1, 5),--'Mike Brooks'
	--(9, , ),--'Brian Jacques'
	(10, 1, 3),--'J. K. Rowling'
	(11, 1, 5),--'J. R. R. Tolkien'
	--(12, , ),--'Frank Herbert'
	(13, 1, 4),--'Douglas Adams'
	--(14, , ),--'Jak Koke'
	(15, 1, 2),--'Aldous Huxley'
	(16, 1, 2),--'Neil Peart'
	--(17, , ),--'Neil Peart'
	(18, 1, 3),--'William Gibson'
	--(19, , ),--'Agatha Christie'
	--(20, , ),--'Michael Chrichton'
	--(21, , ),--'Nick Offerman'
	(22, 1, 4),--'Jodi Lynn Anderson'


	--(3, 2, ),--'Stephen King'
	(4, 2, 3),--'Stephen King'
	(5, 2, 2),--the lost tribe at the Sharpstown branch
	(6, 2, 5),--'Ernest Cline'
	(7, 2, 38),--'George R. R. Martin'
	(8, 2, 4),--'Mike Brooks'
	(9, 2, 5),--'Brian Jacques'
	--(10, 2, ),--'J. K. Rowling'
	--(11, 2, ),--'J. R. R. Tolkien'
	(12, 2, 4),--'Frank Herbert'
	--(13, 2, ),--'Douglas Adams'
	(14, 2, 6),--'Jak Koke'
	--(15, 2, ),--'Aldous Huxley'
	--(16, 2, ),--'Neil Peart'
	(17, 2, 4),--'Neil Peart'
	--(18, 2, ),--'William Gibson'
	--(19, 2, ),--'Agatha Christie'
	(20, 2, 5),--'Michael Chrichton'
	(21, 2, 2),--'Nick Offerman'
	(22, 2, 3),--'Jodi Lynn Anderson'

	--(3, 3, ),--'Stephen King'
	(4, 3, 5),--'Stephen King'
	(5, 3, 3),--the lost tribe 
	--(6, 3, ),--'Ernest Cline'
	(7, 3, 5),--'George R. R. Martin'
	--(8, 3, ),--'Mike Brooks'
	--(9, 3, ),--'Brian Jacques'
	(10, 3, 4),--'J. K. Rowling'
	(11, 3, 3),--'J. R. R. Tolkien'
	(12, 3, 2),--'Frank Herbert'
	(13, 3, 5),--'Douglas Adams'
	--(14, 3, ),--'Jak Koke'
	(15, 3, 6),--'Aldous Huxley'
	(16, 3, 3),--'Neil Peart'
	(17, 3, 2),--'Neil Peart'
	--(18, 3, ),--'William Gibson'
	(19, 3, 4),--'Agatha Christie'
	(20, 3, 3),--'Michael Chrichton'
	--(21, 3, ),--'Nick Offerman'
	--(22, 3, ),--'Jodi Lynn Anderson'

	(3, 4, 3),
	--(4, 4, ),
	--(5, 4, ),
	--(6, 4, ),
	(7, 4, 8),
	(8, 4, 3),
	(9, 4, 5),
	(10, 4, 7),
	(11, 4, 6),
	(12, 4, 4),
	--(13, 4, ),
	(14, 4, 3),
	--(15, 4, ),
	--(16, 4, ),
	--(17, 4, ),
	(18, 4, 2),
	(19, 4, 5),
	(20, 4, 4),
	(21, 4, 3)
	--(22, 4, )
;
SELECT * FROM tbl_BOOK_COPIES




INSERT INTO tbl_BOOK_LOANS--50 total
	(BOOK_LOANS_BookID, BOOK_LOANS_BranchID, BOOK_LOANS_CardNo, DateOut, DateDue)
	VALUES --(3 to 22, 1 to 4, 500 to 509, date, date) at least 50 total loans
	( 3, 1, 500, '3/7/2019', '3/19/2019'),
	( 4, 1, 500, '3/7/2019', '3/19/2019'),
	( 7, 1, 500, '3/7/2019', '3/19/2019'),
	( 15, 3, 500, '5/15/2019', '5/29/2019'),--4 for 500
	( 4, 2, 501, '3/7/2019', '3/19/2019'),
	( 7, 2, 501, '3/19/2019', '4/2/2019'),
	( 14, 2, 501, '3/19/2019', '4/2/2019'),
	( 17, 2, 501, '3/7/2019', '3/19/2019'),
	( 20, 2, 501, '3/19/2019', '4/2/2019'),
	( 21, 2, 501, '3/7/2019', '3/19/2019'),
	( 5, 3, 501, '3/19/2019', '4/2/2019'),
	( 10, 3, 501, '4/2/2019', '4/14/2019'),
	( 11, 4, 501, '4/2/2019', '4/14/2019'),
	( 12, 4, 501, '3/19/2019', '4/2/2019'),--10 for 501
	( 4, 3, 502, '5/20/2019', '6/1/2019'),
	( 5, 3, 502, '5/21/2019', '6/2/2019'),
	( 10, 3, 502, '5/20/2019', '6/1/2019'),
	( 15, 3, 502, '5/21/2019', '6/2/2019'),
	( 16, 3, 502, '5/20/2019', '6/1/2019'),
	( 17, 3, 502, '5/21/2019', '6/2/2019'),
	( 8, 4, 502, '5/20/2019', '6/1/2019'),
	( 10, 4, 502, '5/20/2019', '6/1/2019'),--8 for 502
	( 3, 1, 503, '4/28/2019', '5/11/2019'),
	( 22, 1, 503, '4/28/2019', '5/11/2019'),
	( 5, 3, 503, '4/28/2019', '5/11/2019'),
	( 12, 3, 503, '4/28/2019', '5/11/2019'),
	( 20, 3, 503, '4/28/2019', '5/11/2019'),--5 for 503
	( 18, 1, 504, '5/23/2019', '6/4/2019'),
	( 16, 1, 504, '5/23/2019', '6/4/2019'),--2 for 504
	( 4, 3, 505, '5/20/2019', '6/1/2019'),
	( 11, 3, 505, '5/20/2019', '6/1/2019'),
	( 16, 3, 505, '4/28/2019', '5/11/2019'),
	( 3, 4, 505, '4/28/2019', '5/11/2019'),
	( 7, 4, 505, '4/28/2019', '5/11/2019'),
	( 10, 4, 505, '5/20/2019', '6/1/2019'),
	( 11, 4, 505, '5/6/2019', '5/18/2019'),
	( 12, 4, 505, '5/6/2019', '5/18/2019'),
	( 18, 4, 505, '5/20/2019', '6/1/2019'),
	( 19, 4, 505, '5/6/2019', '5/18/2019'),
	( 21, 4, 505, '5/6/2019', '5/18/2019'),--11 for 505
	( 7, 2, 506, '3/7/2019', '3/19/2019'),
	( 9, 2, 506, '3/7/2019', '3/19/2019'),
	( 14, 2, 506, '3/7/2019', '3/19/2019'),--3 for 506
	( 11, 1, 507, '5/23/2019', '6/4/2019'),
	( 6, 1, 507, '5/23/2019', '6/4/2019'),
	( 8, 2, 507, '5/23/2019', '6/4/2019'),--4 for 507
	( 6, 1, 507, '4/16/1978', '5/1/1978'),
	( 8, 2, 509, '5/15/2019', '5/29/2019'),
	( 9, 2, 509, '5/15/2019', '5/29/2019'),
	( 7, 3, 509, '5/15/2019', '5/29/2019'),--4 for 509
	( 10, 3, 509, '5/15/2019', '5/29/2019')--51 total
;
SELECT * FROM tbl_BOOK_LOANS


--USED FOR TESTING----------------------------------------
SELECT * FROM tbl_LIBRARY_BRANCH
SELECT * FROM tbl_PUBLISHER
SELECT * FROM tbl_BORROWER
SELECT * FROM tbl_BOOKS
SELECT * FROM tbl_BOOK_AUTHORS
SELECT * FROM tbl_BOOK_COPIES
SELECT * FROM tbl_BOOK_LOANS



--QUERIES------------------------------------------------
--Created select statements for each question, then created the stored procedures below
--Select statements commented out but left in for reference if needed and to show work flow

--STORED PROCEDURE #1--------------------
/*
SELECT 
	a1.Number_Of_Copies,
	b1.BranchName,
	c1.Title
	FROM tbl_BOOK_COPIES a1 
	INNER JOIN tbl_LIBRARY_BRANCH b1 ON b1.BranchID = a1.BOOK_COPIES_BranchID
	INNER JOIN tbl_BOOKS c1 ON c1.BookID = a1.BOOK_COPIES_BookID
	WHERE BOOK_COPIES_BookID = 5 AND BOOK_COPIES_BranchID = 2
;*/

CREATE PROCEDURE dbo.getcopiesLostTribeSharpstown
	@Number_Of_Copies int = NULL,
	@BranchName nvarchar(50) = NULL,
	@Title nvarchar(50) = NULL
AS
SELECT Number_Of_Copies, BranchName, Title
FROM tbl_BOOK_COPIES
INNER JOIN tbl_LIBRARY_BRANCH ON BranchID = BOOK_COPIES_BranchID
INNER JOIN tbl_BOOKS ON BookID = BOOK_COPIES_BookID
WHERE BOOK_COPIES_BookID = 5 AND BOOK_COPIES_BranchID = 2
GO

EXEC dbo.getcopiesLostTribeSharpstown

DROP PROCEDURE dbo.getcopiesLostTribeSharpstown



--#2--------------------------------------
/*
SELECT 
	a1.Number_Of_Copies,
	b1.BranchName,
	c1.Title
	FROM tbl_BOOK_COPIES a1 
	INNER JOIN tbl_LIBRARY_BRANCH b1 ON b1.BranchID = a1.BOOK_COPIES_BranchID
	INNER JOIN tbl_BOOKS c1 ON c1.BookID = a1.BOOK_COPIES_BookID
	WHERE BOOK_COPIES_BookID = 5
;*/

CREATE PROCEDURE dbo.getcopiesLostTribeAnyLibrary
	@Number_Of_Copies int = NULL,
	@BranchName nvarchar(50) = NULL,
	@Title nvarchar(50) = NULL
AS
SELECT Number_Of_Copies, BranchName, Title
FROM tbl_BOOK_COPIES
INNER JOIN tbl_LIBRARY_BRANCH ON BranchID = BOOK_COPIES_BranchID
INNER JOIN tbl_BOOKS ON BookID = BOOK_COPIES_BookID
WHERE BOOK_COPIES_BookID = 5
GO

EXEC dbo.getcopiesLostTribeAnyLibrary

DROP PROCEDURE dbo.getcopiesLostTribeAnyLibrary



--#3----------------------------------------------
/*
SELECT BorrowerName 
FROM tbl_BORROWER 
WHERE CardNo NOT IN (SELECT BOOK_LOANS_CardNo FROM tbl_BOOK_LOANS)
*/

CREATE PROCEDURE dbo.getBorrowerNameNoCheckout
	@BorrowerName nvarchar(50) = NULL
AS
SELECT BorrowerName
FROM tbl_BORROWER 
WHERE CardNo NOT IN (SELECT BOOK_LOANS_CardNo FROM tbl_BOOK_LOANS)
GO

EXEC dbo.getBorrowerNameNoCheckout

DROP PROCEDURE dbo.getBorrowerNameNoCheckout



--#4-------------------------------------------
/*
SELECT 
	c1.Title, 
	b1.BorrowerName, 
	b1.BorrowerAddress 

	FROM tbl_BOOK_LOANS a1 
	INNER JOIN tbl_BORROWER b1 ON b1.CardNo = a1.BOOK_LOANS_CardNo
	INNER JOIN tbl_BOOKS c1 ON c1.BookID = a1.BOOK_LOANS_BookID
	WHERE BOOK_LOANS_BranchID = 2 AND DateDue = '3/19/2019'--DateDue set to 3/19/2019 to return a result to make sure it is working
;*/

CREATE PROCEDURE dbo.getSharpstownDateBorrowerInfo
	@Title nvarchar(50) = NULL,
	@BorrowerName nvarchar(50) = NULL,
	@BorrowerAddress nvarchar(50) = NULL
AS
SELECT Title, BorrowerName, BorrowerAddress
FROM tbl_BOOK_LOANS 
INNER JOIN tbl_BORROWER  ON CardNo = BOOK_LOANS_CardNo
INNER JOIN tbl_BOOKS  ON BookID = BOOK_LOANS_BookID
WHERE BOOK_LOANS_BranchID = 2 AND DateDue = '3/19/2019'--I would use the GETDATE() function but I formatted the dates differently in my tables
GO

EXEC dbo.getSharpstownDateBorrowerInfo

DROP PROCEDURE dbo.getSharpstownDateBorrowerInfo



--#5----------------------------------------------
/*
SELECT 
	a1.BranchName,
	--b1.BOOK_LOANS_BranchID AS 'BranchID',
	COUNT(*) AS 'Total Number of Loans:'
FROM tbl_BOOK_LOANS b1
INNER JOIN tbl_LIBRARY_BRANCH a1 ON a1.BranchID = b1.BOOK_LOANS_BranchID
GROUP BY /*b1.BOOK_LOANS_BranchID,*/ a1.BranchName
;*/


CREATE PROCEDURE dbo.getBranchNameTotalLoans
	@BranchName nvarchar(50) = NULL
AS SELECT BranchName, COUNT(BranchID) AS 'Total Number of Loans:'
FROM tbl_BOOK_LOANS
INNER JOIN tbl_LIBRARY_BRANCH ON BranchID = BOOK_LOANS_BranchID
GROUP BY /*b1.BOOK_LOANS_BranchID,*/ BranchName
GO

EXEC dbo.getBranchNameTotalLoans

DROP PROCEDURE dbo.getBranchNameTotalLoans



--#6-------------------------------------------
/*
SELECT 
	a1.BorrowerName,
	a1.BorrowerAddress,
	COUNT(*) AS 'Number of Books Checked Out:'
FROM tbl_BORROWER a1
INNER JOIN tbl_BOOK_LOANS b1 ON b1.BOOK_LOANS_CardNo = a1.CardNo

GROUP BY 
	/*b1.BOOK_LOANS_CardNo*/ a1.CardNo, a1.BorrowerName, a1.BorrowerAddress
HAVING
	COUNT(*) > 5
;*/


CREATE PROCEDURE dbo.getNameAddressCheckoutMoreThanFive
	@BorrowerName nvarchar(50) = NULL,
	@BorrowerAddress nvarchar(50) = NULL
AS SELECT BorrowerName, BorrowerAddress, COUNT(*) AS 'Number of Books Checked Out:'
FROM tbl_BORROWER
INNER JOIN tbl_BOOK_LOANS ON BOOK_LOANS_CardNo = CardNo
GROUP BY CardNo, BorrowerName, BorrowerAddress
HAVING COUNT(*) > 5
GO

EXEC dbo.getNameAddressCheckoutMoreThanFive

DROP PROCEDURE dbo.getNameAddressCheckoutMoreThanFive



--#7------------------------------------------------
/*
SELECT
	a1.Title, --tbl_BOOKS BookID
	b1.Number_Of_Copies --tbl_BOOK_COPIES 
FROM tbl_BOOKS a1
INNER JOIN tbl_BOOK_COPIES b1 ON b1.BOOK_COPIES_BookID = a1.BookID
Where BOOK_COPIES_BookID IN (3, 4) AND BOOK_COPIES_BranchID = 1
;*/


CREATE PROCEDURE dbo.getStephenKingTitleCopiesCentral
	@Title nvarchar(50) = NULL,
	@Number_Of_Copies int = NULL
AS SELECT Title, Number_Of_Copies
FROM tbl_BOOKS
INNER JOIN tbl_BOOK_COPIES ON BOOK_COPIES_BookID = BookID
WHERE BOOK_COPIES_BookID IN (3, 4) AND BOOK_COPIES_BranchID = 1
GO

EXEC dbo.getStephenKingTitleCopiesCentral 

DROP PROCEDURE dbo.getStephenKingTitleCopiesCentral
