# Cadastro

Este projeto foi desenvolvido como parte de um processo seletivo, utilizando **ASP.NET Core MVC**. A aplicação tem como objetivo gerenciar o cadastro de pessoas e permitir a vinculação de endereços a cada pessoa cadastrada.  

## Funcionalidades  

- **Cadastro de Pessoas:** Adicione, edite, visualize e exclua informações de pessoas.  
- **Vinculação de Endereço:** Associe um ou mais endereços a uma pessoa cadastrada. 
- **Interface Responsiva:** Design simples e intuitivo para facilitar a navegação.  

## Tecnologias Utilizadas  

- **ASP.NET Core MVC:** Framework para o desenvolvimento da aplicação.  
- **Dapper:** Gerenciamento e persistência de dados.  
- **SQL Server LocalDB:** Banco de dados utilizado para armazenamento dos cadastros.  
- **Bootstrap:** Para o design responsivo e estilização da interface.  

## Estrutura do Projeto  

O projeto foi desenvolvido seguindo o padrão **MVC** (Model-View-Controller), com foco em separação de responsabilidades, facilitando a manutenção e escalabilidade do código.  

### Diretórios Principais  

- **Models:** Contém as classes de domínio, como `Cliente` e `Endereco`.  
- **Controllers:** Controladores responsáveis por gerenciar as ações da aplicação.  
- **Views:** Arquivos de interface para exibição das páginas de cadastro e listagem.  

## Como Restaurar o Banco de dados

-Abra o Arquivo Cadastro.sql, que está localizado na pasta Data, e em seguida rode o sql para executar o script.
