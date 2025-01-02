namespace Cadastro.Web.Models
{
    public class Endereco
    {
        public int IdEndereco {  get; set; }    
        public int IdCliente { get; set; }
        public string Cidade { get; set; }  
        public string Estado { get; set; }
        public string Logradouro {  get; set; }
        public string CEP { get; set; }

    }
}
