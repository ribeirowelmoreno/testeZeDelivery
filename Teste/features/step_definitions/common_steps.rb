# frozen_string_literal: true

Dado(/^que acessei a pagina inicial do website$/) do
  visit "/produtos"
  @pages.login_page.dismiss_age_modal_if_exists
  @pages.login_page.accept_all_cookies
end

E(/^efetuar o login$/) do
  @pages.login_page.insert_email_password_and_press_enter
end


