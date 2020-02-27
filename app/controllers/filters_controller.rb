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
    @filter = Filter.find(params[:id])
  end

  private

  def filter_params
    params.require(:filter).permit(:city, :category, :min_price, :max_price)
  end
end
