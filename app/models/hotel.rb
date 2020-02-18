class Hotel < ApplicationRecord
  resourcify
  include Authority::Abilities
  belongs_to :location, class_name: 'User'
  has_one_attached :image
  has_many :rooms
  belongs_to :location
  def self.search(search)
    if search
      where(["name LIKE ?","%#{search}%"])
    else 
      all
    end
  end

end
