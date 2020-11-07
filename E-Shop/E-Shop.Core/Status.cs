using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Core
{
    public enum Status
    {
        processing = 1,
        picking,
        readyForDelivery,
        cancelled,
        completed
    }
}
