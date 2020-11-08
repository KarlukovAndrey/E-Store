using E_Shop.API.ErrorResponse;
using E_Shop.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace E_Shop.API.Services
{
    public class PaymentTypeValidation
    {
        public string ValidatePaymentType(int type)
        {
            foreach (PaymentType value in (PaymentType[])Enum.GetValues(typeof(PaymentType)))
            {
                if ((int)value == type) return string.Empty;
            }

            return ResponseMessage.InvalidPaymentType;
        }
    }
}
