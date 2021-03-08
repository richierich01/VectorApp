CREATE VIEW [dbo].[View_StudentCourses]
AS 
SELECT SC.StudentId, C.CourseName 
FROM dbo.Courses C
INNER JOIN dbo.StudentCourses SC ON C.Id = SC.CourseId
