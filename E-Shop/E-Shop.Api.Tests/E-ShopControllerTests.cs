using Autofac.Extensions.DependencyInjection;
using E_Shop.Api.Tests.Mocks;
using E_Shop.Api.Tests.Services;
using E_Shop.API;
using E_Shop.Business.Models.Input;
using E_Shop.Business.Models.Output;
using FluentAssertions;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.TestHost;
using Newtonsoft.Json;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace E_Shop.Api.Tests
{
    [TestFixture]
    public class E_ShopControllerTests
    {
        private TestServer _server;
        private HttpClient _client;
        [SetUp]
        public void Setup()
        {
            _server = new TestServer(new WebHostBuilder()
             .UseContentRoot(Directory.GetCurrentDirectory())
             .UseIISIntegration()
             .ConfigureServices(services => services.AddAutofac())
             .UseStartup<Startup>());

            _client = _server.CreateClient();
        }

        [TestCaseSource(typeof(LeadInputModelMock))]
        public async Task AddLeadTest(LeadInputModel model)
        {
            var content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8,
                      "application/json");
            var response = await _client.PostAsync(RouteString.createLead, content);
            var outputModel = response.Content.ReadAsAsync<LeadOutputModel>().Result;
            outputModel.Should().BeEquivalentTo(model, options => options.Excluding(o => o.Id).ExcludingMissingMembers());
        }
    }
}
