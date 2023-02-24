class BaseQuery
  include Pagy::Backend
  include Searchable
  include Filterable

  PaginatedCollection = Struct.new(:pagy, :records)

  def call
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  private

  def ordered(scope, attribute, direction = 'ASC')
    return scope unless attribute && direction

    scope.order(attribute.to_sym => direction.to_sym)
  end

  def paginate(scope, page, items)
    @pagy, @records = pagy(scope, page:, items:)
    PaginatedCollection.new(@pagy, @records)
  end
end
