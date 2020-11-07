using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using E_Shop.Business.Models.Output;
using E_Shop.Business.Models.Input;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using E_Shop.Business.Managers;
using E_Shop.Data;
using System.Text;
using E_Shop.API.Services;

namespace E_Shop.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LeadController : ControllerBase
    {
        private ILeadManager _leadManager;
        private LeadValidation _leadValidation;
        public LeadController(ILeadManager leadManager, LeadValidation leadValidation) 
        {
            _leadManager = leadManager;
            _leadValidation = leadValidation;
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
        /// <response code="200">Returns LeadOutputModel by "id"</response>
        /// <response code="422">If parameters weren't validated</response>
        /// <response code="520">If problem occured</response>
        //[AllowAnonymous]
        [HttpPost("add")]
        public ActionResult<LeadOutputModel> AddLead([FromBody] LeadInputModel model)
        {
            string validationResult = _leadValidation.ValidateLeadInputModel(model);
            if (!string.IsNullOrEmpty(validationResult))
            {
                return UnprocessableEntity(validationResult);
            }
            var result = _leadManager.CreateLead(model);      
            return MakeResponse<LeadOutputModel, LeadOutputModel>(result);
        }

        /// <summary>
        /// Update lead
        /// </summary>
        /// <remarks>
        /// Sample request:
        ///
        ///     POST /
        ///     {
        ///        "Id": 1
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
        /// <response code="200">Returns LeadOutputModel by "id"</response>
        /// <response code="404">if lead is not found</response>
        /// <response code="422">If parameters weren't validated</response>
        /// <response code="520">If problem occured</response>
        [HttpPut("update")]
        public ActionResult<LeadOutputModel> UpdateLead([FromBody] LeadInputModel model)
        {
            string validationResult = _leadValidation.ValidateLeadInputModelForUpdate(model);
            if (!string.IsNullOrEmpty(validationResult))
            {
                return UnprocessableEntity(validationResult);
            }
            var result = _leadManager.UpdateLead(model);
            return MakeResponse<LeadOutputModel, LeadOutputModel>(result);
        }

        /// <summary>
        /// Delete lead
        /// </summary>
        /// <param name="id"></param>
        /// <returns>LeadOutputModel</returns>
        /// <response code="200">Returns LeadOutputModel by "id"</response>
        /// <response code="422">If parameters weren't validated</response>
        //[Authorize(Roles = "Admin")]
        [HttpDelete("{id}")]
        public ActionResult DeleteLead(long id)
        {
            var validationResult = _leadValidation.ValidateIdValue(id);
            if (!string.IsNullOrEmpty(validationResult))
            {
                return UnprocessableEntity(validationResult);
            }
            var result = _leadManager.DeleteLead(id);
            return Ok(result.Data);
        }

        /// <summary>
        /// Universal lead search
        /// </summary>
        /// <returns>List LeadOutputModels</returns>
        [HttpPost("search")]
        public ActionResult<List<LeadOutputModel>> GetResultSearch([FromBody] SearchInputModel model) 
        {
            var results = _leadManager.FindLeads(model);
            return MakeResponse<List<LeadOutputModel>, List<LeadOutputModel>>(results);
        }

        private ActionResult<K> MakeResponse<T, K>(DataWrapper<T> operationResult)
        {
            if (operationResult.IsOk)
            {
                if (operationResult.Data == null)
                {
                    return NotFound();
                }
                return Ok(operationResult.Data);
            }
            return Problem(detail: operationResult.ErrorMessage, statusCode: 520);
        }
    }
}
