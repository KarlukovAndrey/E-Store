using E_Shop.Business.Models.Input;
using E_Shop.Business.Models.Output;
using E_Shop.Data;
using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Business.Managers
{
    public interface IProductManager
    {
        DataWrapper<ProductStoreOutputModel> AddProductToStore(ProductStoreInputModel model);
        DataWrapper<ProductStoreOutputModel> UpdateProductStore(ProductStoreInputModel model);
        DataWrapper<ProductOutputModel> AddProduct(ProductInputModel model);
        DataWrapper<ProductStoreOutputModel> GetProductStore(int productId, int storeId);
        DataWrapper<ProductOutputModel> UpdateProduct(ProductInputModel model);
        DataWrapper<List<ProductOutputModel>> GetAllProductByType(int type);
        DataWrapper<List<ProductOutputModel>> SearchProducts(SearchProductInputModel model);
    } 
}
