using Dapper;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Threading.Tasks;
using VectorApp.Models;
using VectorApp.Services.Queries;

namespace VectorApp.Services
{
    public class StudentRepository : BaseRepository, IStudentRepository
    {
        private readonly ICommandText commandText;

        public StudentRepository(IConfiguration configuration, ICommandText commandText) : base(configuration)
        {
            this.commandText = commandText;
        }

        public async Task<IEnumerable<Student>> GetAllStudents()
        {
            return await WithConnection(async conn =>
            {
                var students = await conn.QueryAsync<Student>(commandText.GetStudents);
                return students;
            });
        }

        public async ValueTask<Student> GetById(int id)
        {
            return await WithConnection(async conn =>
            {
                var student = await conn.QueryFirstOrDefaultAsync<Student>(commandText.GetStudentById, new { Id = id });

                return student;
            });

        }

        public async Task<int> AddStudent(Student entity)
        {
            return await WithConnection(async conn =>
            {
                var id =  await conn.QuerySingleAsync<int>(commandText.AddStudent,
                    new { entity.FirstName, entity.MiddleName, entity.LastName, entity.Email });

                return id;
            });

        }
        public async Task<int> UpdateStudent(Student entity, int id)
        {
            return await WithConnection(async conn =>
            {
                var rowsAffected = await conn.ExecuteAsync(commandText.UpdateStudent,
                   new { entity.FirstName, entity.MiddleName, entity.LastName, entity.Email, entity.Id });

                return rowsAffected;
            });
        }
        public async Task<int> DeleteStudent(int id)
        {
            return await WithConnection(async conn =>
            {
                var rowsAffected = await conn.ExecuteAsync(commandText.DeleteStudent, new { Id = id });

                return rowsAffected;
            });
        }
    }
}
