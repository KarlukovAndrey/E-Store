using E_Shop.Business.Models.Input;
using E_Shop.Business.Models.Output;
using E_Shop.Data;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Business.Managers
{
    public interface ILeadManager
    {
        DataWrapper<LeadOutputModel> CreateLead(LeadInputModel model);
        DataWrapper<LeadOutputModel> UpdateLead(LeadInputModel model);
        DataWrapper<LeadOutputModel> DeleteLead(long id);
        DataWrapper<List<LeadOutputModel>> FindLeads(SearchInputModel model);
        DataWrapper<List<LeadOutputModel>> FindLeads(long? id);
    }
}
