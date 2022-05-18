# frozen_string_literal: true

# before hook
def browser_can_clear_cookie?
  @driver.browser.respond_to?(:manage) && @driver.browser.manage.respond_to?(:delete_all_cookies)
end

Before("@login or @login-válido or @login-inválido or @add-cart or @cart or @compra or @busca") do
  Capybara.default_max_wait_time = 30
  Capybara.disable_animation = true
  Selenium::WebDriver::Chrome::Service.driver_path = "./chromedriver.exe"
  urls = YAML.safe_load(File.read("config/url.yml"), [], [], true)
  Capybara.app_host = urls["website"]['main_page']
  @browser_helper = BrowserHelper.new
  @driver = @browser_helper.configure_browser(browser: ENV["BROWSER"] || "chrome",
                                              execution_type: ENV["EMULATION_TYPE"] || "resolution",
                                              resolution: ENV["RESOLUTION"] || "1366,800",
                                              headless: ENV["HEADLESS"],
                                              allow_notifications: false)
  @browser_helper.try_to_maximize
  @pages = Base::PageFactory.new
end

Before("@wip or @ignore") do
  pending
end
