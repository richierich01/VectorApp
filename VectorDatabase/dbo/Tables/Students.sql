CREATE TABLE [dbo].[Students]
(
	[Id] INT IDENTITY (1, 1) NOT NULL, 
    [FirstName] VARCHAR (50) NOT NULL, 
    [MiddleName] VARCHAR(50) NULL, 
    [LastName] VARCHAR(50) NOT NULL, 
    [Email] VARCHAR(100) NOT NULL, 
    CONSTRAINT [PK_Students] PRIMARY KEY ([Id])
)
