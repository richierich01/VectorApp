namespace VectorApp.Services.Queries
{
    public interface ICommandText
    {
        string AddStudent { get; }
        string AddStudentCourse { get; }
        string DeleteStudentCourseByCourseId { get; }
        string DeleteStudentCoursesByStudentId { get; }
        string GetAllCourses { get; }
        string GetStudentCourseByStudentId { get; }
        string GetStudentById { get; }
        string GetStudentByIdSp { get; }
        string GetStudents { get; }
        string DeleteStudent { get; }
        string UpdateStudent { get; }
    }
}