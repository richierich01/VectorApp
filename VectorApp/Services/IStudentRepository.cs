using System.Collections.Generic;
using System.Threading.Tasks;
using VectorApp.Models;

namespace VectorApp.Services
{
    public interface IStudentRepository
    {
        Task<int> AddStudent(Student entity);
        Task<IEnumerable<Student>> GetAllStudents();
        ValueTask<Student> GetById(int id);
        Task<int> DeleteStudent(int id);
        Task<int> UpdateStudent(Student entity, int id);
    }
}