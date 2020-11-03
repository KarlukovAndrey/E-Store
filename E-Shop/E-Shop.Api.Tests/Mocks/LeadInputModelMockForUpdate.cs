using E_Shop.Api.Tests.Services;
using E_Shop.Business.Models.Input;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Api.Tests.Mocks
{

    public class LeadInputModelMockForUpdate : IEnumerable
    {
        private string _emailString;
        public IEnumerator GetEnumerator()
        {
            yield return new LeadInputModel()
            {
                Id = 1,
                FirstName = "Lena",
                LastName = "Ivanova",
                Birthday = "01.01.1991",
                Address = "Repina 9",
                Phone = "89211354575",
                Email = SetString(),
                Password = "qwe!r%ty12@",
                CityId = 1,
                RoleId = 1
            };
            yield return new LeadInputModel()
            {
                Id = 2,
                FirstName = "Vlad",
                LastName = "Kadad",
                Birthday = "31.12.1991",
                Address = "Repina 10",
                Phone = "89211321575",
                Email = SetString(),
                Password = "qwe%ty12@",
                CityId = 1,
                RoleId = 2
            };
        }

        private string SetString()
        {
            _emailString = RandomString.GetRandomString("abcdefghijklmnopqrstuvwxyz", 10) + "@test.ru";
            return _emailString;
        }
    }
}
