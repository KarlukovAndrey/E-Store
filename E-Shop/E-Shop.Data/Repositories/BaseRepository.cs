using System.Data;


namespace E_Shop.Data.Repositories
{
    abstract public class BaseRepository
    {
        public IDbConnection DbConnection { get; set; }

    }
}
