using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using E_Shop.Business.Models.Input;
using E_Shop.Business.Models.Output;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace E_Shop.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderController : Controller
    {
        /// <summary>
        /// Get Order by id
        /// </summary>  
        /// <param name="id"></param>
        /// <returns> Order Output Model</returns>
        [HttpGet("{id}")]
        public ActionResult<OrderOutputModel> GetOrder(long id)
        {
            return null;
        }

        /// <summary>
        /// Creates order
        /// </summary>
        /// <remarks>
        /// Sample request:
        ///
        ///     POST /
        ///     {
        ///        "LeadId": 1,
        ///        "StoredId": 1,
        ///        "PaymentTypeId": 1,
        ///        "DeliveryTypeId": 1,
        ///        "StatusId": 2
        ///     }
        ///
        /// </remarks>      
        /// <returns> Order Output Model</returns>
        [HttpPost]
        public ActionResult<OrderOutputModel> AddOrder([FromBody] OrderInputModel model)
        {
            return null;
        }
        /// <summary>
        /// Updates order
        /// </summary>
        /// <remarks>
        /// Sample request:
        ///
        ///     POST /
        ///     {  
        ///        "Id": 1,       
        ///        "StoredId": 1,
        ///        "PaymentTypeId": 1,
        ///        "DeliveryTypeId": 1,
        ///        "StatusId": 2
        ///     }
        ///
        /// </remarks>      
        /// <returns> Order Output Model</returns>
        [HttpPut]
        public ActionResult<OrderOutputModel> UpdateOrder([FromBody] OrderInputModel model)
        {
            return null;
        }
        /// <summary>
        /// Universal order search
        /// </summary>
        /// <returns> List OrderOutputModels</returns>
        [HttpPost("search")]
        public ActionResult<List<OrderOutputModel>> GetResultSearch() //добавить search order input model
        {
            return null;
        }

        //[HttpGet("all_orders_by_lead/{id}")]
        //public ActionResult<List<OrderOutputModel>> GetAllOrdersByLeadId(long id) 
        //{
        //    return null;
        //}
    }
}
