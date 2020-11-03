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
        public ActionResult<ProductModel> GetProduct(int id)
        {
            return null;
        }

        [HttpPost]
        public ActionResult<int> AddProduct([FromBody] ProductModel model)
        {
            return null;
        }

        [HttpPut]
        public ActionResult UpdateProduct([FromBody] ProductModel model)
        {
            return null;
        }
        [HttpPost("Search")]
        public ActionResult<List<ProductModel>> GetResultSearch() // добавить SearchProductInputModel
        {
            return null;
        }

        [HttpGet("quantity/{productId}/{storeId}")]
        public ActionResult<int> GetProductQuantityInStore(int productId, int storeId) 
        {
            return null;
        }

       


    }
}
