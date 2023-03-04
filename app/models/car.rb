class Car < ApplicationRecord
  MIN_YEAR = 1884

  validates :make, :model, presence: true, length: { maximum: 70 }
  validates :description, presence: true, length: { maximum: 400 }
  validates :year, presence: true, inclusion: { in: MIN_YEAR..Date.current.year }, numericality: true
  validates :odometer, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :price, presence: true, numericality: { greater_than: 0 }
end
