using System.Collections.Generic;
using System.Threading.Tasks;
using VectorApp.Models;

namespace VectorApp.Services
{
    public interface ICoursesRepository
    {
        Task<int> AddStudentCourse(StudentCourse entity);
        Task<int> DeleteStudentCourseByCourseId(int id);
        Task<int> DeleteStudentCoursesByStudentId(int studentId);
        Task<IEnumerable<Course>> GetAllCourses();
        Task<IEnumerable<StudentCourse>> GetStudentCourseByStudentId(int studentId);
    }
}