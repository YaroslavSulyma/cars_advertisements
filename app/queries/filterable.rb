module Filterable
  private

  def filter_by_range(scope, attribute, range_values)
    return scope unless attribute && RangeValidator.valid?(range_values)

    scope.where(attribute.to_sym => range(range_values))
  end

  def range(range_values)
    from = range_values[:from].present? ? range_values[:from].to_i : -Float::INFINITY
    to = range_values[:to].present? ? range_values[:to].to_i : Float::INFINITY
    (from..to)
  end
end
