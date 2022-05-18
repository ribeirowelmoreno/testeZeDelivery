# frozen_string_literal: true

Quando(/^que faço uma busca por um produto$/) do
  @pages.products_page.search_for_a_random_product
end

Então(/^o produto que eu busquei deve aparecer na tela$/) do
  expect(@pages.products_page.products_search_result).to be_visible
end

Quando(/^eu selecionar a categria cerveja$/) do
  @pages.products_page.wait_until_cervejas_visible
  @pages.products_page.cervejas.click
end

Então(/^deve ser mostrado todas as cervejas dispoíveis$/) do
  expect(@pages.products_page.title_cervejas).to be_visible
end
