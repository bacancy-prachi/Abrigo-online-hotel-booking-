class Hotel < ApplicationRecord
  belongs_to :location
  has_one_attached :image
  has_many :rooms
  
end
