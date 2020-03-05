# frozen_string_literal: true

class Hotel < ApplicationRecord
  # resourcify
  # include Authority::Abilities
  belongs_to :location
  has_many_attached :images
  has_many :rooms, dependent: :destroy

  def thumbnail(input)
    images[input].variant(resize: '600x300!').processed
  end
  
 
  belongs_to :location
  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end
  # ratyrate_rateable "name", class_name: 'User'
end
