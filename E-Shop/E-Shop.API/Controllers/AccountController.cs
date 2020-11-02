using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using E_Shop.API.Services;
using E_Shop.Business.Hashing;
using E_Shop.Business.Managers;
using E_Shop.Business.Models.Input;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace E_Shop.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : Controller
    {
        AuthManager _authManager;
        TokenService _tokenService;

        public AccountController(AuthManager authManager, TokenService tokenService)
        {
            _authManager = authManager;
            _tokenService = tokenService;
        }

        [HttpPost("token")]
        public IActionResult Token(AuthInputModel authModel)
        {
            var lead = _authManager.GetLeadByLogin(authModel.Login);
            if (lead == null)
            {
                return Unauthorized(new { errorText = "Invalid login." });
            }
            else
            {
                if (BCryptHashing.ValidatePassword(authModel.Password, lead.Password))
                {
                    var identity = _tokenService.GetIdentity(lead);
                    string token = _tokenService.GetToken(identity);

                    var response = new
                    {
                        access_token = token,
                        username = identity.Name
                    };
                    return Json(response);
                }
                return Unauthorized(new { errorText = "Invalid password." });
            }
        }
    }
}