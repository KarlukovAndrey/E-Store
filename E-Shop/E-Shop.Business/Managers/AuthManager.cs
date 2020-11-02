using AutoMapper;
using E_Shop.Business.Models.Output;
using E_Shop.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Business.Managers
{
    public class AuthManager
    {
        private ILeadRepository _leadRepository;
        private IMapper _mapper;


        public AuthManager(ILeadRepository leadRepository, IMapper mapper)
        {
            _leadRepository = leadRepository;
            _mapper = mapper;
        }

        public AuthOutputModel GetLeadByLogin(string login)
        {
            return _mapper.Map<AuthOutputModel>(_leadRepository.SelectLeadByLogin(login));
        }
    }
}
