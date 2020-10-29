using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Data.DTO
{
    public class SearchDTO
    {
        public long? Id { get; set; }
        public string FirstName { get; set; }
        public int? FirstNameSearchMode { get; set; }
        public  string LastName { get; set; }
        public int? LastNameSearchMode { get; set; }
        public DateTime? BirthdayFrom { get; set; }
        public DateTime? BirthdayTo { get; set; }
        public string Phone { get; set; }
        public int? PhoneSearchMode { get; set; }
        public string Email { get; set; }
        public int? EmailSearchMode { get; set; }
        public RoleDTO Role { get; set; }
        public CityDTO City { get; set; }
        public bool? IsDeleted { get; set; }
        public string RegistrationDateFrom { get; set; }
        public string RegistrationDateTo { get; set; }

    }
}
