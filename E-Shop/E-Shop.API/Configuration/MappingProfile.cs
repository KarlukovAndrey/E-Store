using AutoMapper;
using E_Shop.Business.Hashing;
using E_Shop.Business.Models.Input;
using E_Shop.Business.Models.Output;
using E_Shop.Data.DTO;
using System;
using System.Globalization;

namespace E_Shop.API.Configuration
{
    public class MappingProfile: Profile
    {
        private const string _shortDateFormat = "dd.MM.yyyy";
        private const string _longDateFormat = "dd.MM.yyyy HH:mm:ss";
        public MappingProfile()
        {
            CreateMap<LeadInputModel, LeadDTO>()
                .ForPath(dest => dest.Birthday, o => o.MapFrom(src => DateTime.ParseExact(src.Birthday, _shortDateFormat, CultureInfo.InvariantCulture)))
                .ForPath(dest => dest.Password, o => o.MapFrom(src => BCryptHashing.HashPassword(src.Password)))
                .ForPath(dest => dest.City, o => o.MapFrom(src => new CityDTO() { Id = src.CityId }))
                .ForPath(dest => dest.Role, o => o.MapFrom(src => src.RoleId != null ? new RoleDTO() { Id = src.RoleId.Value } : new RoleDTO()));

            CreateMap<LeadDTO, LeadOutputModel>()
                .ForPath(dest => dest.Birthday, o => o.MapFrom(src => src.Birthday.ToString(_shortDateFormat)))
                .ForPath(dest => dest.RegistrationDate, o => o.MapFrom(src => src.RegistrationDate.ToString(_longDateFormat)));
           
            CreateMap<SearchInputModel, SearchDTO>()
                .ForPath(dest => dest.BirthdayFrom, o => o.MapFrom(src => src.BirthdayFrom != null ? (DateTime?)DateTime.ParseExact(src.BirthdayFrom, _shortDateFormat, CultureInfo.InvariantCulture) : null))
                .ForPath(dest => dest.BirthdayTo, o => o.MapFrom(src => src.BirthdayTo != null ? (DateTime?)DateTime.ParseExact(src.BirthdayTo, _shortDateFormat, CultureInfo.InvariantCulture) : null))
                .ForPath(dest => dest.RegistrationDateFrom, o => o.MapFrom(src => src.RegistrationDateFrom != null ? (DateTime?)DateTime.ParseExact(src.RegistrationDateFrom, _shortDateFormat, CultureInfo.InvariantCulture) : null))
                .ForPath(dest => dest.RegistrationDateTo, o => o.MapFrom(src => src.RegistrationDateTo != null ? (DateTime?)DateTime.ParseExact(src.RegistrationDateTo, _shortDateFormat, CultureInfo.InvariantCulture) : null))
                .ForPath(dest => dest.Role, o => o.MapFrom(src => src.RoleId != null ? new RoleDTO() { Id = (int)src.RoleId } : null))
                .ForPath(dest => dest.City, o => o.MapFrom(src => src.CityId != null ? new CityDTO() { Id = (int)src.CityId } : null));
            
            CreateMap<UpdateLeadAddressInputModel, UpdateLeadAddressDTO>();

            CreateMap<OrderInputModel, OrderDTO>()
                .ForPath(dest => dest.Store, o => o.MapFrom(src => new StoreDTO() { Id = src.StoredId}))
                .ForPath(dest => dest.DeliveryType, o => o.MapFrom(src => new DeliveryTypeDTO() { Id = src.DeliveryTypeId}))
                .ForPath(dest => dest.PaymentType, o => o.MapFrom(src => new PaymentTypeDTO() { Id = src.PaymentTypeId}))
                .ForPath(dest => dest.Status, o => o.MapFrom(src => new StatusDTO() { Id = src.StatusId}));

            CreateMap<OrderDTO, OrderOutputModel>()
                .ForPath(dest => dest.OrderDate, o => o.MapFrom(src => src.OrderDate.ToString(_longDateFormat)));

            CreateMap<ProductOrderInputModel, ProductOrderDTO>();

            CreateMap<ProductOrderDTO, ProductOrderOutputModel>();
           
            CreateMap<LeadDTO, AuthOutputModel>()
               .ForPath(dest => dest.Role, o => o.MapFrom(src => src.Role.Name));
        }
    }
}
