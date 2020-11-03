using Dapper;
using E_Shop.Core.Settings;
using E_Shop.Data.DTO;
using Microsoft.Extensions.Options;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace E_Shop.Data.Repositories
{
    public class ProductRepository: BaseRepository, IProductRepository
    {
        public ProductRepository(IOptions<DBSettings> options)
        {
            DbConnection = new SqlConnection(options.Value.ConnectionString);
        }

        public DataWrapper<ProductStoreDTO> AddProductToStore(ProductStoreDTO dto)
        {
            var result = new DataWrapper<ProductStoreDTO>();
            try
            {
                result.Data = DbConnection.Query<ProductStoreDTO>(
                    StoredProcedure.CreateProductStore,
                    new
                    {
                        dto.ProductId,
                        dto.StoreId,
                        dto.Quantity
                    },
                     commandType: CommandType.StoredProcedure
                ).SingleOrDefault();
            }
            catch (Exception ex)
            {
                result.ErrorMessage = ex.Message;
            }
            return result;
        }
    }
}
