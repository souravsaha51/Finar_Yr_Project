-- Create the database if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = 'university_database')
BEGIN
    CREATE DATABASE university_database;
END;
GO

-- Switch to the new database context
USE university_database;
GO

-- Table 1: Departments
CREATE TABLE Departments (
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    CONSTRAINT UK_Departments_DepartmentName UNIQUE (DepartmentName)
);

-- Table 2: Students
CREATE TABLE Students (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    RegistrationNo VARCHAR(20) NOT NULL,
    EnrollmentNo VARCHAR(20) NOT NULL,
    DepartmentID INT,
    CurrentSemester INT,
    Email VARCHAR(100),
    Address VARCHAR(200),
    CONSTRAINT UK_Students_EnrollmentNo UNIQUE (EnrollmentNo),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Table 3: Courses
CREATE TABLE Courses (
    CourseID INT IDENTITY(1,1) PRIMARY KEY,
    CourseCode VARCHAR(20) NOT NULL,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT NOT NULL,
    DepartmentID INT,
    CONSTRAINT UK_Courses_UniqueCombination UNIQUE (CourseCode, CourseName, DepartmentID),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Table 4: Semesters
CREATE TABLE Semesters (
    SemesterID INT IDENTITY(1,1) PRIMARY KEY,
    SemesterName VARCHAR(50) NOT NULL,
    AcademicYear VARCHAR(10) NOT NULL,
    CONSTRAINT UK_Semesters_SemesterName UNIQUE (SemesterName)
);

-- Table 5: Marks
CREATE TABLE Marks (
    MarksID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    SemesterID INT,
    MarksObtained INT,
    Grade VARCHAR(2) NOT NULL,
    DateOfExamination DATE,
    DateOfResultPublication DATE,
    CONSTRAINT CHK_MarksObtained CHECK (MarksObtained BETWEEN 0 AND 100),
    CONSTRAINT UK_Marks_UniqueCombination UNIQUE (StudentID, CourseID, SemesterID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (SemesterID) REFERENCES Semesters(SemesterID)
);

-- Table 6: SemesterResults
CREATE TABLE SemesterResults (
    ResultID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT,
    SemesterID INT,
    SGPA DECIMAL(4, 2) NOT NULL,
    CGPA DECIMAL(4, 2) NOT NULL,
    CONSTRAINT UK_SemesterResults_UniqueCombination UNIQUE (StudentID, SemesterID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (SemesterID) REFERENCES Semesters(SemesterID)
);