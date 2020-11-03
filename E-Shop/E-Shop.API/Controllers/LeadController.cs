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


        [HttpPut("update")]
        public ActionResult<LeadOutputModel> UpdateLead([FromBody] LeadInputModel model)
        {
            string validationResult = _leadValidation.ValidateLeadInputModelForUpdate(model);
            if (!string.IsNullOrEmpty(validationResult))
            {
                return UnprocessableEntity(validationResult);
            }
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
        [HttpPost("search-leads")]
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
