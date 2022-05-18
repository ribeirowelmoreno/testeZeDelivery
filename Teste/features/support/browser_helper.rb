# frozen_string_literal: true

require_relative "../support/log_helper.rb"
require "capybara"
require "selenium-webdriver"

class BrowserHelper

  attr_accessor :driver
  
  def initialize(driver: nil)
    @driver = driver
  end

  def browser_can_clear_cookie?
    @driver.browser.respond_to?(:manage) && @driver.browser.manage.respond_to?(:delete_all_cookies)
  end

  def configure_browser(
    browser: ENV["BROWSER"] || "chrome",
    execution_type: ENV["EXECUTION_TYPE"] || "resolution",
    resolution: ENV["RESOLUTION"] || "1366,768",
    device_model: ENV["DEVICE_MODEL"] || "Pixel 2",
    headless: ENV["HEADLESS"] || false,
    allow_notifications: false,
    remote_hostname: ENV["REMOTE_HOSTNAME"] || nil
  )
    selected_browser = :selenium_chrome
    case browser.downcase
    when "chrome"
      user_agents = Config.load_config(filename: "useragents")["web-app"]["user-agents"]
      chrome_options = Selenium::WebDriver::Chrome::Options.new
      chrome_options.add_argument("--window-size=#{resolution}")
      chrome_options.add_argument("--force-device-scale-factor=1")
      chrome_options.add_option("excludeSwitches", ["enable-automation"])
      chrome_options.add_argument("--user-agent=#{user_agents.values.sample}")

      unless allow_notifications
        chrome_options.add_argument("--disable-notifications")
        chrome_options.add_argument("--disable-desktop-notifications")
        chrome_options.add_argument("--disable-infobars")
        chrome_options.add_argument("--disable-popup-blocking")
        chrome_options.add_argument("--disable-save-password-bubble")
      end

      if headless.eql? true
        chrome_options.add_argument("--headless")
        chrome_options.add_argument("--disable-gpu")
      end

      chrome_options.add_emulation(device_name: device_model) if execution_type.downcase.eql? "mobileemulation"
      chrome_options.add_preference(:download, { prompt_for_download: false })
      chrome_options.add_preference(:credentials_enable_service, false)
      chrome_options.add_preference(:profile,
                                    {
                                      password_manager_enabled: false,
                                      default_content_settings: {
                                        popups: 0,
                                        notifications: allow_notifications ? 1 : 2,
                                      },
                                      content_settings: { pattern_pairs: { '*': { 'multiple-automatic-downloads': 1 } } },
                                    })

      capabilities = {
        'goog:chromeOptions': {
          args: chrome_options.args.entries,
          prefs: chrome_options.prefs,
          mobileEmulation: chrome_options.emulation,
          options: chrome_options.options,
        },
      }
      Capybara.register_driver :chrome do |app|
        caps = Selenium::WebDriver::Remote::Capabilities.chrome(capabilities)
        if remote_hostname
          Capybara::Selenium::Driver.new(app, browser: :remote, desired_capabilities: caps, options: chrome_options,
                                              url: "http://#{remote_hostname}:4444/wd/hub")
        else
          Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: caps, options: chrome_options)
        end
      end
      selected_browser = :chrome
    when "firefox"
      Capybara.register_driver :firefox do |app|
        caps = Selenium::WebDriver::Remote::Capabilities.firefox
        if remote_hostname
          Capybara::Selenium::Driver.new(app, browser: :remote, desired_capabilities: caps,
                                              url: "http://#{remote_hostname}:4444/wd/hub")
        else
          Capybara::Selenium::Driver.new(app, browser: :firefox, desired_capabilities: caps)
        end
      end
      selected_browser = :firefox
    end
    Capybara.default_driver = selected_browser
    @driver = Capybara.current_session.driver
    @driver
  end

  def try_to_maximize
    @driver.browser.manage.window.maximize
  rescue Selenium::WebDriver::Error::UnknownError => e
    if e.message =~ /failed to change window state to maximized, current state is minimized/
      logger.warn "Error when trying to maxime browser due to it is already maximized"
    end
  end
end
