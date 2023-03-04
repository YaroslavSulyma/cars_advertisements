class BaseQuery
  include Pagy::Backend
  include Searchable
  include Filterable

  DEFAULT_DIRECTION = 'ASC'.freeze

  PaginatedCollection = Struct.new(:pagy, :records)

  def call
    raise NotImplementedError, I18n.t('errors.not_implemented', class: self.class, method: __method__)
  end

  private

  attr_reader :initial_scope

  def ordered(scope, attribute, direction = 'ASC')
    return scope unless attribute && direction

    scope.order(attribute.to_sym => direction.to_sym)
  end

  def paginate(scope, page, items)
    @pagy, @records = pagy(scope, page:, items:)
    PaginatedCollection.new(@pagy, @records)
  end
end
