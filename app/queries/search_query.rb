class SearchQuery < BaseQuery
  def initialize(initial_scope = Search)
    @initial_scope = initial_scope
  end

  def call(params)
    page = params[:page] || Pagy::DEFAULT[:page]
    items = params[:items] || Pagy::DEFAULT[:items]

    paginate(@initial_scope, page, items)
  end
end
