using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Data.DTO
{
    public class OrderDTO
    {
        public long? Id { get; set; }
        public long? LeadId { get; set; }
        public decimal Amount { get; set; }
        public DateTime OrderDate { get; set; }
        public int Discount { get; set; }
        public StoreDTO Store { get; set; }
        public DeliveryTypeDTO DeliveryType { get; set; }
        public PaymentTypeDTO PaymentType{ get; set; }
        public StatusDTO Status { get; set; }

    }
}
