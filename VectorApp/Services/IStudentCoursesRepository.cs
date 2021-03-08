using System.Threading.Tasks;
using VectorApp.Models;

namespace VectorApp.Services
{
    public interface IStudentCoursesRepository
    {
        Task AddStudentCourse(StudentCourse entity);
    }
}