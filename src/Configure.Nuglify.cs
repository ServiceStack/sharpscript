using System;
using ServiceStack;
using ServiceStack.Html;
using NUglify;

namespace SharpScript
{
    public class NUglifyJsMinifier : ICompressor
    {
        public string Compress(string js)
        {
            try
            {
                return Uglify.Js(js).Code;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return js;
            }
        }
    }
    public class NUglifyCssMinifier : ICompressor
    {
        public string Compress(string css) => Uglify.Css(css).Code;
    }
    public class NUglifyHtmlMinifier : ICompressor
    {
        public string Compress(string html) => Uglify.Html(html).Code;
    }

    public class ConfigureNUglify : IConfigureAppHost
    {
        public void Configure(IAppHost appHost)
        {
            Minifiers.JavaScript = new NUglifyJsMinifier();
            Minifiers.Css = new NUglifyCssMinifier();
            Minifiers.Html = new NUglifyHtmlMinifier();
        }
    }
}