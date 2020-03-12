# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  resourcify
  # include Authority::UserAbilities
  has_many :bookings, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :assign_default_role

  def assign_default_role
    add_role(:customer) if roles.blank?
  end

  def destroy
    update_attributes(deactivated: true) unless deactivated
    end

  def active_for_authentication?
    super && !deactivated
      end
end
