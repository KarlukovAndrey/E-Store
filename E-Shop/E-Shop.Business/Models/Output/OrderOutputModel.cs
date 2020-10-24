using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Business.Models.Output
{
    public class OrderOutputModel
    {
        public long Id { get; set; }
        public long LeadId { get; set; }
        public int StoreId { get; set; }
        public decimal Amount { get; set; }
        public int PaymentTypeId { get; set; }
        public string PaymentTypeName { get; set; }
        public string OrderDate { get; set; }
        public int DeliveryTypeId { get; set; }
        public string DeliveryTypeName { get; set; }
        public int StatusId { get; set; }
        public string StatusName { get; set; }
        public int Discount { get; set; }
    }
}
