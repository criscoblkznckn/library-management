-- Step 1: Create the database
CREATE DATABASE LibraryDB;

-- Step 2: Use the new database
USE LibraryDB;

-- Step 3: Create a table for members
CREATE TABLE Members (
  MemberID INT AUTO_INCREMENT PRIMARY KEY,
  FullName VARCHAR(100) NOT NULL,
  Email VARCHAR(100) NOT NULL UNIQUE,
  PhoneNumber VARCHAR(20),
  JoinDate DATE
);

-- Step 4: Create a table for books
CREATE TABLE Books (
  BookID INT AUTO_INCREMENT PRIMARY KEY,
  Title VARCHAR(150) NOT NULL,
  Author VARCHAR(100),
  ISBN VARCHAR(20) UNIQUE,
  PublishedYear YEAR,
  AvailableCopies INT
);

-- Step 5: Create a table for librarians
CREATE TABLE Librarians (
  LibrarianID INT AUTO_INCREMENT PRIMARY KEY,
  FullName VARCHAR(100) NOT NULL,
  Email VARCHAR(100) NOT NULL UNIQUE
);

-- Step 6: Create a table to record book borrowings
CREATE TABLE BorrowRecords (
  RecordID INT AUTO_INCREMENT PRIMARY KEY,
  MemberID INT,
  BookID INT,
  LibrarianID INT,
  BorrowDate DATE,
  ReturnDate DATE,
  FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
  FOREIGN KEY (BookID) REFERENCES Books(BookID),
  FOREIGN KEY (LibrarianID) REFERENCES Librarians(LibrarianID)
);

-- Step 7: Create a table for book categories (like Fiction, Science, etc.)
CREATE TABLE Categories (
  CategoryID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL UNIQUE
);

-- Step 8: Create a link table to connect books with categories (Many-to-Many)
CREATE TABLE BookCategories (
  BookID INT,
  CategoryID INT,
  PRIMARY KEY (BookID, CategoryID),
  FOREIGN KEY (BookID) REFERENCES Books(BookID),
  FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
