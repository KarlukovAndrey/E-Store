using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Data
{
    public class DataWrapper<T>
    {
        public T Data { get; set; }
        public bool IsOk => ErrorMessage == null;
        public string ErrorMessage { get; set; }
    }
}
