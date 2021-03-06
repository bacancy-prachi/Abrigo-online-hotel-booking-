# frozen_string_literal: true

class ChartsController < ApplicationController
  def new_user
    render json: User.group_by_day(:created_at).count
  end

  def show_category
    render json: Category.group(:name).sum(:price)
  end

  def show_hotel
    render json: Room.joins(:hotel).group('hotels.name').count
  end
end
