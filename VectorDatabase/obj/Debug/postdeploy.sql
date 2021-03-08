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
INSERT INTO [Courses] ([Id], [CourseName], [Content])VALUES (4, 'Chemistry', 'Here we teach Chemistry');
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
