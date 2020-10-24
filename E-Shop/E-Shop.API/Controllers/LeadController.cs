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

        /// <summary>
        /// Get Lead by id
        /// </summary>  
        /// <param name="id"></param>
        /// <returns> Lead Output Model</returns>
        [HttpGet("{id}")]
        public ActionResult<LeadOutputModel> GetLead(long id)
        {
            return null;
        }

        /// <summary>
        /// Create lead
        /// </summary>
        /// <remarks>
        /// Sample request:
        ///
        ///     POST /
        ///     {
        ///        "FirstName": "Vasia",
        ///        "LastName": "Ivanov",
        ///        "Birthday": "12.31.1991",
        ///        "Address": "Lenina 14",
        ///        "CityId": 1,
        ///        "Phone":"89214587400",
        ///        "Email": "something@mail.ru",
        ///        "Password":"qq!fs23"    
        ///     }
        ///
        /// </remarks>
        /// <returns> LeadOutputModel</returns>
        //[AllowAnonymous]
        [HttpPost]
        public ActionResult<LeadOutputModel> AddLead([FromBody] LeadInputModel model)
        {
            return null;
        }

        /// <summary>
        /// Update lead
        /// </summary>
        /// <remarks>
        /// Sample request:
        ///
        ///     POST /
        ///     {
        ///        "Id": 1,
        ///        "FirstName": "Vasia",
        ///        "LastName": "Ivanov",
        ///        "Birthday": "12.31.1991",
        ///        "Address": "Lenina 14",
        ///        "CityId": 1,
        ///        "Phone":"89214587400",
        ///        "Email": "something@mail.ru",
        ///        "Password":"qq!fs23"    
        ///     }
        ///
        /// </remarks>
        /// <returns> LeadOutputModel</returns>
        [HttpPut]
        public ActionResult<LeadOutputModel> UpdateLead([FromBody] LeadInputModel model)
        {
            return null;
        }

        /// <summary>
        /// Delete lead
        /// </summary>
        /// <param name="id"></param>
        /// <returns>LeadOutputModel</returns>
        [HttpDelete]
        public ActionResult DeleteLead(long id)
        {
            return null;
        }

        /// <summary>
        /// Universal lead search
        /// </summary>
        /// <returns>List LeadOutputModels</returns>
        [HttpPost("search")]
        public ActionResult<List<LeadOutputModel>> GetResultSearch() 
        {
            return null;
        }
    }
}
