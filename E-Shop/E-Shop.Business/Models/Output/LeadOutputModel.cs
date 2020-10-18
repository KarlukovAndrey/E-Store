namespace E_Shop.Business.Models.Output
{
    public class LeadOutputModel
    {
        public long? Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string RegistrationDate { get; set; }
        public string Birthday { get; set; }
        public string Address { get; set; }
        public string CityName { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string RoleName { get; set; }
    }
}
