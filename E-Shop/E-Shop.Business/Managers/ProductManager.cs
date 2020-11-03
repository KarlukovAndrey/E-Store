using AutoMapper;
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
    public class ProductManager:IProductManager
    {
        private IProductRepository _productRepository;
        private IMapper _mapper;

        public ProductManager(IProductRepository productRepository, IMapper mapper)
        {
            _productRepository = productRepository;
            _mapper = mapper;
        }
       
        public DataWrapper<ProductStoreOutputModel> AddProductToStore(ProductStoreInputModel model)
        {
            var productStoreDTO = _mapper.Map<ProductStoreDTO>(model);
            var data = _productRepository.AddProductToStore(productStoreDTO);
            var mapperData = _mapper.Map<ProductStoreOutputModel>(data.Data);
            return new DataWrapper<ProductStoreOutputModel>
            {
                Data = mapperData,
                ErrorMessage = data.ErrorMessage
            };
        }
        public DataWrapper<ProductStoreOutputModel> UpdateProductStore(ProductStoreInputModel model)
        {
            var productStoreDTO = _mapper.Map<ProductStoreDTO>(model);
            var data = _productRepository.UpdateProductStore(productStoreDTO);
            var mapperData = _mapper.Map<ProductStoreOutputModel>(data.Data);
            return new DataWrapper<ProductStoreOutputModel>
            {
                Data = mapperData,
                ErrorMessage = data.ErrorMessage
            };
        }
        
        public DataWrapper<ProductOutputModel> AddProduct(ProductInputModel model)
        {
            var productDTO = _mapper.Map<ProductDTO>(model);
            var data = _productRepository.AddProduct(productDTO);
            var mapperData = _mapper.Map<ProductOutputModel>(data.Data);
            return new DataWrapper<ProductOutputModel>
            {
                Data = mapperData,
                ErrorMessage = data.ErrorMessage
            };
        }
    }
}
