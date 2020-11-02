using E_Shop.Business.Models.Input;
using E_Shop.Business.Models.Output;
using E_Shop.Data;
using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Business.Managers
{
    public interface IOrderManager
    {
        DataWrapper<OrderOutputModel> CreateOrder(OrderInputModel model);
        DataWrapper<OrderOutputModel> UpdateOrder(OrderInputModel model);
        DataWrapper<ProductOrderOutputModel> AddProductToOrder(ProductOrderInputModel model);

    }
}
