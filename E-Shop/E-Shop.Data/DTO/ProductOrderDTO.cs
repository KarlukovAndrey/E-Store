using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Data.DTO
{
    public class ProductOrderDTO
    {
        public long Id { get; set; }
        public long? OrderId { get; set; }
        public int ProductId { get; set; }
        public int Quantity { get; set; }
        public bool? IsDeleted { get; set; }
    }
}

