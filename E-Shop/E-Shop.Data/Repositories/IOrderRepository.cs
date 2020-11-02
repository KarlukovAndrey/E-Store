using E_Shop.Data.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Data.Repositories
{
    public interface IOrderRepository
    {
        DataWrapper<OrderDTO> CreateOrder(OrderDTO dto);
        DataWrapper<OrderDTO> UpdateOrder(OrderDTO dto);
        DataWrapper<ProductOrderDTO> AddProductToOrder(ProductOrderDTO dto);
        DataWrapper<List<OrderDTO>> SearchOrder(SearchOrderDTO dto);
        
    }
}
