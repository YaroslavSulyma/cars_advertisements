class BaseQuery
  include Searchable
  include Filterable

  def call
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  private

  def ordered(scope, attribute, direction = 'ASC')
    return scope unless attribute && direction

    scope.order(attribute.to_sym => direction.to_sym)
  end
end
