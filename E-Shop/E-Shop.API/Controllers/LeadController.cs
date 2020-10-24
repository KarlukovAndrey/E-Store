using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using E_Shop.Business.Models.Output;
using E_Shop.Business.Models.Input;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace E_Shop.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LeadController : Controller
    {
        public LeadController() { }

        [HttpGet("{id}")]
        public ActionResult<LeadOutputModel> GetLead(long id)
        {
            return null;
        }

        //[AllowAnonymous]
        [HttpPost]
        public ActionResult<LeadOutputModel> AddLead([FromBody] LeadInputModel model)
        {
            return null;
        }

        [HttpPut]
        public ActionResult<LeadOutputModel> UpdateLead([FromBody] LeadInputModel model)
        {
            return null;
        }

        [HttpDelete]
        public ActionResult DeleteLead(long id)
        {
            return null;
        }

        [HttpPost("Search")]
        public ActionResult<List<LeadOutputModel>> GetResultSearch() 
        {
            return null;
        }
    }
}
