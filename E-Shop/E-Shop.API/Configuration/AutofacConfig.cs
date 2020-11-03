using Autofac;
using E_Shop.API.Services;
using E_Shop.Business.Managers;
using E_Shop.Data.Repositories;


namespace E_Shop.API.Configuration
{
    public class AutofacConfig : Module
    { 
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterType<LeadValidation>().SingleInstance();
            builder.RegisterType<LeadRepository>().As<ILeadRepository>().SingleInstance();
            builder.RegisterType<OrderRepository>().As<IOrderRepository>().SingleInstance();
            builder.RegisterType<OrderManager>().As<IOrderManager>().SingleInstance();
            builder.RegisterType<LeadManager>().As<ILeadManager>().SingleInstance();
            builder.RegisterType<TokenService>().SingleInstance();
            builder.RegisterType<AuthManager>().SingleInstance();
            builder.RegisterType<ProductManager>().As<IProductManager>().SingleInstance();
            builder.RegisterType<ProductRepository>().As<IProductRepository>().SingleInstance();

        }
    }
}
