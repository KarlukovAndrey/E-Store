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
    public class LeadRepository : BaseRepository, ILeadRepository
    {
        public LeadRepository(IOptions<DBSettings> options)
        {
            DbConnection = new SqlConnection(options.Value.ConnectionString);
        }


        public DataWrapper<LeadDTO> CreateLead(LeadDTO dto)
        {
            var result = new DataWrapper<LeadDTO>();
            try
            {
                result.Data = DbConnection.Query<LeadDTO, RoleDTO, CityDTO, LeadDTO>(
                    StoredProcedure.CreateLeadProcedure,
                    (lead, role, city) =>
                    {
                        lead.Role = role;
                        lead.City = city;
                        return lead;
                    },
                    new
                    {
                        CityId = dto.City.Id,
                        dto.FirstName,
                        dto.LastName,
                        dto.Birthday,
                        dto.Address,
                        dto.Phone,
                        dto.Email,
                        dto.Password,
                    },
                     splitOn: "Id",
                    commandType: CommandType.StoredProcedure
                    ).SingleOrDefault();
            }
            catch (Exception ex)
            {
                result.ErrorMessage = ex.Message;
            }
            return result;
        }
        public DataWrapper<LeadDTO> UpdateLead(LeadDTO leadDto)
        {
            var data = new DataWrapper<LeadDTO>();
            try
            {
                data.Data = DbConnection.Query<LeadDTO, RoleDTO, CityDTO, LeadDTO>(
                    StoredProcedure.UpdateLeadByIdProcedure,
                    (lead, role, city) =>
                    {
                        lead.Role = role;
                        lead.City = city;
                        return lead;
                    },
                    new
                    {
                        leadDto.Id,
                        CityId = leadDto.City.Id,
                        leadDto.FirstName,
                        leadDto.LastName,
                        leadDto.RegistrationDate,
                        leadDto.Birthday,
                        leadDto.Address,
                        leadDto.Phone,
                        leadDto.Email,
                        RoleId = leadDto.Role.Id
                    },
                    splitOn: "Id",
                    commandType: CommandType.StoredProcedure).
                    SingleOrDefault();
            }
            catch (Exception ex)
            {
                data.ErrorMessage = ex.Message;
            }
            return data;
        }

        public DataWrapper<LeadDTO> DeleteLeadById(long id)
        {
            var data = new DataWrapper<LeadDTO>();
            try
            {
                data.Data = DbConnection.Query<LeadDTO, RoleDTO, CityDTO, LeadDTO>(
                    StoredProcedure.DeleteLeadProcedure,
                    (lead, role, city) =>
                    {
                        lead.Role = role;
                        lead.City = city;
                        return lead;
                    },
                    new { id },
                    splitOn: "Id",
                    commandType: CommandType.StoredProcedure).
                    SingleOrDefault();
            }
            catch (Exception ex)
            {
                data.ErrorMessage = ex.Message;
            }
            return data;
        }

        public DataWrapper<List<LeadDTO>> SearchLead(SearchDTO searchDto)
        {
            var data = new DataWrapper<List<LeadDTO>>();
            try
            {
                data.Data = DbConnection.Query<LeadDTO, RoleDTO, CityDTO, LeadDTO>(
                StoredProcedure.SearchLead,
                (lead, role, city) =>
                {
                    lead.Role = role;
                    lead.City = city;
                    return lead;
                }, new
                {
                    searchDto.Id,
                    RoleId = searchDto.Role?.Id,
                    CityId = searchDto.City?.Id,
                    searchDto.FirstName,
                    searchDto.FirstNameSearchMode,
                    searchDto.LastName,
                    searchDto.LastNameSearchMode,
                    searchDto.BirthdayFrom,
                    searchDto.BirthdayTo,
                    searchDto.RegistrationDateFrom,
                    searchDto.RegistrationDateTo,
                    searchDto.Phone,
                    searchDto.PhoneSearchMode,
                    searchDto.Email,
                    searchDto.EmailSearchMode,
                    searchDto.IsDeleted
                },
                splitOn: "Id",
                commandType: CommandType.StoredProcedure
                ).ToList();
            }
            catch(Exception ex)
            {
                data.ErrorMessage = ex.Message;
            }
            return data;

        }
    }
}
