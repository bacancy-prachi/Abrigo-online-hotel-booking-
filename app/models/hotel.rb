# frozen_string_literal: true

class Hotel < ApplicationRecord
  # resourcify
  # include Authority::Abilities
  belongs_to :location
  has_many_attached :images

  def thumbnail(input)
    images[input].variant(resize: '310x320!').processed
  end
  
  has_many :rooms, dependent: :destroy
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
