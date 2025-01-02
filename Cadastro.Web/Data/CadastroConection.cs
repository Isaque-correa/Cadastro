using System.Data;
using Microsoft.Data.SqlClient;


namespace Cadastro.Web.Data
{
    public class CadastroConection
    {
        private readonly string? _connectionString;

        public CadastroConection(IConfiguration configuration)
        {
           
            _connectionString = configuration.GetConnectionString("CadastroConnection");
           
        }
        public IDbConnection GetDbConnection()
        {
            return new SqlConnection(_connectionString);
        }
    }
}
