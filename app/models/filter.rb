# frozen_string_literal: true

class Filter < ApplicationRecord
  def filter_hotels
    hotels = Hotel.all
    # locations = Location.all
    # categories = Category.all
    hotels = hotels.where(['city LIKE ?', "#{city}%"]) if city.present?
    hotels = hotels.where(['category LIKE ?', "#{category}%"]) if city.present?
    hotels = hotels.where(['price LIKE ?', min_price]) if min_price.present?
    hotels = hotels.where(['price LIKE ?', max_price]) if max_price.present?
    # return locations
    # return categories
    return hotels

  end
end
