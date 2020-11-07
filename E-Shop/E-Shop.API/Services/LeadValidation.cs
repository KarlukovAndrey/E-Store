using E_Shop.API.ErrorResponse;
using E_Shop.Business.Managers;
using E_Shop.Business.Models.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace E_Shop.API.Services
{
    public class LeadValidation
    {
        ILeadManager _leadManager;
        public LeadValidation(ILeadManager leadManager)
        {
            _leadManager = leadManager;
        }

        public string ValidateLeadInputModel(LeadInputModel model)
        {
            string validationResult = string.Empty;

            validationResult += model.Birthday == null ? $"{ResponseMessage.BirthdayFieldMissing} \n" :
               ValidateDateFormat(model.Birthday);

            validationResult += model.Email == null ? $"{ResponseMessage.EmailFieldMissing} \n" :
                ValidateEmailFormat(model.Email);

            validationResult += model.FirstName == null ? $"{ResponseMessage.FirstNameFieldMissing} \n" :
                ValidateNameFormat(model.FirstName);

            validationResult += model.LastName == null ? $"{ResponseMessage.LastNameFieldMissing} \n" :
               ValidateNameFormat(model.LastName);

            validationResult += model.Address == null ? $"{ResponseMessage.AddressFieldMissing} \n" :
              ValidateAddressFormat(model.Address);

            validationResult += model.Phone == null ? $"{ResponseMessage.PhoneFieldMissing} \n" :
                ValidatePhoneFormat(model.Phone);
            if (model.Password == null)
            {
                validationResult += $"{ResponseMessage.PasswordFieldMissing} \n";
            }
            if (model.CityId == 0)
            {
                validationResult += $"{ ResponseMessage.CityFieldMissing} \n";
            }
            return validationResult;
        }
        public string ValidateDateFormat(string date)
        {
            if (!Regex.Match(date, @"(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d").Success)
            {
                return $"{ResponseMessage.InvalidDateFormat} \n";
            }
            return $"{string.Empty}";
        }
        public string ValidateEmailFormat(string email)
        {
            if (!Regex.Match(email, @"^[^@%\s]+@[^@%\s]+\.[^%@\s]+$").Success)
            {
                return $"{ResponseMessage.InvalidEmailFormat} \n";
            }
            return $"{string.Empty}";
        }
        public string ValidatePhoneFormat(string phone)
        {
            if (!Regex.Match(phone, @"^[0-9]+$").Success)
            {
                return $"{ResponseMessage.InvalidPhoneFormat} \n";
            }
            return $"{string.Empty}";
        }
        public string ValidateNameFormat(string name)
        {
            if (Regex.Match(name, @"%+").Success)
            {
                return $"{ResponseMessage.InvalidNameFormat} \n";
            }
            return $"{string.Empty}";
        }
        public string ValidateAddressFormat(string address)
        {
            if (Regex.Match(address, @"%+").Success)
            {
                return $"{ResponseMessage.InvalidAddressFormat} \n";
            }
            return $"{string.Empty}";
        }
        public string ValidateLeadInputModelForUpdate(LeadInputModel model)
        {
            var tmp = ValidateLeadInputModel(model);
            if (model.Id.Value <= 0)
            {
                tmp += $"{ResponseMessage.InvalidIdValue} \n";
            }
            return tmp;
        }
        public string ValidateIdValue(long? id)
        {
            if (id <= 0)
            {
                return ResponseMessage.InvalidIdValue;
            }
            var result = _leadManager.FindLeads(id);
            if (result.IsOk)
            {
                if (result.Data.Count == 0)
                {
                    return ResponseMessage.LeadNotFound;
                }
            }
            return $"{string.Empty}";
        }
    }
}
