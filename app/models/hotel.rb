# frozen_string_literal: true

class Hotel < ApplicationRecord
  # resourcify
  # include Authority::Abilities
  belongs_to :location, class_name: 'User'
  has_many_attached :images

  def thumbnail input
    return self.images[input].variant(resize: '300x300!').processed
  end


  has_many :rooms
  belongs_to :location
  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end


end
