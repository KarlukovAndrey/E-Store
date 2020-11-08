using E_Shop.Data.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Data.Repositories
{
    public interface IProductRepository
    {
        DataWrapper<ProductStoreDTO> GetProductStore(int productId, int storeId);
        DataWrapper<ProductStoreDTO> AddProductToStore(ProductStoreDTO dto);
        DataWrapper<ProductStoreDTO> UpdateProductStore(ProductStoreDTO dto);
        DataWrapper<List<ProductDTO>> GetAllProduct();
        DataWrapper<ProductDTO> UpdateProduct(ProductDTO dto);
        DataWrapper<ProductDTO> AddProduct(ProductDTO dto);
        DataWrapper<List<ProductDTO>> SearchProducts(SearchProductDTO dto);
    }
}
