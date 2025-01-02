namespace Cadastro.Web.Models
{
    public class CadastroViewModel
    {
        public Cliente Cliente { get; set; }
        public IEnumerable<Endereco> Endereco { get; set; }
    }
}
