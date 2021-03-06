/*
Deployment script for VectorDB

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "VectorDB"
:setvar DefaultFilePrefix "VectorDB"
:setvar DefaultDataPath "C:\Users\richi\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\richi\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
/*
The column [dbo].[Students].[CourseId] is being dropped, data loss could occur.
*/

IF EXISTS (select top 1 1 from [dbo].[Students])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
PRINT N'Dropping [dbo].[FK_Students_ToCourses]...';


GO
ALTER TABLE [dbo].[Students] DROP CONSTRAINT [FK_Students_ToCourses];


GO
PRINT N'Altering [dbo].[Students]...';


GO
ALTER TABLE [dbo].[Students] DROP COLUMN [CourseId];


GO
PRINT N'Creating [dbo].[StudentCourses]...';


GO
CREATE TABLE [dbo].[StudentCourses] (
    [Id]        INT IDENTITY (1, 1) NOT NULL,
    [StudentId] INT NOT NULL,
    [CourseId]  INT NOT NULL,
    CONSTRAINT [PK_StudentCourses] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

INSERT INTO [Courses] ([Id], [CourseName], [Content])VALUES (1, 'Maths', 'Here we teach Maths');
INSERT INTO [Courses] ([Id], [CourseName], [Content])VALUES (2, 'English', 'Here we teach English');
INSERT INTO [Courses] ([Id], [CourseName], [Content])VALUES (3, 'Biology', 'Here we teach Biology');
INSERT INTO [Courses] ([Id], [CourseName], [Content])VALUES (4, 'Chemistory', 'Here we teach Chemistory');
INSERT INTO [Courses] ([Id], [CourseName], [Content])VALUES (5, 'Physics', 'Here we teach Physics');

--INSERT INTO [Students] VALUES (null, 'Jordan', 'Michael', 'Goat', 'michael@bulls.com');
--INSERT INTO [Students] VALUES ('LaBron', 'James', 'labron@lakers.com', 'Los Angeles Lakers', 'King James');
--INSERT INTO [Students] VALUES ('Giannis', 'Antetokounmpo', 'giannis@bucks.com', 'Milwaukee Bucks', 'The Greek Freak');
--INSERT INTO [Students] VALUES ('Kevin', 'Durant', 'kevin@warriors.com', 'Golden State Warriors', 'KD');
--INSERT INTO [Students] VALUES ('Kyrie', 'Irving', 'kyrie@celtics.com', 'Boston Celtics', 'Uncle Drew');
--INSERT INTO [Students] VALUES ('James', 'Harden', 'james@rockets.com', 'Houston Rockets', 'The Beard');
GO

GO
PRINT N'Update complete.';


GO
