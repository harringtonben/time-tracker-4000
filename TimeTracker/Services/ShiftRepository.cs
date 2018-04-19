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
}