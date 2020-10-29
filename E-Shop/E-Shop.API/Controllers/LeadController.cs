using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using E_Shop.Business.Models.Output;
using E_Shop.Business.Models.Input;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using E_Shop.Business.Managers;

namespace E_Shop.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LeadController : ControllerBase
    {
        private ILeadManager _leadManager;
        public LeadController
            (ILeadManager leadManager) 
        {
            _leadManager = leadManager;
        }

        /// <summary>
        /// Get Lead by id
        /// </summary>  
        /// <param name="id"></param>
        /// <returns> Lead Output Model</returns>
        [HttpGet("{id}")]
        public ActionResult<LeadOutputModel> GetLead(long id)
        {
            //var result = _leadManager.FindLeads(id)
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
        ///        "Birthday": "31.12.1991",
        ///        "Address": "Lenina 14",
        ///        "Phone":"89214587400",
        ///        "Email": "something@mail.ru",
        ///        "Password":"qq!fs23",   
        ///        "CityId":1
        ///     }
        ///
        /// </remarks>
        /// <returns> LeadOutputModel</returns>
        //[AllowAnonymous]
        [HttpPost("add")]
        public ActionResult<LeadOutputModel> AddLead([FromBody] LeadInputModel model)
        {
            var result = _leadManager.CreateLead(model);
            if (result.IsOk)
            {
                if (result.Data == null)
                {
                    return NotFound();
                }
                return Ok(result.Data);
            }
            return Problem(detail: result.ErrorMessage, statusCode: 520);
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
            var result = _leadManager.UpdateLead(model);
            if (result.IsOk)
            {
                if (result.Data == null)
                {
                    return NotFound();
                }
                return Ok(result.Data);
            }
            return Problem(detail: result.ErrorMessage, statusCode: 520);
        }

        /// <summary>
        /// Delete lead
        /// </summary>
        /// <param name="id"></param>
        /// <returns>LeadOutputModel</returns>
        //[Authorize(Roles = "Admin")]
        [HttpDelete("{id}")]
        public ActionResult DeleteLead(long id)
        {
           var result = _leadManager.DeleteLead(id);
            return Ok(result.Data);
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
