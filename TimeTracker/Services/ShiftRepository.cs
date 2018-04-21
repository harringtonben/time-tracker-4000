using Dapper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using TimeTracker.Models;

namespace TimeTracker.Services
{
    public class ShiftRepository
    {
        public bool AddShift(Shift shift)
        {
            using (var db = CreateConnection())
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

        public List<Shift> getAllShifts(int id, int timeFrame)
        {
            using (var db = CreateConnection())
            {
                db.Open();

                var result = db.Query<Shift>(@"select s.*, e.name from Shifts s
                                               join Employees e on e.employeeid = s.employeeid
                                               where s.EmployeeId = @id
                                               and date > getdate() - @timeFrame", new { id, timeFrame }).ToList();

                return result;
            }   
        }

        public List<Shift> GetWfhShifts(int id, int timeFrame)
        {
            using (var db = CreateConnection())
            {
                db.Open();

                var result = db.Query<Shift>(@"select s.*, e.name from Shifts s
                                               join Employees e on e.employeeid = s.employeeid
                                               where s.EmployeeId = @id
                                               and date > getdate() - @timeFrame
                                               and WorkFromHome = 1", new { id, timeFrame}).ToList();

                return result;
            }
        }

        private SqlConnection CreateConnection()
        {
            return new SqlConnection(ConfigurationManager.ConnectionStrings["Main"].ConnectionString);
        }
    }
}