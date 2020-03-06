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
  
    @filter = Hotel.joins(:location, rooms: :category).where('locations.city = ? AND categories.name = ? AND categories.price >= ? AND categories.price <= ?',params[:filter][:city],params[:filter][:category],params[:filter][:min_price],params[:filter][:max_price]).uniq
    # @filter = Hotel.joins(:location, rooms: :category).where('locations.city = ? AND categories.name = ? AND categories.price >= ? AND categories.price <= ?',@f[:city],@f[:category],@f[:max_price],@f[:min_price]) 
    # l = Hotel.joins(:location).select("locations.*,hotels.*").where("locations.city=?","Ahmedabad")
    # @filter = Filter.find(params[:id])
    # @loc  = Location.find_by("city=?",@filter.city)
    # @hotel = Hotel.where("location_id=?",@loc.id)
    # @cat = Category.where("name=? AND price>=? AND price<=?",@filter.category,@filter.min_price,@filter.max_price)
    # @category = Hotel.joins(:room,:category).select("rooms.*,hotels.*,categories.*").where("categories.name=? AND categories.price<=? AND categories.price>=? AND hotels.id=?",@filter.category,@filter.max_price,@filter.min_price,@hotel.ids)
    # @A = Room.joins(:category).where(['category.name = ? AND categories.price >= ? AND categoris.price <= ?',@filter.category,@filter.min_price,@filter.max_price])
    # @room = Room.where("category_id=?",@cat.ids)
  end

  private

  def filter_params
    params.require(:filter).permit(:city, :category, :min_price, :max_price)
  end
end
