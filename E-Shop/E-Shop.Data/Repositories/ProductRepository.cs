using Dapper;
using E_Shop.Core.Settings;
using E_Shop.Data.DTO;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace E_Shop.Data.Repositories
{
    public class ProductRepository : BaseRepository, IProductRepository
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

        public DataWrapper<ProductStoreDTO> UpdateProductStore(ProductStoreDTO dto)
        {
            var result = new DataWrapper<ProductStoreDTO>();
            try
            {
                result.Data = DbConnection.Query<ProductStoreDTO>(
                    StoredProcedure.UpdateProductStore,
                    new
                    {
                        dto.Id,
                        dto.StoreId,
                        dto.Quantity,
                        dto.IsDeleted
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

        public DataWrapper<ProductDTO> AddProduct(ProductDTO dto)
        {
            var result = new DataWrapper<ProductDTO>();
            try
            {
                result.Data = DbConnection.Query<ProductDTO>(
                    StoredProcedure.CreateProduct,
                    new
                    {
                        dto.Name,
                        dto.Price,
                        dto.Brand,
                        dto.Description,
                        dto.ManufactureCountry,
                        dto.ManufactureDate,
                        dto.Weight,
                        dto.Wattage,
                        dto.NoiseLevel,
                        dto.PresetPrograms,
                        dto.Width,
                        dto.Height,
                        dto.Depth,
                        dto.ScreenSize,
                        dto.Resolution,
                        dto.DysplayType,
                        dto.ThreedimensionalTechnology,
                        dto.WetCleaning,
                        dto.DustContainerVolume,
                        dto.AttachmentsCount,
                        dto.RemoteLaunch,
                        dto.СleaningАrea,
                        dto.TurnTableDiameter,
                        dto.NumberOfProwerLevel,
                        dto.Grill,
                        dto.MicrowavesPower,
                        dto.SimCardCount,
                        dto.FrontСamera,
                        dto.HeadphoneJack,
                        dto.BatteryCapacity,
                        dto.ConnectionStandard,
                        dto.MinTemperatureFreezer,
                        dto.ColdStorageTime,
                        dto.Freezer,
                        dto.Defrost
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

        public DataWrapper<List<ProductDTO>> GetAllProduct()
        {
            var result = new DataWrapper<List<ProductDTO>>();
            try
            {
                result.Data = DbConnection.Query<ProductDTO>(
                    StoredProcedure.GetAllProduct,
                    commandType: CommandType.StoredProcedure
                    ).ToList();
            }
            catch (Exception ex)
            {
                result.ErrorMessage = ex.Message;
            }
            return result;
        }
        public DataWrapper<ProductDTO> UpdateProduct(ProductDTO dto)
        {
            var result = new DataWrapper<ProductDTO>();
            try
            {
                result.Data = DbConnection.Query<ProductDTO>(
                    StoredProcedure.UpdateProductById,
                    new
                    {
                        dto.Id,
                        dto.Name,
                        dto.Price,
                        dto.Brand,
                        dto.Description,
                        dto.ManufactureCountry,
                        dto.ManufactureDate,
                        dto.Weight,
                        dto.Wattage,
                        dto.NoiseLevel,
                        dto.PresetPrograms,
                        dto.Width,
                        dto.Height,
                        dto.Depth,
                        dto.ScreenSize,
                        dto.Resolution,
                        dto.DysplayType,
                        dto.ThreedimensionalTechnology,
                        dto.WetCleaning,
                        dto.DustContainerVolume,
                        dto.AttachmentsCount,
                        dto.RemoteLaunch,
                        dto.СleaningАrea,
                        dto.TurnTableDiameter,
                        dto.NumberOfProwerLevel,
                        dto.Grill,
                        dto.MicrowavesPower,
                        dto.SimCardCount,
                        dto.FrontСamera,
                        dto.HeadphoneJack,
                        dto.BatteryCapacity,
                        dto.ConnectionStandard,
                        dto.MinTemperatureFreezer,
                        dto.ColdStorageTime,
                        dto.Freezer,
                        dto.Defrost
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
        public DataWrapper<ProductStoreDTO> GetProductStore(int productId, int storeId)
        {
            var result = new DataWrapper<ProductStoreDTO>();
            try
            {
                result.Data = DbConnection.Query<ProductStoreDTO>(
                    StoredProcedure.GetProductStore,
                    new
                    {
                        productId,
                        storeId
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
