using Cadastro.Web.Data;
using Cadastro.Web.Models;
using Dapper;
using Microsoft.AspNetCore.Mvc;

namespace Cadastro.Web.Controllers
{
    public class CadastroController : Controller
    {
        private readonly CadastroConection db;

        public CadastroController(CadastroConection cadastroConection)
        {
            db = cadastroConection;
        }

        public IActionResult Adicionar()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Adicionar(Cliente cliente)
        {
            using (var connection = db.GetDbConnection())
            {
                string sql = "INSERT INTO Cliente (Nome, Telefone, CPF) VALUES (@Nome, @Telefone, @CPF)";
                await connection.ExecuteAsync(sql, cliente);
                return RedirectToAction("Index");
            }
        }
        public async Task<IActionResult> Index()
        {
            using (var connection = db.GetDbConnection())
            {
                string sql = "SELECT * FROM Cliente";
                return View(await connection.QueryAsync<Cliente>(sql));
            }


        }

        public async Task<IActionResult> Editar(int idCliente)
        {
            using (var connection = db.GetDbConnection())
            {
                var cadastroViewModel = new CadastroViewModel();
                string cliente = "SELECT * FROM Cliente WHERE IdCliente = @idCliente";
                string enderecos = "SELECT * FROM Endereco WHERE IdCliente = @idCliente";
                cadastroViewModel.Cliente = await connection.QuerySingleAsync<Cliente>(cliente, new { idCliente = idCliente });
                cadastroViewModel.Endereco = await connection.QueryAsync<Endereco>(enderecos, new { idCliente = idCliente });
                return View(cadastroViewModel);
            }
        }
        [HttpPost]
        public async Task<IActionResult> Editar(Cliente cliente)
        {
            using (var connection = db.GetDbConnection())
            {
                string sql = "UPDATE Cliente SET Nome=@Nome, Telefone=@Telefone, CPF=@CPF WHERE IdCliente = @IdCliente  ";
                await connection.ExecuteAsync(sql, cliente);
                return RedirectToAction("Index");
            }
        }
        ///ENDEREÇO

        public IActionResult Endereco(int idCliente)
        {

            return View(new Endereco { IdCliente = idCliente });
        }
        [HttpPost]

        public async Task<IActionResult> Endereco(Endereco endereco)
        {
            using (var connection = db.GetDbConnection())
            {
                string sql = "INSERT INTO Endereco (IdCliente, Cidade, Estado, Logradouro, CEP) VALUES (@IdCliente, @Cidade, @Estado, @Logradouro , @CEP)";
                await connection.ExecuteAsync(sql, endereco);
                return RedirectToAction("Editar", new { idCliente = endereco.IdCliente });
            }


        }

        public async Task<IActionResult> ExcluirEndereco(int idEndereco, int idCliente)
        {
            using (var connection = db.GetDbConnection())
            {
                string sql = "DELETE FROM Endereco WHERE IdEndereco = @IdEndereco";
                await connection.ExecuteAsync(sql, new {IdEndereco = idEndereco});
                return RedirectToAction("Editar", new { idCliente = idCliente });
            }
        }
        public async Task<IActionResult> ExcluirCliente(int idCliente)
        {
            using (var connection = db.GetDbConnection())
            {
                string endereco = "DELETE FROM Endereco WHERE IdCliente = @IdCliente";
                string cliente = "DELETE FROM Cliente WHERE IdCliente = @IdCliente";
                await connection.ExecuteAsync(endereco, new { IdCliente = idCliente });
                await connection.ExecuteAsync(cliente, new { IdCliente = idCliente });
                return RedirectToAction("index");
            }
        }


    }


}
