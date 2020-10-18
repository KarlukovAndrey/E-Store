using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.DAL.DTO
{
    public class LeadDTO
    {
        public long? Id {get; set;}
        public string FirstName { get; set; } 
        public string LastName { get; set; }
        public DateTime RegistractionDate { get; set; }
        public DateTime Birthday { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public bool isDeleted { get; set; }
        public int CityId { get; set; }
        public RoleDto Role { get; set; }
        public CityDto City { get; set; }




    }
}
