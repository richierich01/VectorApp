using System.ComponentModel.DataAnnotations;

namespace VectorApp.Models
{
    public class Course
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public string CourseName { get; set; }
        public string Content { get; set; }
    }
}
