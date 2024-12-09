using System;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using ServiceStack;

namespace SharpScript
{
    public class Startup : ModularStartup
    {
        public Startup(IConfiguration configuration) : base(configuration){}

        public new void ConfigureServices(IServiceCollection services) {}

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            var cultureInfo = new System.Globalization.CultureInfo("en-US");
            System.Globalization.CultureInfo.DefaultThreadCurrentCulture = cultureInfo;
            System.Globalization.CultureInfo.DefaultThreadCurrentUICulture = cultureInfo;

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseServiceStack(new AppHost());
        }
    }
}
