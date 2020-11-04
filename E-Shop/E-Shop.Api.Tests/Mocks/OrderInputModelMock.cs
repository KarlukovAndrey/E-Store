using E_Shop.Business.Models.Input;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Api.Tests.Mocks
{
    public class OrderInputModelMock : IEnumerable
    {
        public IEnumerator GetEnumerator()
        {
            yield return new OrderInputModel()
            {
                LeadId = 1,
                StoredId = 1,
                PaymentTypeId = 1,
                DeliveryTypeId = 1,
                StatusId = 1
            };
        }
    }
}
