#language: pt

@login @rodar-tudo
Funcionalidade: Login
  Como um usuário Valido
  Quero fazer login na aplicação web
  Para que eu possa acessar as funcionalidades da aplicação

  Contexto:
    Dado que acessei a pagina inicial do website

  Cenário: Efetuar login com usuário e senha válidos
    Quando eu inserir um e-mail e senha válidos
    E pressionar o botão de login
    Então devo ser redirecionado para a página principal

  Cenário: Efetuar login com usuário e senha inválidos
    Quando eu inserir um e-mail e senha inválidos
    E pressionar o botão de login
    Então devo permacecer na página de login