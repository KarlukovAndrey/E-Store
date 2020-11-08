using E_Shop.API.ErrorResponse;
using E_Shop.Business.Managers;
using E_Shop.Business.Models.Input;
using E_Shop.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace E_Shop.API.Services
{
    public class OrderValidation
    {
        private IOrderManager _orderManager;
        public OrderValidation(IOrderManager orderManager)
        {
            _orderManager = orderManager;
        }
        public string ValidateOrderInputModel(OrderInputModel model)
        {
            string validationResult = string.Empty;
            validationResult += model.PaymentTypeId == null ? $"{ResponseMessage.PaymentTypeFieldMissing} \n" :
                ValidatePaymentType(model.PaymentTypeId);

            validationResult += model.DeliveryTypeId == null ? $"{ResponseMessage.DeliveryTypeFieldMissing} \n" :
                ValidateDeliveryType(model.DeliveryTypeId);

            validationResult += model.StatusId == null ? $"{ResponseMessage.StatusFieldMissing} \n" :
              ValideteOrderStatus(model.StatusId);

            validationResult += model.StoredId == null ? $"{ResponseMessage.StoreFieldMissing} \n" :
              ValidateStore(model.StoredId);
            return validationResult;
        }
        public string ValidatePaymentType(int? type)
        {
            foreach (PaymentType value in (PaymentType[])Enum.GetValues(typeof(PaymentType)))
            {
                if ((int)value == type) return string.Empty;
            }
            return ResponseMessage.InvalidPaymentType;
        }

        public string ValidateDeliveryType(int? type)
        {
            foreach (DeliveryType value in (DeliveryType[])Enum.GetValues(typeof(DeliveryType)))
            {
                if ((int)value == type) return string.Empty;
            }
            return ResponseMessage.InvalidDeliveryType;
        }

        public string ValideteOrderStatus(int? type)
        {
            foreach (Status value in (Status[])Enum.GetValues(typeof(Status)))
            {
                if ((int)value == type) return string.Empty;
            }
            return ResponseMessage.InvalidStatus;
        }

        public string ValidateStore(int? storeId)
        {
            foreach (Store value in (Store[])Enum.GetValues(typeof(Store)))
            {
                if ((int)value == storeId) return string.Empty;
            }
            return ResponseMessage.InvalidStore;
        }
    }
}
