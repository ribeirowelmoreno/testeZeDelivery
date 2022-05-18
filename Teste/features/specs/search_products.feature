#language: pt

@busca @rodar-tudo
Funcionalidade: Carrinho de compras
  Como um usuário Valido
  Quero fazer uma busca por um produto
  Para que eu possa encontrar o que eu preciso com rapidez

  Contexto:
    Dado que acessei a pagina inicial do website

  Cenário: Validar busca de um produto
    E efetuar o login
    Quando que faço uma busca por um produto
    Então o produto que eu busquei deve aparecer na tela

  Cenário: Validar seleção de categoria cerveja
    E efetuar o login
    Quando eu selecionar a categria cerveja
    Então deve ser mostrado todas as cervejas dispoíveis

