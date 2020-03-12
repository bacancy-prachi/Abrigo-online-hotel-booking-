# frozen_string_literal: true

class FiltersController < ApplicationController
  def new
    @filter = Filter.new
    @cat_name = Category.distinct.pluck(:name)
    @city = Location.distinct.pluck(:city)
  end

  def create
    @filter = Filter.create(filter_params)
    redirect_to @filter
  end

  def show
    @f = params

    @filter = Hotel.joins(:location, rooms: :category).where('locations.city = ? AND 
    categories.name = ? AND categories.price >= ? AND categories.price <= ?', 
    params[:filter][:city], params[:filter][:category], params[:filter][:min_price],
    params[:filter][:max_price]).uniq
  
  end

  private

  def filter_params
    params.require(:filter).permit(:city, :category, :min_price, :max_price)
  end
end
