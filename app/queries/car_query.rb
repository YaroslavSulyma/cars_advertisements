class CarQuery < BaseQuery
  DEFAULT_ORDER_ATTRIBUTE = 'date_added'.freeze

  def initialize(initial_scope = Car.all)
    @initial_scope = initial_scope
  end

  def call(params)
    scoped = search(@initial_scope, params)
    scoped = filter_by_range(scoped, :year, { from: params[:year_from], to: params[:year_to] })
    scoped = filter_by_range(scoped, :price, { from: params[:price_from], to: params[:price_to] })
    ordered(scoped, order_attribute(params), params[:direction] || 'ASC')
  end

  private

  def order_attribute(params)
    params[:order_by] || DEFAULT_ORDER_ATTRIBUTE
  end
end
