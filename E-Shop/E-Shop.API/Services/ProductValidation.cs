using E_Shop.API.ErrorResponse;
using E_Shop.Business.Managers;
using E_Shop.Business.Models.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace E_Shop.API.Services
{
    public class ProductValidation
    {
        private IProductManager _productManager;

        public ProductValidation(IProductManager productManager)
        {
            _productManager = productManager;
        }
        public string ValidateProductInputModel(ProductInputModel model)
        {
            string validationResult = string.Empty;
            return validationResult;
        }
        public string ValidateIdValue(int? id)
        {
            if (id <= 0)
            {
                return ResponseMessage.InvalidIdValue;
            }
            var result = _productManager.SearchProducts(new SearchProductInputModel { Id = id });
            if (result.IsOk)
            {
                if (result.Data.Count == 0)
                {
                    return ResponseMessage.LeadNotFound;
                }
            }
            return $"{string.Empty}";
        }
    }
}
