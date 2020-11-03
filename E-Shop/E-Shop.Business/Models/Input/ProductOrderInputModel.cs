using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Business.Models.Input
{
    public class ProductOrderInputModel
    {
        public long? Id { get; set; }
        public long? OrderId { get; set; }
        public int ProductId { get; set; }
        public int Quantity { get; set; }

    }
}
