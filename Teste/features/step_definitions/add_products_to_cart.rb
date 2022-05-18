# frozen_string_literal: true

E(/^acesso a carta de vinhos$/) do
  @pages.products_page.wait_until_vinhos_visible
  @pages.products_page.vinhos.click
end

E(/^selecionar um vinho$/) do
  @pages.products_page.wait_until_title_explorar_categorias_visible
  @pages.products_page.card_vinhos.first.click
  @drink_name_before_add = @pages.products_page.product_title.text.downcase
end

Quando(/^eu clicar em "adicionar"$/) do
  @pages.products_page.wait_until_product_amount_visible
  @pages.products_page.product_amount.click
end

Então(/^o vinho deve aparecer no meu carrinho de compras$/) do
  @pages.products_page.wait_until_finish_order_visible
  @drink_name_after_add = @pages.products_page.product_title_cart.text.downcase
  expect(@drink_name_before_add).to eq @drink_name_after_add
end

E(/^informo minha localização$/) do
  @pages.location_page.allow_location
  @pages.products_page.delivery_options.click
  @pages.location_page.wait_until_use_my_location_visible
  @pages.location_page.use_my_location.click
  @pages.location_page.wait_until_confirm_location_visible
  @pages.location_page.confirm_location.click
  @pages.location_page.fill_location_data
end

E(/^limpar o carrinho de compras$/) do
  @pages.products_page.wait_until_trash_icon_visible
  @pages.products_page.trash_icon.click
  @pages.products_page.wait_until_modal_delete_product_cart_visible
  @pages.products_page.button_ok_modal_delete_product.click
end

E(/^$/) do
end

E(/^$/) do
end
