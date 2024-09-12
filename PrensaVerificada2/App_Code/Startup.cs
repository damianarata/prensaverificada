using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PrensaVerificada2.Startup))]
namespace PrensaVerificada2
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
