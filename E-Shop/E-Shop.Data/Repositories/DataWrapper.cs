using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Data.Repositories
{
    public class DataWrapper<T>
    {
        public T Data { get; set; }
        public bool IsOk => ErrorMessage == null;
        public string ErrorMessage { get; set; }
    }
}
