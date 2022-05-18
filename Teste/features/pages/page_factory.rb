# frozen_string_literal: true

module Base
  class PageFactory
    def login_page
      LoginPage.new
    end

    def common_page
      CommonPage.new
    end

    def products_page
      ProductsPage.new
    end

    def location_page
      LocationPage.new
    end
  end
end
