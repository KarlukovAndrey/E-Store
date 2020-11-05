using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using E_Shop.Business.Managers;
using E_Shop.Business.Models;
using E_Shop.Business.Models.Input;
using E_Shop.Business.Models.Output;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace E_Shop.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : Controller
    {
        private IProductManager _productManager;

        public ProductController(IProductManager productManager)
        {
            _productManager = productManager;
        }


        [HttpPost("add-product-to-store")]
        public ActionResult<ProductStoreOutputModel> AddProductToStore([FromBody] ProductStoreInputModel model)
        {
            var result = _productManager.AddProductToStore(model);
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
        [HttpPost("update-product-store")]
        public ActionResult<ProductStoreOutputModel> UpdateProductStore([FromBody] ProductStoreInputModel model)
        {
            var result = _productManager.UpdateProductStore(model);
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
        /// Get Product by id
        /// </summary>  
        /// <param name="id"></param>
        /// <returns> Product model</returns>
        [HttpGet("{id}")]
        public ActionResult<ProductOutputModel> GetProduct(int id)
        {
            return null;
        }

        [HttpPost("add")]
        public ActionResult<int> AddProduct([FromBody] ProductInputModel model)
        {
            var result = _productManager.AddProduct(model);
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
        public ActionResult<ProductOutputModel> UpdateProduct([FromBody] ProductInputModel model)
        {
            var result = _productManager.UpdateProduct(model);
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

        [HttpGet("all-product/{category}")]
        public ActionResult<List<ProductOutputModel>> GetAllProductByType(int category)
        {
            var result = _productManager.GetAllProductByType(category);
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

        [HttpGet("quantity/{productId}/{storeId}")]
        public ActionResult<ProductStoreOutputModel> GetProductStore(int productId, int storeId) 
        {
            var result = _productManager.GetProductStore(productId, storeId);
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
    }
}
