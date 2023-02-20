class RangeValidator
  def self.valid?(range_values)
    new(range_values).valid?
  end

  def initialize(range_values)
    @range_values = range_values
  end

  def valid?
    from_or_to_valid_number? && from_less_then_or_eq_to?
  end

  private

  attr_reader :range_values

  def from_less_then_or_eq_to?
    from = value_is_valid_number?(range_values[:from]) ? range_values[:from].to_i : -Float::INFINITY
    to = value_is_valid_number?(range_values[:to]) ? range_values[:to].to_i : Float::INFINITY
    from <= to ? true : abort(t('errors.invalid_range'))
  end

  def from_or_to_valid_number?
    value_is_valid_number?(range_values[:from]) || value_is_valid_number?(range_values[:to])
  end

  def value_is_valid_number?(value)
    value.to_i.to_s == value
  end
end
