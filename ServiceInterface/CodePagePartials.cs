using System.Linq;
using System.Collections.Generic;
using ServiceStack;
using ServiceStack.Script;

namespace SharpScript
{
    [Page("navLinks")]
    public class NavLinksPartial : SharpCodePage
    {
        string render(string PathInfo, Dictionary<string, object> links) => $@"
        <ul>
            {links.Map(entry => $@"<li class='{GetClass(PathInfo, entry.Key)}'>
                <a href='{entry.Key}'>{entry.Value}</a>
            </li>").Join("")}
        </ul>";

        string GetClass(string pathInfo, string url) => url == pathInfo ? "active" : ""; 
    }

    [Page("customerCard")]
    public class CustomerCardPartial : SharpCodePage
    {
        public ICustomers Customers { get; set; }

        string render(string customerId) => renderCustomer(Customers.GetCustomer(customerId));

        string renderCustomer(Customer customer) => $@"
        <table class='table table-bordered'>
            <caption>{customer.CompanyName}</caption>
            <thead class='thead-inverse'>
                <tr>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Fax</th>
                </tr>
            </thead>
            <tr>
                <td>
                    {customer.Address} 
                    {customer.City}, {customer.PostalCode}, {customer.Country}
                </td>
                <td>{customer.Phone}</td>
                <td>{customer.Fax}</td>
            </tr>
        </table>";
    }
}