class SearchesController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    user_search_collection
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.find_or_initialize_by(create_params.to_h.symbolize_keys.compact_blank)
    @search.requests_quantity += 1 if Search.exists?(@search.id)
    @search.save!

    redirect_to cars_path(create_params)
  end

  private

  def create_params
    params.require(:search).permit(:make, :model, :year_from, :year_to, :price_from, :price_to)
      .with_defaults(user_id: current_user&.id)
  end

  def query_params
    params.permit(:page, :items)
  end

  def user_search_collection
    @user_search_collection ||= SearchQuery.new(user_searches).call(query_params)
  end

  def user_searches
    @user_searches ||= current_user.searches
  end
end
