module Searchable
  private

  def search(scope, query)
    return scope if query.blank?

    scoped = search_by_parameter(scope, :make, query)
    search_by_parameter(scoped, :model, query)
  end

  def search_by_parameter(scope, parameter, query)
    return scope if query[parameter].blank?

    query_value = "%#{query[parameter]}%"
    scope.where(scope.arel_table[parameter].matches(query_value))
  end
end
