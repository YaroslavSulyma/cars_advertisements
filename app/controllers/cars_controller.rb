class CarsController < ApplicationController
  def index
    @cars_collection = CarQuery.new.call(index_params)
  end

  private

  def index_params
    params.permit(:page, :items, :make, :model, :price_from, :price_to, :year_from, :year_to, :order_by, :direction)
  end
end
