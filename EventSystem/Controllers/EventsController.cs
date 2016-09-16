using EventSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace EventSystem.Controllers
{
    [RoutePrefix ("api/Events")]
    public class EventsController : ApiController
    {
        DataContext db = new DataContext();

        [HttpGet]
        public List<Events> GetAll()
        {
            return db.Events.OrderBy(c => c.Id).ToList();

        }

        [HttpGet]
        public IHttpActionResult GetById(int Id)
            {

            Events events = db.Events.Where(c => c.Id == Id).FirstOrDefault();

            if (events == null)
            {
                return NotFound();

            }
            return Ok(events);
        }

        [Route("search")]
        public List<Events> GetEventsByName(string name, string cat)
        {
            var data = db.Events.Where(p => name != null ? p.Name.Contains(name) : true && cat != null ? p.FK_Category.ToString() == cat : true).ToList();
            return data;


        }
    }
}
