using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TimeTracker.Models
{
    public class ShiftDto
    {
        public int EmployeeId { get; set; }
        public DateTime Date { get; set; }
        public int ManagerId { get; set; }
        public bool WorkFromHome { get; set; }
        public bool Callout { get; set; }
        public bool Planned { get; set; }
        public int ShiftLengthId { get; set; }
        public bool Email { get; set; }
        public bool Phone { get; set; }
        public bool Integrations { get; set; }
        public bool NonCoverage { get; set; }
    }
}