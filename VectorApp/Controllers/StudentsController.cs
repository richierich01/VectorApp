using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Threading.Tasks;
using VectorApp.Models;
using VectorApp.Services;

namespace VectorApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentsController : ControllerBase
    {
        private readonly IStudentRepository studentRepository;
        private readonly ILogger<StudentsController> logger;

        public StudentsController(IStudentRepository studentRepository, ILogger<StudentsController> logger)
        {
            this.studentRepository = studentRepository;
            this.logger = logger;
        }

        [HttpGet]
        public async Task<IActionResult> GellAll()
        {
            try
            {
                var students = await studentRepository.GetAllStudents();
                return Ok(students);
            }
            catch (Exception ex)
            {
                logger.LogError($"Failed to get students: {ex}");
                return BadRequest("Failed to get students");
            }
        }

        [HttpGet]
        [Route("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            try
            {
                var student = await studentRepository.GetById(id);

                if (student != null) return Ok(student);
                else return NotFound();
            }
            catch (Exception ex)
            {
                logger.LogError($"Failed to get student: {ex}");
                return BadRequest("Failed to get student");
            }
        }

        [HttpPost]
        public async Task<IActionResult> Post(Student entity)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var id = await studentRepository.AddStudent(entity);

                    var student = entity;
                    student.Id = id;

                    return Created($"/api/students/{id}", student);
                }
                else
                {
                    return BadRequest(ModelState);
                }
            }
            catch (Exception ex)
            {
                logger.LogError($"Failed to save a new student: {ex}");
            }

            return BadRequest("Failed to save new student");
        }


        [HttpPut("{id}")]
        public async Task<IActionResult> Update(Student entity, int id)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var rowsAffected = await studentRepository.UpdateStudent(entity, id);
                    return Ok(entity);
                }
                else
                {
                    return BadRequest(ModelState);
                }
            }
            catch (Exception ex)
            {
                logger.LogError($"Failed to update student: {ex}");
            }

            return BadRequest("Failed to update student");
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            try
            {
                var rowsAffected = await studentRepository.DeleteStudent(id);

                if (rowsAffected > 0)
                    return Ok();
            }
            catch (Exception ex)
            {
                logger.LogError($"Failed to delete student: {ex}");
            }

            return BadRequest("Failed to delete student");
        }

    }
}
