using System.ComponentModel.DataAnnotations;

namespace VectorApp.Models
{
    public class StudentCourse
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public int StudentId { get; set; }
        [Required]
        public int CourseId { get; set; }
    }
}