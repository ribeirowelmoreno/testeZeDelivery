# frozen_string_literal: true

Quando(/^eu inserir um e-mail e senha válidos$/) do
  @pages.login_page.wait_until_enter_button_visible
  @pages.login_page.enter_button.click
  @pages.login_page.valid_login
end

Então(/^pressionar o botão de login$/) do
  @pages.login_page.wait_until_button_login_visible
  @pages.login_page.button_login.click
end

Então(/^devo ser redirecionado para a página principal$/) do
  expect(@pages.login_page.user_identifier).to be_visible
end

Quando(/^eu inserir um e-mail e senha inválidos$/) do
  @pages.login_page.wait_until_enter_button_visible
  @pages.login_page.enter_button.click
  @pages.login_page.invalid_login
end

Então(/^devo permacecer na página de login$/) do
  expect(@pages.login_page.input_email).to be_visible
end

