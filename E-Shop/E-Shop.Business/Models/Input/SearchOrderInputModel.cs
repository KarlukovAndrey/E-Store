using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Business.Models.Input
{
    public class SearchOrderInputModel
    {
        public long? Id { get; set; }
        public long? LeadId { get; set; }
        public int? StoreId { get; set; }
        public decimal? AmountFrom { get; set; }
        public decimal? AmountTo { get; set; }
        public string OrderDateFrom { get; set; }
        public string OrderDateTo { get; set; }
        public int? PaymentTypeId { get; set; }
        public int? DeliveryTypeId { get; set; }
        public int? StatusId { get; set; }
    }
}

