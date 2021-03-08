using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Linq;
using System.Threading.Tasks;
using VectorApp.Models;
using VectorApp.Services;

namespace VectorApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CoursesController : ControllerBase
    {
        private readonly ICoursesRepository coursesRepository;
        private readonly ILogger<CoursesController> logger;

        public CoursesController(ICoursesRepository coursesRepository, ILogger<CoursesController> logger)
        {
            this.coursesRepository = coursesRepository;
            this.logger = logger;
        }

        [HttpGet]
        public async Task<IActionResult> GellAllCourses()
        {
            try
            {
                var courses = await coursesRepository.GetAllCourses();
                return Ok(courses);
            }
            catch (Exception ex)
            {
                logger.LogError($"Failed to get orders: {ex}");
                return BadRequest("Failed to get orders");
            }
        }

        [HttpGet("student/{studentId}")]
        public async Task<IActionResult> GetStudentCoursesByStudentId(int studentId)
        {
            try
            {
                var studentCourses = await coursesRepository.GetStudentCourseByStudentId(studentId);
           
                if (studentCourses != null) return Ok(studentCourses);
                else return NotFound();
            }
            catch (Exception ex)
            {
                logger.LogError($"Failed to get student course: {ex}");
                return BadRequest("Failed to get student course");
            }
        }

        [HttpPut("student")]
        public async Task<IActionResult> Update(StudentCourse[] entities)
        {
            try
            {
                var studentId = entities.First().StudentId;

                await coursesRepository.DeleteStudentCoursesByStudentId(studentId);

                foreach (var item in entities)
                    await coursesRepository.AddStudentCourse(item);

                var studentCourses = await coursesRepository.GetStudentCourseByStudentId(studentId);

                return Ok(studentCourses);
            }
            catch (Exception ex)
            {
                logger.LogError($"Failed to update student courses: {ex}");
            }

            return BadRequest("Failed to update student courses");
        }
    

        [HttpDelete("student/{studentId}")]
        public async Task<IActionResult> DeleteStudentCoursesByStudentId(int studentId)
        {
            try
            {
                var rowsAffected = await coursesRepository.DeleteStudentCoursesByStudentId(studentId);

                if (rowsAffected > 0)
                    return Ok();
            }
            catch (Exception ex)
            {
                logger.LogError($"Failed to delete student courses by student id: {ex}");
            }

            return BadRequest("Failed to delete student courses");
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteStudentCourseByCourseId(int courseId)
        {
            try
            {
                var rowsAffected = await coursesRepository.DeleteStudentCourseByCourseId(courseId);
              
                if (rowsAffected > 0)
                    return Ok();
            }
            catch (Exception ex)
            {
                logger.LogError($"Failed to delete student courses by student id: {ex}");
            }

            return BadRequest("Failed to delete student courses");
        }
    }
}
