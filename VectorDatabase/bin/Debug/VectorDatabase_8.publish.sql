﻿/*
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
PRINT N'Creating [dbo].[View_StuentCourses]...';


GO
CREATE VIEW [dbo].[View_StuentCourses]
AS 
SELECT SC.StudentId, C.CourseName 
FROM dbo.Courses C
INNER JOIN dbo.StudentCourses SC ON C.Id = SC.CourseId
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

DELETE FROM [dbo].[Courses];

SET IDENTITY_INSERT [dbo].[Courses] ON;

INSERT INTO [Courses] ([Id], [CourseName], [Content])VALUES (1, 'Maths', 'Here we teach Maths');
INSERT INTO [Courses] ([Id], [CourseName], [Content])VALUES (2, 'English', 'Here we teach English');
INSERT INTO [Courses] ([Id], [CourseName], [Content])VALUES (3, 'Biology', 'Here we teach Biology');
INSERT INTO [Courses] ([Id], [CourseName], [Content])VALUES (4, 'Chemistory', 'Here we teach Chemistory');
INSERT INTO [Courses] ([Id], [CourseName], [Content])VALUES (5, 'Physics', 'Here we teach Physics');

SET IDENTITY_INSERT [dbo].[Courses] OFF;

DELETE FROM [dbo].[Students];

SET IDENTITY_INSERT [dbo].[Students] ON;

INSERT INTO [dbo].[Students] ([Id], [FirstName], [MiddleName], [LastName], [Email]) VALUES (1, 'Jordan', 'Michael', 'Goat', 'michael@bulls.com');
INSERT INTO [dbo].[Students] ([Id], [FirstName], [MiddleName], [LastName], [Email]) VALUES (2, 'LaBron', null, 'James', 'labron@lakers.com');
INSERT INTO [dbo].[Students] ([Id], [FirstName], [MiddleName], [LastName], [Email]) VALUES (3, 'Giannis', 'Greek', 'Antetokounmpo', 'giannis@bucks.com');
INSERT INTO [dbo].[Students] ([Id], [FirstName], [MiddleName], [LastName], [Email]) VALUES (4, 'Kevin', 'Samson', 'Durant', 'kevin@warriors.com');
INSERT INTO [dbo].[Students] ([Id], [FirstName], [MiddleName], [LastName], [Email]) VALUES (5, 'Kyrie', 'Drew', 'Irving', 'kyrie@celtics.com');
INSERT INTO [dbo].[Students] ([Id], [FirstName], [MiddleName], [LastName], [Email]) VALUES (6, 'James', 'King', 'Harden', 'james@rockets.com');

SET IDENTITY_INSERT [dbo].[Students] OFF;

DELETE FROM [dbo].[StudentCourses];

SET IDENTITY_INSERT [dbo].[StudentCourses] ON;

INSERT INTO [dbo].[StudentCourses] ([Id], [StudentId], [CourseId]) VALUES (1, 1, 1);
INSERT INTO [dbo].[StudentCourses] ([Id], [StudentId], [CourseId]) VALUES (2, 1, 2);
INSERT INTO [dbo].[StudentCourses] ([Id], [StudentId], [CourseId]) VALUES (3, 1, 5);
INSERT INTO [dbo].[StudentCourses] ([Id], [StudentId], [CourseId]) VALUES (4, 2, 2);
INSERT INTO [dbo].[StudentCourses] ([Id], [StudentId], [CourseId]) VALUES (5, 2, 4);
INSERT INTO [dbo].[StudentCourses] ([Id], [StudentId], [CourseId]) VALUES (6, 3, 1);
INSERT INTO [dbo].[StudentCourses] ([Id], [StudentId], [CourseId]) VALUES (7, 4, 4);
INSERT INTO [dbo].[StudentCourses] ([Id], [StudentId], [CourseId]) VALUES (8, 4, 5);
INSERT INTO [dbo].[StudentCourses] ([Id], [StudentId], [CourseId]) VALUES (9, 4, 1);
INSERT INTO [dbo].[StudentCourses] ([Id], [StudentId], [CourseId]) VALUES (10, 6, 2);

SET IDENTITY_INSERT [dbo].[StudentCourses] OFF;

GO

GO
PRINT N'Update complete.';


GO
