# frozen_string_literal: true

module Base
  class LocationPage < Base::CommonPage
    element :use_my_location, "#use-my-location"
    element :confirm_location, "#user-address-map-confirm-button"
    element :confirm_address, "#confirm-address-modal-input-street"
    element :confimr_number, "#confirm-address-modal-input-number"
    element :confirm_no_complement, "#confirm-address-modal-checkbox-without-complement"
    element :confirm_neighborhood, "#confirm-address-modal-input-neighborhood"

    def select_address
      yml_path = Config.load_config(filename: "data")["users"]["address"]
      @address = yml_path[yml_path.keys]
    end

    def fill_location_data
      @user_adress = select_address
      wait_until_confirm_address_visible
      confirm_address.send_keys(user_adress["street"])
      wait_until_confimr_number_visible
      confimr_number.send_keys(user_adress["number"])
      wait_until_confirm_no_complement_visible
      confirm_no_complement.click
      wait_until_confirm_neighborhood_visible
      confirm_neighborhood.send_keys(user_adress["neighborhood"])
      @user_adress
    end

    def allow_location
      page.execute_script "navigator.geolocation.getCurrentPosition = function(success) { success({coords: {latitude: 50.455755, longitude: 30.511565}}); }"
    end
  end
end
