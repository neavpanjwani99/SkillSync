-- =========================================================
-- SkillSync Database Setup Script
-- Database Name: Neav.SkillSync
-- Created for ASP.NET Web Forms Practical Backend
-- =========================================================

-- Create Database if it does not exist
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Neav.SkillSync')
BEGIN
    CREATE DATABASE [Neav.SkillSync];
END
GO

USE [Neav.SkillSync];
GO

-- 1. USERS TABLE
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'USERS')
BEGIN
    CREATE TABLE USERS (
        UserID INT IDENTITY(1,1) PRIMARY KEY,
        FullName VARCHAR(50) NOT NULL,
        Email VARCHAR(50) NOT NULL UNIQUE,
        Password VARCHAR(50) NOT NULL,
        UserType VARCHAR(50) NOT NULL, -- Client, Freelancer, Admin
        Location VARCHAR(50) NULL,
        Status VARCHAR(50) DEFAULT 'Active',
        CreatedDate DATETIME DEFAULT GETDATE()
    );
END
GO

-- 2. CATEGORIES TABLE
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'CATEGORIES')
BEGIN
    CREATE TABLE CATEGORIES (
        CategoryID INT IDENTITY(1,1) PRIMARY KEY,
        CategoryName VARCHAR(50) NOT NULL,
        Description VARCHAR(255) NULL,
        IconCode VARCHAR(50) NULL
    );
END
GO

-- 3. SERVICES TABLE
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'SERVICES')
BEGIN
    CREATE TABLE SERVICES (
        ServiceID INT IDENTITY(1,1) PRIMARY KEY,
        FreelancerID INT NOT NULL,
        CategoryID INT NOT NULL,
        ServiceTitle VARCHAR(100) NOT NULL,
        Description VARCHAR(255) NULL,
        Price INT NOT NULL,
        DeliveryDays INT NOT NULL,
        ExperienceYears INT NOT NULL,
        Status VARCHAR(50) DEFAULT 'Active',
        CONSTRAINT freelancerIDFK FOREIGN KEY (FreelancerID) REFERENCES USERS(UserID),
        CONSTRAINT CategoryIDfk FOREIGN KEY (CategoryID) REFERENCES CATEGORIES(CategoryID)
    );
END
GO

-- 4. FREELANCER_SKILLS TABLE
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'FREELANCER_SKILLS')
BEGIN
    CREATE TABLE FREELANCER_SKILLS (
        SkillID INT IDENTITY(1,1) PRIMARY KEY,
        FreelancerID INT NOT NULL,
        SkillName VARCHAR(50) NOT NULL,
        CONSTRAINT freelancerIDFK1 FOREIGN KEY (FreelancerID) REFERENCES USERS(UserID)
    );
END
GO

-- 5. PROJECT_REQUIREMENTS TABLE
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'PROJECT_REQUIREMENTS')
BEGIN
    CREATE TABLE PROJECT_REQUIREMENTS (
        RequirementID INT IDENTITY(1,1) PRIMARY KEY,
        ClientID INT NOT NULL,
        CategoryID INT NOT NULL,
        RequiredSkills VARCHAR(255) NULL,
        MinBudget INT NOT NULL,
        MaxBudget INT NOT NULL,
        DeliveryDays INT NOT NULL,
        ExperienceRequired VARCHAR(50) NULL,
        Location VARCHAR(50) NULL,
        WorkMode VARCHAR(50) NULL,
        PriorityFilter VARCHAR(50) NULL,
        CreatedDate DATETIME DEFAULT GETDATE(),
        CONSTRAINT ClientIDfk FOREIGN KEY (ClientID) REFERENCES USERS(UserID),
        CONSTRAINT CategoryIDfk1 FOREIGN KEY (CategoryID) REFERENCES CATEGORIES(CategoryID)
    );
END
GO

-- 6. ORDERS TABLE
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'ORDERS')
BEGIN
    CREATE TABLE ORDERS (
        OrderID INT IDENTITY(1,1) PRIMARY KEY,
        ClientID INT NOT NULL,
        FreelancerID INT NOT NULL,
        ServiceID INT NOT NULL,
        OrderDate DATETIME DEFAULT GETDATE(),
        TotalAmount INT NOT NULL,
        Status VARCHAR(50) DEFAULT 'Pending',
        CONSTRAINT ClientIDfk1 FOREIGN KEY (ClientID) REFERENCES USERS(UserID),
        CONSTRAINT FreelancerIDfk3 FOREIGN KEY (FreelancerID) REFERENCES USERS(UserID),
        CONSTRAINT ServiceIDfk FOREIGN KEY (ServiceID) REFERENCES SERVICES(ServiceID)
    );
END
GO

-- SEED INITIAL SAMPLE DATA
-- Insert Default Admin User if not exists
IF NOT EXISTS (SELECT * FROM USERS WHERE Email = 'admin@skillsync.com')
BEGIN
    INSERT INTO USERS (FullName, Email, Password, UserType, Location, Status)
    VALUES ('Neav Panjwani', 'admin@skillsync.com', 'admin123', 'Admin', 'Mumbai', 'Active');
END

-- Insert Default Client User if not exists
IF NOT EXISTS (SELECT * FROM USERS WHERE Email = 'client@gmail.com')
BEGIN
    INSERT INTO USERS (FullName, Email, Password, UserType, Location, Status)
    VALUES ('Manya Nirvan', 'client@gmail.com', 'client123', 'Client', 'Delhi', 'Active');
END

-- Insert Default Freelancer Users if not exists
IF NOT EXISTS (SELECT * FROM USERS WHERE Email = 'aarav@skillsync.com')
BEGIN
    INSERT INTO USERS (FullName, Email, Password, UserType, Location, Status)
    VALUES ('Aarav Mehta', 'aarav@skillsync.com', 'free123', 'Freelancer', 'Mumbai', 'Active'),
           ('Riya Shah', 'riya@skillsync.com', 'free123', 'Freelancer', 'Bangalore', 'Active'),
           ('Vikram Malhotra', 'vikram@skillsync.com', 'free123', 'Freelancer', 'Pune', 'Active'),
           ('Ananya Verma', 'ananya@skillsync.com', 'free123', 'Freelancer', 'Delhi', 'Active');
END

-- Insert Default Categories
IF NOT EXISTS (SELECT * FROM CATEGORIES)
BEGIN
    INSERT INTO CATEGORIES (CategoryName, Description, IconCode)
    VALUES ('Web Development', 'Full-stack web applications and API design', 'code'),
           ('Mobile App Development', 'iOS and Android app development', 'smartphone'),
           ('UI/UX Design', 'Figma prototypes and web UI design', 'palette'),
           ('Graphic Design', 'Branding, logos, and vector illustrations', 'brush'),
           ('Digital Marketing', 'SEO, social media management, and ads', 'trending-up');
END

-- Insert Default Services
IF NOT EXISTS (SELECT * FROM SERVICES)
BEGIN
    INSERT INTO SERVICES (FreelancerID, CategoryID, ServiceTitle, Description, Price, DeliveryDays, ExperienceYears, Status)
    VALUES (3, 1, 'Custom React & ASP.NET Web Applications', 'Full-stack modern web application development with responsive UI.', 8500, 5, 4, 'Active'),
           (4, 3, 'Modern UI/UX Design & Interactive Prototypes', 'Clean user-centric Figma designs and design systems.', 5200, 3, 3, 'Active'),
           (5, 1, 'Enterprise Backend APIs & Database Optimization', 'High-performance SQL Server database and C# API architecture.', 9500, 7, 5, 'Active'),
           (6, 4, 'Brand Identity Design & Minimalist Logos', 'Complete brand identity kit with vector logos and style guides.', 4000, 2, 2, 'Active');
END
GO
