using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using TimeTracker.Models;
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

        [HttpGet, Route("{id}")]
        public HttpResponseMessage Get(int id, int timeFrame)
        {
            var shiftRepository = new ShiftRepository();
            List<Shift> getAllShifts;

            if (timeFrame == 0)
            {
                getAllShifts = shiftRepository.getAllShifts(id, 7);
                return Request.CreateResponse(HttpStatusCode.Created);
            }

            getAllShifts = shiftRepository.getAllShifts(id, timeFrame);
            return Request.CreateResponse(HttpStatusCode.Created);

        }
    }
}
