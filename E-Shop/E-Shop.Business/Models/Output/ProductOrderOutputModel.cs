using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Business.Models.Output
{
    public class ProductOrderOutputModel
    {
        public long? Id { get; set; }
        public long OrderId { get; set; }
        public int ProductId { get; set; }
        public int Quantity { get; set; }
        public bool IsDeleted { get; set; }
    }
}
