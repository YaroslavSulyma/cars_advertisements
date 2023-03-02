class CarQuery < BaseQuery
  DEFAULT_ORDER_ATTRIBUTE = 'date_added'.freeze

  def initialize(initial_scope = Car)
    @initial_scope = initial_scope
  end

  def call(params)
    page = params[:page] || Pagy::DEFAULT[:page]
    items = params[:items] || Pagy::DEFAULT[:items]

    scoped = search(initial_scope, params)
    scoped = apply_filters(scoped, params)
    scoped = ordered(scoped, order_attribute(params), params[:direction] || DEFAULT_DIRECTION)
    paginate(scoped, page, items)
  end

  private

  def apply_filters(scoped, params)
    scoped = filter_by_range(scoped, :year, { from: params[:year_from], to: params[:year_to] })
    filter_by_range(scoped, :price, { from: params[:price_from], to: params[:price_to] })
  end

  def order_attribute(params)
    params[:order_by] || DEFAULT_ORDER_ATTRIBUTE
  end
end
