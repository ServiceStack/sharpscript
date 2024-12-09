using System.Linq;
using ServiceStack;
using ServiceStack.Script;
using ServiceStack.IO;

namespace SharpScript
{
    [Route("/emails/order-confirmation/preview")]
    public class PreviewHtmlEmail : IReturn<PreviewHtmlEmailResponse>
    {
        public string EmailTemplate { get; set; }
        public string HtmlTemplate { get; set; }
        public string PreviewCustomerId { get; set; }
    }

    public class PreviewHtmlEmailResponse 
    {
        public string HtmlEmail { get; set; }
        public string TextEmail { get; set; }
    }

    public class EmailTemplatesServices : Service
    {
        public ICustomers Customers { get; set; }

        public object Any(PreviewHtmlEmail request)
        {
            var customer = Customers.GetCustomer(request.PreviewCustomerId) 
                ?? Customers.GetAllCustomers().First();

            var context = new ScriptContext {
                PageFormats = { new MarkdownPageFormat() },
                Args = {
                    ["customer"] = customer,
                    ["order"] = customer.Orders.LastOrDefault(),
                }
            }.Init();

            context.VirtualFiles.WriteFile("email.md", request.EmailTemplate);
            context.VirtualFiles.WriteFile("layout.html", request.HtmlTemplate);

            var textEmail = new PageResult(context.GetPage("email")).Result;
            var htmlEmail = new PageResult(context.GetPage("email")) {
                Layout = "layout",
                PageTransformers = { MarkdownPageFormat.TransformToHtml }
            }.Result;

            return new PreviewHtmlEmailResponse {
                TextEmail = textEmail,
                HtmlEmail = htmlEmail,
            };
        }
    }
}