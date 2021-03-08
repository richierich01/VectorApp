using Dapper;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Threading.Tasks;
using VectorApp.Models;
using VectorApp.Services.Queries;

namespace VectorApp.Services
{
    public class CoursesRepository : BaseRepository, ICoursesRepository
    {
        private readonly ICommandText commandText;

        public CoursesRepository(IConfiguration configuration, ICommandText commandText) : base(configuration)
        {
            this.commandText = commandText;
        }

        public async Task<IEnumerable<Course>> GetAllCourses()
        {
            return await WithConnection(async conn =>
            {
                var query = await conn.QueryAsync<Course>(commandText.GetAllCourses);
                return query;
            });
        }

        public async Task<IEnumerable<StudentCourse>> GetStudentCourseByStudentId(int studentId)
        {
            return await WithConnection(async conn =>
            {
                var query = await conn.QueryAsync<StudentCourse>(commandText.GetStudentCourseByStudentId, new { StudentId = studentId });
                return query;
            });

        }

        public async Task<int> AddStudentCourse(StudentCourse entity)
        {
            return await WithConnection(async conn =>
            {
                var id =  await conn.QuerySingleAsync<int>(commandText.AddStudentCourse, new { entity.StudentId, entity.CourseId });

                return id;
            });

        }

        public async Task<int> DeleteStudentCoursesByStudentId(int studentId)
        {
            return await WithConnection(async conn =>
            {
                var rowsAffected = await conn.ExecuteAsync(commandText.DeleteStudentCoursesByStudentId, new { StudentId = studentId });

                return rowsAffected;
            });
        }

        public async Task<int> DeleteStudentCourseByCourseId(int id)
        {
            return await WithConnection(async conn =>
            {
                return await conn.ExecuteAsync(commandText.DeleteStudentCourseByCourseId, new { Id = id });
            });
        }


    }
}
