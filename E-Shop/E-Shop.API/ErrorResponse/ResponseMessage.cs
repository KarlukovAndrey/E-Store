using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace E_Shop.API.ErrorResponse
{
    public class ResponseMessage
    {
        public const string InvalidIdValue = "Invalid Id value";
        public const string ZeroValue = "Value cannot equal zero";
        public const string NegativeValue = "Value cannot be negative";
        public const string BirthdayFieldMissing = "Please enter the Birthday";
        public const string AddressFieldMissing = "Please enter the address";
        public const string EmailFieldMissing = "Please enter the Email";
        public const string CityFieldMissing = "Please select a city";
        public const string FirstNameFieldMissing = "Please enter the FirstName";
        public const string LastNameFieldMissing = "Please enter the LastName";
        public const string PhoneFieldMissing = "Please enter the Phone";
        public const string PasswordFieldMissing = "Please come up with a password";
        public const string PaymentTypeFieldMissing = "Please select a payment type";
        public const string StoreFieldMissing = "Please select a store";
        public const string StatusFieldMissing = "Please select a status";
        public const string QuantityFieldMissing = "Please select a quantity";
        public const string OrderFieldMissing = "Please select a order"; 
        public const string DeliveryTypeFieldMissing = "Please select a delivery type";
        public const string LeadNotFound = "Lead doesn't exist";
        public const string OrderNotFound = "Order doesn't exist";
        public const string InvalidDateFormat = "Please change date to dd.MM.yyyy format";
        public const string InvalidEmailFormat = "Invalid email address. Please enter a valid email address.";
        public const string InvalidNameFormat = "Invalid name. Do not use '%'. Please try again.";
        public const string InvalidAddressFormat = "Invalid address. Do not use '%'. Please try again.";
        public const string InvalidPhoneFormat = "Invalid phone number format. Use digits only. Please try again.";
        public const string InvalidPaymentType = "Invalid payment type. Please try again.";
        public const string InvalidDeliveryType = "Invalid DeliveryType. Please try again.";
        public const string InvalidStatus = "Invalid Status. Please try again.";
        public const string InvalidStore = "Invalid Store. Please try again.";


    }
}
