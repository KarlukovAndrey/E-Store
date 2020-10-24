using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using E_Shop.Business.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace E_Shop.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : Controller
    {
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
