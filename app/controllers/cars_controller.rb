class CarsController < ApplicationController
  def index
    cars_collection
  end

  private

  def cars_collection
    @cars_collection ||= CarQuery.new.call(query_params)
  end

  def query_params
    params.permit(:page, :items, :make, :model, :price_from, :price_to, :year_from, :year_to, :order_by, :direction)
  end
end
