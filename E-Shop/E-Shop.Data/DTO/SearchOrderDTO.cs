using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Data.DTO
{
    public class SearchOrderDTO
    {
        public long? Id { get; set; }
        public long? LeadId { get; set; }
        public decimal? AmountFrom { get; set; }
        public decimal? AmountTo { get; set; }
        public DateTime? OrderDateFrom { get; set; }
        public DateTime? OrderDateTo { get; set; }
        public StoreDTO Store { get; set; }
        public PaymentTypeDTO PaymentType { get; set; }
        public DeliveryTypeDTO DeliveryType { get; set; }
        public StatusDTO Status { get; set; }
    }
}
