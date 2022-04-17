using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace backend.Models
{
    public class Project
    {
        [Key]
        public int ProjectId { get; set; }

        public string ProjectName { get; set; }

        public DateTime ProjectStart { get; set; }

        public DateTime ProjectStop { get; set; }

        public string ProjectDuration { get; set; }
    }
}
