using E_Shop.Core.Settings;
using Microsoft.Extensions.Options;
using Microsoft.VisualBasic.FileIO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace E_Shop.Data.Repositories
{
    public class LeadRepository : BaseRepository, ILeadRepository
    {
        public LeadRepository(IOptions<DBSettings> options)
        {
            DbConnection = new SqlConnection(options.Value.ConnectionString);
        }
    }
}
