using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Business.Models.Input
{
    public class SearchInputModel
    {
        public long? Id { get; set; }
        public string FirstName { get; set; }
        public int? FirstNameSearchMode { get; set; }
        public string LastName { get; set; }
        public int? LastNameSearchMode { get; set; }
        public string BirthdayFrom { get; set; }
        public string BirthdayTo { get; set; }
        public string Phone { get; set; }
        public int? PhoneSearchMode { get; set; }
        public string Email { get; set; }
        public int? EmailSearchMode { get; set; }
        public int? RoleId { get; set; }
        public int? CityId { get; set; }
        public bool? IsDeleted { get; set; }
        public string RegistrationDateFrom { get; set; }
        public string RegistrationDateTo { get; set; }
    }
}
