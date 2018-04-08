using Dapper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace TimeTracker.Services
{
    public class ShiftRepository
    {
        public bool AddShift(Shift shift)
        {
            using (var db = createConnection())
            {
                db.Open();

                var newShift = db.Execute(@"INSERT INTO Shifts
                                                       (EmployeeId
                                                       ,ManagerId
                                                       ,WorkFromHome
                                                       ,Callout
                                                       ,Planned
                                                       ,ShiftLengthId
                                                       ,Email
                                                       ,Phone
                                                       ,Integrations
                                                       ,NonCoverage)
                                                 VALUES
                                                       (
                                                        @employeeId
                                                       ,@managerId
                                                       ,@workFromHome
                                                       ,@callout
                                                       ,@planned
                                                       ,@shiftLengthId
                                                       ,@email
                                                       ,@phone
                                                       ,@integrations
                                                       ,@nonCoverage)", shift);

                return newShift == 1;
            }
        }

        private SqlConnection createConnection()
        {
            return new SqlConnection(ConfigurationManager.ConnectionStrings["Main"].ConnectionString);
        }
    }

    public class Shift
    {
        public int EmployeeId { get; set; }
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