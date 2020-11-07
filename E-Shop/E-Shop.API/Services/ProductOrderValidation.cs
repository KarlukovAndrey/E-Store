using E_Shop.API.ErrorResponse;
using E_Shop.Business.Managers;
using E_Shop.Business.Models.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace E_Shop.API.Services
{
    public class ProductOrderValidation
    {
        private IOrderManager _orderManager;
        public ProductOrderValidation(IOrderManager orderManager)
        {
            _orderManager = orderManager;
        } 

        public string ValidateProductOrder(ProductOrderInputModel model)
        {
            string validationResult = string.Empty;
            validationResult += model.OrderId == null ? $"{ResponseMessage.OrderFieldMissing} \n" :
                ValidateOrderIdValue(model.OrderId);

            validationResult += model.Quantity == 0 ? $"{ResponseMessage.QuantityFieldMissing} \n" :
                ValidateQuantity(model.Quantity);
            return validationResult;
        }
        public string ValidateQuantity(int quantity)
        {
            if(quantity == 0)
            {
                return ResponseMessage.ZeroValue;
            }
            if(quantity < 0)
            {
                return ResponseMessage.NegativeValue;
            }
            return string.Empty;
        }
        public string ValidateOrderIdValue(long? id)
        {
            if (id <= 0)
            {
                return ResponseMessage.InvalidIdValue;
            }
            var result = _orderManager.FindOrders(id);
            if (result.IsOk)
            {
                if (result.Data.Count == 0)
                {
                    return ResponseMessage.OrderNotFound;
                }
            }
            return $"{string.Empty}";
        }
    }
}
