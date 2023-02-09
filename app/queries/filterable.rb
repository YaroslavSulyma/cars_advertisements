module Filterable
  private

  def filter_by_range(scope, attribute, range_values)
    return scope unless attribute && RangeValidator.valid?(range_values)

    scope.where(attribute.to_sym => range(range_values))
  end

  def range(range_values)
    from = range_values[:from].empty? ? -Float::INFINITY : range_values[:from].to_i
    to = range_values[:to].empty? ? Float::INFINITY : range_values[:to].to_i
    (from..to)
  end
end
