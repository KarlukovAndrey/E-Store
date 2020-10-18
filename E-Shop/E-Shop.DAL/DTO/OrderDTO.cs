using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.DAL.DTO
{
    public class OrderDTO
    {
        public int Id { get; set; }
        public long LeadId { get; set; }
        public int StoreId { get; set; }
        public decimal Amount { get; set; }
        public int PaymentType { get; set; }
        public string Date {get; set;}
        public int StatusId { get;set; }

    }
}
