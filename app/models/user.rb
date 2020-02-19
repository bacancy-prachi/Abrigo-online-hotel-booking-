class User < ApplicationRecord

  rolify
  # include Authority::UserAbilities
  # has_many :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # after_create :assign_role
  # attr_accessor :ri


  # def assign_role(user)
  #   byebug
  #   p = params.require(:role_ids)
    
  #   # add_role()
  # end
end
