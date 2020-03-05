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
    
    l = Hotel.joins(:location).select("locations.*,hotels.*").where("locations.city=?","Ahmedabad")


    @filter = Filter.find(params[:id])
    @hotel = Hotel.joins(:location).select("hotels.*,locations.*").where("locations.city=?",params[:city])
    @category = Room.joins(:hotel,:category).select("rooms.*,hotels.*,categories.*").where("categories.name=? AND categories.price<=? AND categories.price>=? AND rooms.hotel_id=?",params[:category],params[:max_price],params[:min_price],@hotel)

    byebug
  end

  private

  def filter_params
    params.require(:filter).permit(:city, :category, :min_price, :max_price)
  end
end
