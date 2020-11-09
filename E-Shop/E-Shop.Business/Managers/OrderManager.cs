using AutoMapper;
using E_Shop.Business.ErrorResponse;
using E_Shop.Business.Models.Input;
using E_Shop.Business.Models.Output;
using E_Shop.Data;
using E_Shop.Data.DTO;
using E_Shop.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Business.Managers
{
    public class OrderManager : IOrderManager
    {
        private IOrderRepository _orderRepository;
        private IProductRepository _productRepository;
        private IMapper _mapper;
       

        public OrderManager(IOrderRepository orderRepository, IProductRepository productRepository, IMapper mapper)
        {
            _orderRepository = orderRepository;
            _productRepository = productRepository;
            _mapper = mapper;

        }

        public DataWrapper<OrderOutputModel> CreateOrder(OrderInputModel model)
        {
            var orderDTO = _mapper.Map<OrderDTO>(model);
            var data = _orderRepository.CreateOrder(orderDTO);
            var mapperData = _mapper.Map<OrderOutputModel>(data.Data);
            return new DataWrapper<OrderOutputModel>
            {
                Data = mapperData,
                ErrorMessage = data.ErrorMessage
            };
        }
        public DataWrapper<OrderOutputModel> UpdateOrder(OrderInputModel model)
        {
            var orderDTO = _mapper.Map<OrderDTO>(model);
            var data = _orderRepository.UpdateOrder(orderDTO);
            var mapperData = _mapper.Map<OrderOutputModel>(data.Data);
            return new DataWrapper<OrderOutputModel>
            {
                Data = mapperData,
                ErrorMessage = data.ErrorMessage
            };
        }
        public DataWrapper<ProductOrderOutputModel> AddProductToOrder(ProductOrderInputModel model)
        {
            var request = _orderRepository.SearchOrder(new SearchOrderDTO() { Id = model.OrderId });
            var result = new DataWrapper<ProductOrderOutputModel>();
            if (request.Data.Count == 0)
            {
                result.ErrorMessage = ResponseMessage.orderNotFound;
                return result;
            }
            var productStoreModel = _productRepository.GetProductStore(model.ProductId, request.Data[0].Store.Id.Value).Data;
            if (productStoreModel.Quantity >= model.Quantity)
            {
                _productRepository.UpdateProductStore(new ProductStoreDTO
                {
                    Id = productStoreModel.Id,
                    ProductId = productStoreModel.ProductId,
                    StoreId = productStoreModel.StoreId,
                    Quantity = productStoreModel.Quantity - model.Quantity,
                    IsDeleted = model.IsDeleted
                });
               var productOrderDTO = _mapper.Map<ProductOrderDTO>(model);
               
                var data = _orderRepository.AddProductToOrder(productOrderDTO);
                var mapperData = _mapper.Map<ProductOrderOutputModel>(data.Data);
                result.Data = mapperData;
                result.ErrorMessage = data.ErrorMessage;
            }
            else
            {
                result.ErrorMessage = ResponseMessage.productNotFound;
            }
            return result;
        }

        public DataWrapper<ProductOrderOutputModel> UpdateProductOrder(ProductOrderInputModel model)
        {
            var productOrderDTO = _mapper.Map<ProductOrderDTO>(model);
            var data = _orderRepository.UpdateProduсtOrder(productOrderDTO);
            var mapperData = _mapper.Map<ProductOrderOutputModel>(data.Data);
            return new DataWrapper<ProductOrderOutputModel>
            {
                Data = mapperData,
                ErrorMessage = data.ErrorMessage
            };
        }
        public DataWrapper<List<OrderOutputModel>> FindOrders(SearchOrderInputModel model)
        {
            var serchDto = _mapper.Map<SearchOrderDTO>(model);
            var data = _orderRepository.SearchOrder(serchDto);
            var mappedData = _mapper.Map<List<OrderOutputModel>>(data.Data);

            return new DataWrapper<List<OrderOutputModel>>
            {
                Data = mappedData,
                ErrorMessage = data.ErrorMessage
            };
        }
        public DataWrapper<List<OrderOutputModel>> FindOrders(long? id) => FindOrders(new SearchOrderInputModel { Id = id });

    }
}
