using E_Shop.Business.Models.Output;
using E_Shop.Data;
using E_Shop.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Business.Managers
{
    public class LeadManager : ILeadManager
    {
        private ILeadRepository _leadRepository;
        public LeadManager(ILeadRepository leadRepository) 
        {
            _leadRepository = leadRepository;
        }
        public DataWrapper<LeadOutputModel> DeleteLead(long id)
        {
            throw new NotImplementedException();
        }

        
    }
}
