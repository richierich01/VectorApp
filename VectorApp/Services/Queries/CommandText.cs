namespace VectorApp.Services.Queries
{
    public class CommandText : ICommandText
    {
        public string GetStudents => "Select * from [dbo].[Students]";
        public string GetStudentById => "Select * from [dbo].[Students] where Id= @Id";
        public string AddStudent => "Insert into [dbo].[Students] (FirstName, MiddleName, LastName, Email) OUTPUT INSERTED.[Id] values (@FirstName, @MiddleName, @LastName, @Email)";
        public string UpdateStudent => "Update [dbo].[Students] set FirstName = @FirstName, MiddleName = @MiddleName, LastName = @LastName, Email = @Email where Id =@Id";
        public string DeleteStudent => "Delete from [dbo].[Students] where Id= @Id";
        public string GetStudentByIdSp => "GetStudentById";

        public string GetAllCourses => "SELECT Id, CourseName, Content FROM dbo.Courses";
        public string AddStudentCourse => "Insert into  [dbo].[StudentCourses] (StudentId, CourseId) OUTPUT INSERTED.[Id] values (@StudentId, @CourseId)";

        public string DeleteStudentCourseByCourseId => "DELETE FROM dbo.StudentCourses WHERE Id = @Id";

        public string DeleteStudentCoursesByStudentId => "DELETE FROM dbo.StudentCourses WHERE StudentId = @StudentId";

        public string GetStudentCourseByStudentId => "SELECT Id, StudentId, CourseId FROM dbo.StudentCourses WHERE StudentId = @StudentId";
    }
}
