module ApplicationHelper
  include Pagy::Frontend

  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == params[:order_by] && params[:direction] == 'ASC' ? 'DESC' : 'ASC'
    link_to title, order_by: column, direction:
  end
end
