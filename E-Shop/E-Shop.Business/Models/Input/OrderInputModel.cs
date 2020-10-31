using Microsoft.VisualBasic.CompilerServices;
using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Business.Models.Input
{
    public class OrderInputModel
    {
        public long? Id { get; set; }
        public long? LeadId { get; set; }
        public int? StoredId { get; set; }
        public int? PaymentTypeId { get; set; }
        public int? DeliveryTypeId { get; set; }
        public int? StatusId { get; set; }

    }
}
