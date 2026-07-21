#language: pt

Funcionalidade: Pesquisar Funcionarios
    Para averiguar informacoes
    O usuário do sistema
    Deseja poder consultar informacoes dos funcionarios

    Cenario: Buscar informacoes de funcionario
        Dado que o usuario consulte informacoes de funcionario
        Quando ele realizar a pesquisa
        Entao uma lista de funcionarios deve retornar

    @cenario_dois
    Cenario: Cadastrar funcionario
        Dado que o usuario cadastre um nome funcionario
        Quando ele enviar as informacoes do funcionario
        Entao esse funcionario sera cadastrado

    @cenario_tres
    Cenario: Alterar informacoes cadastrais
        Dado que o usuario altere uma informacao de  funcionario
        Quando ele enviar as novas informacoes
        Entao as informacoes serao alteradas

    @cenario_quatro
    Cenario: Deletar cadastro de funcionarios
        Dado que o usuario queira deletar um funcionario
        Quando ele enviar a identificacao unica
        Entao esse funcionario sera delatado do sistema