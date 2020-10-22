using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Data.DTO
{
    public class ProductStoreDTO
    {
        public long Id { get; set; }
        public int ProductId { get; set; }
        public int StoreId { get; set; }
        public int Count { get; set; }
    }
}
