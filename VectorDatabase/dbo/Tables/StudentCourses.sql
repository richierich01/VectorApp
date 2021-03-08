CREATE TABLE [dbo].[StudentCourses]
(
	[Id] INT IDENTITY (1, 1) NOT NULL, 
    [StudentId] INT NOT NULL, 
    [CourseId] INT NOT NULL, 
    CONSTRAINT [PK_StudentCourses] PRIMARY KEY ([Id])
)