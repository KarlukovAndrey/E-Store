using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Api.Tests.Services
{
    public static class RandomString
    {
        public static string GetRandomString(string Alphabet, int Length)
        {

            Random rnd = new Random();
            StringBuilder sb = new StringBuilder(Length - 1);
            int Position = 0;
            for (int i = 0; i < Length; i++)
            {
                Position = rnd.Next(0, Alphabet.Length - 1);
                sb.Append(Alphabet[Position]);
            }
            return sb.ToString();
        }
    }
}