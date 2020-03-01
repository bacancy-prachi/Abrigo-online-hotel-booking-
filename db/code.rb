# frozen_string_literal: true

a = params[:user][:role_ids]
if a == '1'
  @user.add_role :admin
elsif a == '2'
  @user.add_role :hotelowner
elsif a == '3'
  @user.add_role :customer
end

@hotel = Hotel.find(params[:hotel_id])
@rooms = Room.where(hotel_id: params[:hotel_id])
