using System;
using System.Collections.Generic;
using ServiceStack;

namespace SharpScript
{
    // The entire QueryCustomers AutoQuery Service (no implementation required)
    public class QueryCustomers : QueryDb<Customer> 
    {
        public string CustomerId { get; set; }
        public string CompanyNameContains { get; set; }
        public string[] CountryIn { get; set; }
    }    
}