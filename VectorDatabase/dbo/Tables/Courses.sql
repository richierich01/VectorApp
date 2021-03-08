CREATE TABLE [dbo].[Courses]
(
	[Id] INT  IDENTITY (1, 1) NOT NULL, 
    [CourseName] VARCHAR(100) NOT NULL, 
    [Content] VARCHAR(1000) NULL, 
    CONSTRAINT [PK_Courses] PRIMARY KEY ([Id])
)
