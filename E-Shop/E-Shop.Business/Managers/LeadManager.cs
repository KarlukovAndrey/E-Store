using AutoMapper;
using E_Shop.Business.Models.Input;
using E_Shop.Business.Models.Output;
using E_Shop.Data;
using E_Shop.Data.DTO;
using E_Shop.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Business.Managers
{
    public class LeadManager : ILeadManager
    {
        private ILeadRepository _leadRepository;
        private IMapper _mapper;
        public LeadManager(ILeadRepository leadRepository, IMapper mapper) 
        {
            _leadRepository = leadRepository;
            _mapper = mapper;
        }

        public DataWrapper<LeadOutputModel> CreateLead(LeadInputModel model) 
        {
            var leadDTO = _mapper.Map<LeadDTO>(model);
            var data = _leadRepository.CreateLead(leadDTO);
            var mapperData = _mapper.Map<LeadOutputModel>(data.Data);
            return new DataWrapper<LeadOutputModel>
            {
                Data = mapperData,
                ErrorMessage = data.ErrorMessage
            };
        }

        public DataWrapper<LeadOutputModel> UpdateLead(LeadInputModel model)
        {
            var leadDTO = _mapper.Map<LeadDTO>(model);
            var data = _leadRepository.UpdateLead(leadDTO);
            var mapperData = _mapper.Map<LeadOutputModel>(data.Data);
            return new DataWrapper<LeadOutputModel>
            {
                Data = mapperData,
                ErrorMessage = data.ErrorMessage
            };
        }
      
            public DataWrapper<LeadOutputModel> DeleteLead(long id)
        {
            var data = _leadRepository.DeleteLeadById(id);
            var mapperData = _mapper.Map<LeadOutputModel>(data.Data);
            return new DataWrapper<LeadOutputModel>
            {
                Data = mapperData,
                ErrorMessage = data.ErrorMessage
            };
        }

        public DataWrapper<List<LeadOutputModel>> FindLeads(SearchInputModel model)
        {
            var searchDto = _mapper.Map<SearchDTO>(model);
            var data = _leadRepository.SearchLead(searchDto);
            var mappedData = _mapper.Map<List<LeadOutputModel>>(data.Data);

            return new DataWrapper<List<LeadOutputModel>>
            {
                Data = mappedData,
                ErrorMessage = data.ErrorMessage
            };
        }

        public DataWrapper<List<LeadOutputModel>> FindLeads(long? id) => FindLeads(new SearchInputModel { Id = id });
    }
}
