module ApplicationHelper
  include Pagy::Frontend

  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == params[:order_by] && params[:direction] == 'ASC' ? 'DESC' : 'ASC'
    link_to title, request.params.merge(order_by: column, direction:)
  end

  def locale_options
    I18n.available_locales.map { |locale| [I18n.t(locale), locale] }
  end

  def switch_locale_path(locale)
    url_for(controller: controller_name, action: action_name, locale:)
  end
end
