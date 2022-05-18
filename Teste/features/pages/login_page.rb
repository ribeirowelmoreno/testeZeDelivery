# frozen_string_literal: true

module Base
  class LoginPage < Base::CommonPage
    set_url "produtos"

    element :enter_button, "#header-button-sign-in"
    element :input_email, "#login-mail-input-email"
    element :input_pass, "#login-mail-input-password"
    element :button_login, "#login-mail-button-sign-in"
    element :age_modal, "div[class*=modal-modal]"
    element :button_yes_age_modal, "#age-gate-button-yes"
    elements :button_accept_cookies, "#onetrust-accept-btn-handler"
    element :user_identifier, "#header-user-badge"

    def select_user_valid
      email = Config.load_config(filename: "data")["users"]["valid-user"]["email"]
      pass = Config.load_config(filename: "data")["users"]["valid-user"]["pass"]
      [email, pass]
    end

    def select_user_invalid
      email = Config.load_config(filename: "data")["users"]["invalid-user"]["email"]
      pass = Config.load_config(filename: "data")["users"]["invalid-user"]["pass"]
      [email, pass]
    end

    def valid_login
      user = select_user_valid
      wait_until_input_email_visible
      input_email.send_keys(user[0])
      wait_until_input_pass_visible
      input_pass.send_keys(user[1])
      user
    end

    def insert_email_password_and_press_enter
      user = select_user_valid
      wait_until_enter_button_visible
      enter_button.click
      wait_until_input_email_visible
      input_email.send_keys(user[0])
      wait_until_input_pass_visible
      input_pass.send_keys(user[1])
      wait_until_button_login_visible
      button_login.click
    end

    def invalid_login
      user = select_user_invalid
      wait_until_input_email_visible
      input_email.send_keys(user[0])
      wait_until_input_pass_visible
      input_pass.send_keys(user[1])
      user
    end

    def wait_until_login_has_been_successfully_performed
      perform_operation_with_different_wait_time(new_wait_time: 2) do
        wait = Selenium::WebDriver::Wait.new(timeout: timeout, interval: interval)
        wait(timeout: 60, error_message: "Error when logging in, took more than 60 seconds!") do
          !has_input_email?
        end
      end
    end

    def dismiss_age_modal_if_exists
      perform_operation_with_different_wait_time(new_wait_time: 10) do
        button_yes_age_modal.click if has_age_modal?
      end
    end

    def accept_all_cookies
      perform_operation_with_different_wait_time(new_wait_time: 10) do
        button_accept_cookies.last.click if has_button_accept_cookies?
      end
    end
  end
end
