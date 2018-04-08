using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using TimeTracker.Services;

namespace TimeTracker.Controllers
{
    [RoutePrefix("api/shifts")]
    public class ShiftsController : ApiController
    {
        [HttpPost, Route("")]
        public HttpResponseMessage Create(ShiftDto shift)
        {
            var shiftRepository = new ShiftRepository();
            var shiftToInsert = new Shift
            {
                EmployeeId = shift.EmployeeId,
                ManagerId = shift.ManagerId,
                WorkFromHome = shift.WorkFromHome,
                Callout = shift.Callout,
                Planned = shift.Planned,
                ShiftLengthId = shift.ShiftLengthId,
                Email = shift.Email,
                Phone = shift.Phone,
                Integrations = shift.Integrations,
                NonCoverage = shift.NonCoverage
            };

            var addShift = shiftRepository.AddShift(shiftToInsert);

            if (addShift)
                return Request.CreateResponse(HttpStatusCode.Created);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Unable to add shift. Please try again later.");
        }
    }

    public class ShiftDto
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
