class SearchQuery < BaseQuery
  DEFAULT_ORDER_ATTRIBUTE = 'updated_at'.freeze

  def initialize(initial_scope = Search)
    @initial_scope = initial_scope
  end

  def call(params)
    page = params[:page] || Pagy::DEFAULT[:page]
    items = params[:items] || Pagy::DEFAULT[:items]

    scoped = ordered(initial_scope, DEFAULT_ORDER_ATTRIBUTE, DEFAULT_DIRECTION)
    paginate(scoped, page, items)
  end
end
