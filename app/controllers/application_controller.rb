class ApplicationController < ActionController::Base
  around_action :switch_locale

  private

  def default_url_options
    { locale: I18n.locale }
  end

  def switch_locale(&)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &)
  end
end
