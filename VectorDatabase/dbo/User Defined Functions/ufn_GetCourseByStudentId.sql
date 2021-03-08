CREATE FUNCTION dbo.ufn_GetCourseByStudentId (@StudentId INT)  
RETURNS VARCHAR(200)
BEGIN
    
    DECLARE @courses VARCHAR(200)

    SET @courses = (SELECT STUFF( (SELECT ',' + CourseName 
               FROM dbo.View_StudentCourses p2
               WHERE p2.StudentId = p1.StudentId
               ORDER BY CourseName
               FOR XML PATH(''), TYPE).value('.', 'varchar(max)')
            ,1,1,'')
      AS Courses
      FROM dbo.View_StudentCourses p1 
      WHERE p1.StudentId = @StudentId
      GROUP BY p1.StudentId)

    RETURN @courses
END
