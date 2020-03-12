# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :rooms, dependent: :destroy
  def room_price
    category.price.to_s
  end
end
