using Autofac;
using E_Shop.Business.Managers;
using E_Shop.Data.Repositories;


namespace E_Shop.API.Configuration
{
    public class AutofacConfig : Module
    { 
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterType<LeadRepository>().As<ILeadRepository>().SingleInstance();
            builder.RegisterType<OrderRepository>().As<IOrderRepository>().SingleInstance();
            builder.RegisterType<OrderManager>().As<IOrderManager>().SingleInstance();
            builder.RegisterType<LeadManager>().As<ILeadManager>().SingleInstance();
        }
    }
}
