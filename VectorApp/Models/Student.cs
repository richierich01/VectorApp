using System.ComponentModel.DataAnnotations;

namespace VectorApp.Models
{
    public class Student
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        [Required]
        public string LastName { get; set; }
        [Required]
        [EmailAddress]
        public string Email { get; set; }

        internal bool IsNew => (this.Id == default(int));
    }
}
