using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using E_Shop.Business.Managers;
using E_Shop.Business.Models.Input;
using E_Shop.Business.Models.Output;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace E_Shop.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderController : ControllerBase
    {
        private IOrderManager _orderManager;
        public OrderController(IOrderManager orderManager)
        {
            _orderManager = orderManager;
        }
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
        ///        "StatusId": 1
        ///     }
        ///
        /// </remarks>      
        /// <returns> Order Output Model</returns>
        [HttpPost("add")]
        public ActionResult<OrderOutputModel> AddOrder([FromBody] OrderInputModel model)
        {
            var result = _orderManager.CreateOrder(model);
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
        ///        "StatusId": 1
        ///     }
        ///
        /// </remarks>      
        /// <returns> Order Output Model</returns>
        [HttpPut("update")]
        public ActionResult<OrderOutputModel> UpdateOrder([FromBody] OrderInputModel model)
        {
            var result = _orderManager.UpdateOrder(model);

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
        /// Universal order search
        /// </summary>
        /// <returns> List OrderOutputModels</returns>
        [HttpPost("search")]
        public ActionResult<List<OrderOutputModel>> GetResultSearch() //добавить search order input model
        {
            return null;
        }

        [HttpPost("add-product-to-order")]
        public ActionResult<ProductOrderOutputModel> AddProductToOrder([FromBody] ProductOrderInputModel model)
        {
            var result = _orderManager.AddProductToOrder(model);
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
        //[HttpGet("all_orders_by_lead/{id}")]
        //public ActionResult<List<OrderOutputModel>> GetAllOrdersByLeadId(long id) 
        //{
        //    return null;
        //}
    }
}
