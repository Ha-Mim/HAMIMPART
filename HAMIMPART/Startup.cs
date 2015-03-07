using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HAMIMPART.Startup))]
namespace HAMIMPART
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
