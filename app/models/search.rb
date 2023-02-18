class Search < ApplicationRecord
  belongs_to :user, optional: true

  validates :requests_quantity, presence: true, numericality: { greater_than_or_equal_to: 1, default: 1 }
end
