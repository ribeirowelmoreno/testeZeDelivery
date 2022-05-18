# frozen_string_literal: true

module Base
  class ProductsPage < Base::CommonPage
    element :destilados, "#category-Destilados"
    element :cervejas, "#category-Cervejas"
    element :vinhos, "#category-Vinhos"
    element :sem_alcool, "#category-Sem Álcool"
    element :lojinha, "#category-Lojinha"
    element :comidinha, "#category-Comidinhas"
    element :title_explorar_categorias, 'div[class*="pillShelfTitle"]'
    elements :card_vinhos, "#product-card"
    element :product_amount, "#product-amount"
    element :product_title, 'h1[class*="productTitle"]'
    element :delivery_options, "#delivery-options-card"
    element :products_search_result, "#search-product-list"
    element :search_field, "#search-product-input"
    element :title_cervejas, :xpath, '//h1[contains(text(), "Cervejas")]'
    element :trash_icon, '#product-delete-button'
    element :modal_delete_product_cart, 'div[id*="modal-close"]'
    element :button_ok_modal_delete_product, '#primary-modal-button'

    #Cart
    element :product_title_cart, 'div[class*="productTitle"]'
    element :finish_order, "#finish-order"

    def select_product
      yml_path = Config.load_config(filename: 'products')['bebidas']
      bebidas = yml_path[yml_path.keys.sample]
      bebidas
    end

    def search_for_a_random_product
      random_drinks = select_product
      wait_until_search_field_visible
      search_field.send_keys(random_drinks)
    end
  end
end
