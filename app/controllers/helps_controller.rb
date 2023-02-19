class HelpsController < ApplicationController
  # rubocop:disable Metrics/MethodLength, I18n/RailsI18n/DecorateString
  def index
    @menu_options = {
      'Help' => 'This page provides information about each menu option',
      'Car List' => 'On the car list page, you can see a list of all the cars in the database.
You can sort the list by various criteria, like: year, price, odometer, date_added',
      'Search' => 'The search page allows you to search for specific cars in the database.
You can filter the search results by make, model, year_from, year_to, price_from and price_to',
      'My searches' => 'On the my searches page, you can see a list of you search history.
This feature appears only for logged-in users',
      'Sign in' => 'Log in to your account to access additional features',
      'Sign up' => 'On this page you can create a new account to access additional features',
      'Sign out' => 'This button only appears for logged-in users.
To log out of your account and end your session, please do so'
    }
  end

  # rubocop:enable Metrics/MethodLength, I18n/RailsI18n/DecorateString
end
