using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace E_Shop.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LeadController : ControllerBase
    {
        public LeadController() { }

        //[HttpGet("{id}")]
        //public ActionResult<LeadOutputModel> GetLead(long id)
        //{
        //    return null;
        //}
    }
}
