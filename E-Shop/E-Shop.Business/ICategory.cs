using E_Shop.Data.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Business
{
    public interface ICategory
    {
        List<ProductDTO> GetAllProductsByCategory(List<ProductDTO> allProducts, int type);
    }
}
