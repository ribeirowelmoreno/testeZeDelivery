#language: pt

@cart @rodar-tudo
Funcionalidade: Carrinho de compras
  Como um usuário Valido
  Quero adicionar itens no meu carrinho de compras
  Para que eu possa comprá-los e recebê-los em casa

  Contexto:
    Dado que acessei a pagina inicial do website

  Cenário: Validar adição de vinho ao carrinho
    E efetuar o login
    E acesso a carta de vinhos
    E selecionar um vinho
    Quando eu clicar em "adicionar"
    Então o vinho deve aparecer no meu carrinho de compras
    E limpar o carrinho de compras
