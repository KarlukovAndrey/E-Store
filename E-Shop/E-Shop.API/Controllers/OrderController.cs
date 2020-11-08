using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using E_Shop.API.Services;
using E_Shop.Business.Managers;
using E_Shop.Business.Models.Input;
using E_Shop.Business.Models.Output;
using E_Shop.Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace E_Shop.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderController : ControllerBase
    {
        private IOrderManager _orderManager;
        private IProductManager _productManager;
        private LeadValidation _leadValidation;
        private OrderValidation _orderValidation;
        private ProductOrderValidation _productOrderValidation;
        private ProductValidation _productValidation;
        public OrderController(IOrderManager orderManager, IProductManager productManager, LeadValidation leadValidation,
                                OrderValidation orderValidation, ProductOrderValidation productOrderValidation,
                                ProductValidation productValidation)
        {
            _orderManager = orderManager;
            _productManager = productManager;
            _leadValidation = leadValidation;
            _orderValidation = orderValidation;
            _productOrderValidation = productOrderValidation;
            _productValidation = productValidation;
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
        /// <response code="200">Returns order output model.</response>
        /// <response code="422">If parameters weren't validated.</response>
        /// <response code="520">If problem occured.</response>
        [HttpPost("add")]
        public ActionResult<OrderOutputModel> AddOrder([FromBody] OrderInputModel model)
        {
            var validationResult = _leadValidation.ValidateIdValue(model.LeadId);
            validationResult += _orderValidation.ValidateOrderInputModel(model);
            if (!string.IsNullOrEmpty(validationResult))
            {
                return UnprocessableEntity(validationResult);
            }
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
        /// <response code="200">Returns order output model.</response>
        /// <response code="422">If parameters weren't validated.</response>
        /// <response code="520">If problem occured.</response>
        [HttpPut("update")]
        public ActionResult<OrderOutputModel> UpdateOrder([FromBody] OrderInputModel model)
        {
            var validationResult = _leadValidation.ValidateIdValue(model.LeadId);
            validationResult += _orderValidation.ValidateOrderInputModel(model);
            if (!string.IsNullOrEmpty(validationResult))
            {
                return UnprocessableEntity(validationResult);
            }
            var result = _orderManager.UpdateOrder(model);
            return MakeResponse<OrderOutputModel, OrderOutputModel>(result);
        }

        [HttpPost("add-product-to-order")]
        public ActionResult<ProductOrderOutputModel> AddProductToOrder([FromBody] ProductOrderInputModel model)
        {
            var validationResult = _productOrderValidation.ValidateProductOrder(model);
            validationResult += _productValidation.ValidateIdValue(model.ProductId);
            if (!string.IsNullOrEmpty(validationResult))
            {
                return UnprocessableEntity(validationResult);
            }
            var result = _orderManager.AddProductToOrder(model);
            return MakeResponse<ProductOrderOutputModel, ProductOrderOutputModel>(result);
        }


        [HttpPost("update-product_order")]
        public ActionResult<ProductOrderOutputModel> UpdateProductOrder([FromBody] ProductOrderInputModel model)
        {
            var validationResult = _productOrderValidation.ValidateProductOrder(model);
            validationResult += _productValidation.ValidateIdValue(model.ProductId);
            if (!string.IsNullOrEmpty(validationResult))
            {
                return UnprocessableEntity(validationResult);
            }
            var result = _orderManager.UpdateProductOrder(model);
            return MakeResponse<ProductOrderOutputModel,ProductOrderOutputModel>(result);
        }

        /// <summary>
        /// Universal order search
        /// </summary>
        /// <returns> List OrderOutputModels</returns>
        [HttpPost("search")]
        public ActionResult<List<OrderOutputModel>> GetResultSearch([FromBody] SearchOrderInputModel model)
        {
            var result = _orderManager.FindOrders(model);
            return MakeResponse<List<OrderOutputModel>, List<OrderOutputModel>>(result);
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
