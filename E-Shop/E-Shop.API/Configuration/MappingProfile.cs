using AutoMapper;
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
                .ForPath(dest => dest.City, o => o.MapFrom(src => new CityDTO() { Id = src.CityId }))
                .ForPath(dest => dest.Role, o => o.MapFrom(src => src.RoleId != null ? new RoleDTO() { Id = src.RoleId.Value } : new RoleDTO()));

            CreateMap<LeadDTO, LeadOutputModel>()
                .ForPath(dest => dest.Birthday, o => o.MapFrom(src => src.Birthday.ToString(_shortDateFormat)))
                .ForPath(dest => dest.RegistrationDate, o => o.MapFrom(src => src.RegistrationDate.ToString(_longDateFormat)));


        }
    }
}
