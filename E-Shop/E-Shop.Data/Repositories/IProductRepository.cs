using E_Shop.Data.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Data.Repositories
{
    public interface IProductRepository
    {
        DataWrapper<ProductStoreDTO> AddProductToStore(ProductStoreDTO dto);
        DataWrapper<ProductStoreDTO> UpdateProductStore(ProductStoreDTO dto);
        DataWrapper<ProductDTO> AddProduct(ProductDTO dto);
    }
}
