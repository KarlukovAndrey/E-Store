

namespace E_Shop.Data.Repositories
{
    public class StoredProcedure
    {
        public const string CreateLeadProcedure = "[CreateLead]";
        public const string DeleteLeadProcedure = "[DeletedLeadById]";
        public const string UpdateLeadByIdProcedure = "[UpdateLeadById]";
        public const string SearchLead = "[SearchLead]";
        public const string UpdateLeadAddress = "[UpdateLeadAddress]";
        public const string CreateOrderProcedure = "[CreateOrder]";
        public const string UpdateOrder = "[UpdateOrder]";
        public const string CreateProductOrder = "[CreateProduct_Order]";
        public const string SearchOrder = "[SearchOrder]";
        public const string SelectLeadByLoginProcedure = "[SelectLeadByLogin]";
        public const string UpdateProductOrder = "[UpdateProduct_Order]";
        public const string CreateProductStore = "[CreateProduct_Store]";
        public const string UpdateProductStore = "[UpdateProduct_Store]";
        public const string CreateProduct = "[CreateProduct]";
        public const string GetProductStore = "[GetProductStore]";
        public const string UpdateProductById = "[UpdateProductById]";
        public const string GetAllProduct = "[GetAllProduct]";

    }
}
