using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.DAL.DTO
{
    public class ProductOrderDTO
    {
        public long Id { get; set; }
        public long OrderId { get; set; }
        public int ProductId { get; set; }
        public int Quantity { get; set; }
    }
}
