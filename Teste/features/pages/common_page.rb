# frozen_string_literal: true

require_relative "../pages/page"

module Base
  class CommonPage < Page
    def perform_operation_with_different_wait_time(new_wait_time:)
      prev_time = Capybara.default_max_wait_time
      Capybara.default_max_wait_time = new_wait_time
      get_return_value_if_any = yield
      Capybara.default_max_wait_time = prev_time
      get_return_value_if_any
    end

    def insert_user_according_with_env
      case ENV['COUNTRY']
      when 'brazil'
        'brazil-user'
      end
    end
  end
end
