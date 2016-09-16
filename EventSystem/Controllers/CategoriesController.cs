using EventSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace EventSystem.Controllers
{
    public class CategoriesController : ApiController
    {
        DataContext db = new DataContext();

        [HttpGet]
        public List<Categories> GetAll()
        {
            return db.Categories.OrderBy(c => c.Id).ToList();

        }

        [HttpGet]
        public IHttpActionResult GetById(int Id)
        {

            Categories category = db.Categories.Where(c => c.Id == Id).FirstOrDefault();

            if (category == null)
            {
                return NotFound();

            }
            return Ok(category);
        }

    }

}
