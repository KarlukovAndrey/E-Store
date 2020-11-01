using Dapper;
using E_Shop.Core.Settings;
using E_Shop.Data.DTO;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Xml;

namespace E_Shop.Data.Repositories
{
    public class OrderRepository: BaseRepository, IOrderRepository
    {
        public OrderRepository(IOptions<DBSettings> options)
        {
            DbConnection = new SqlConnection(options.Value.ConnectionString);
        }

        public DataWrapper<OrderDTO> CreateOrder(OrderDTO dto)
        {
            var result = new DataWrapper<OrderDTO>();
            try
            {
                result.Data = DbConnection.Query<OrderDTO, StoreDTO, PaymentTypeDTO, DeliveryTypeDTO, StatusDTO, OrderDTO>(
                    StoredProcedure.CreateOrderProcedure,
                    (order, store, paymentType, deliveryType, status) =>
                    {
                        order.Store = store;
                        order.PaymentType = paymentType;
                        order.DeliveryType = deliveryType;
                        order.Status = status;
                        return order;
                    },
                    new
                    {
                        dto.LeadId,
                        dto.Amount,
                        dto.Discount,
                        StoreId = dto.Store.Id,
                        PaymentTypeId = dto.PaymentType.Id,
                        DeliveryTypeId = dto.DeliveryType.Id,
                        StatusId = dto.Status.Id             
                    },
                    splitOn: "Id",
                    commandType: CommandType.StoredProcedure
                    ).SingleOrDefault();

            }
            catch(Exception ex)
            {
                result.ErrorMessage = ex.Message;
            }
            return result;
        }
        public DataWrapper<OrderDTO> UpdateOrder(OrderDTO dto)
        {
            var data = new DataWrapper<OrderDTO>();
            try
            {
                data.Data = DbConnection.Query<OrderDTO, StoreDTO, PaymentTypeDTO, DeliveryTypeDTO, StatusDTO, OrderDTO>(
                StoredProcedure.UpdateOrder,
                (order, store, paymentType, deliveryType, status) =>
                {
                    order.Store = store;
                    order.PaymentType = paymentType;
                    order.DeliveryType = deliveryType;
                    order.Status = status;
                    return order;
                },
                new
                {
                    
                    dto.Id,
                    dto.LeadId,
                    dto.Amount,
                    dto.Discount,
                    StoreId = dto.Store.Id,
                    PaymentTypeId = dto.PaymentType.Id,
                    DeliveryTypeId = dto.DeliveryType.Id,
                    StatusId = dto.Status.Id
                },
                splitOn: "Id",
                commandType: CommandType.StoredProcedure
                ).SingleOrDefault();
            }
            catch (Exception ex)
            {
                data.ErrorMessage = ex.Message;
            }
            return data;
        }

        public DataWrapper<ProductOrderDTO> AddProductToOrder(ProductOrderDTO dto)
        {
            var result = new DataWrapper<ProductOrderDTO>();
            try
            {
                result.Data = DbConnection.Query<ProductOrderDTO>(
                    StoredProcedure.CreateProductOrder,                 
                    new
                    {
                        dto.OrderId,
                        dto.ProductId,
                        dto.Quantity
                    },                
                     commandType: CommandType.StoredProcedure
                ).SingleOrDefault();
            }
            catch(Exception ex)
            {
                result.ErrorMessage = ex.Message;
            }
            return result;
        }

    }
}
