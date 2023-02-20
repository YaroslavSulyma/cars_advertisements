class HelpsController < ApplicationController
  def index
    @menu_options = {
      t('menu.help_option') => t('menu.help_description'),
      t('menu.cars_list_option') => t('menu.cars_list_description'),
      t('menu.search_option') => t('menu.search_description'),
      t('menu.user_searches_option') => t('menu.user_searches_description'),
      t('menu.sign_in_option') => t('menu.sign_in_description'),
      t('menu.sign_up_option') => t('menu.sign_up_description'),
      t('menu.sign_out_btn') => t('menu.sign_out_description')
    }
  end
end
