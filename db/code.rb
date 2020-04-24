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

hotel.rb

#    before_validation :rooms_are_available

#    validate :last_date_greater_than_start_date_and_smaller_six_month
#    validates :room_booking_id,:room_id, :check_in, :check_out, presence: true


#     def last_date_greater_than_start_date_and_smaller_six_month 
#     if dates_is_blank?
#       return true
#     elsif Date.today > check_in.to_date
#       errors.add(:check_in, "check in date should be greater or equal to today's date")
#     # last_date should be smaller than 6 months
#     elsif Date.today + 6.months < check_out.to_date 
#       errors.add(:check_out, "Check out date should be smaller than 6 months")
#     # last_date should be greater than start_date
#     elsif check_out.to_date < check_in.to_date
#       errors.add(:check_out, "check out date should be greater than Check in Date")
#     end
#   end

# 	# get the all the room_id which room are booked in between start_date and last_date
#   def self.excluded_id(check_in,check_out)
#     # if array is empty return  true else return the array
#     if (b= Booking.where("Date(check_in) < ? AND Date(check_out) > ? ", check_out,check_in).collect(&:room_id)).empty?
#       return false
#     else
#       return b
#     end
#   end

#   def rooms_are_available
#     if dates_is_blank?
#       return true
#     # last_date should be smaller than 6 months
#   	elsif (rooms = Room.avail_rooms(check_in,check_out,Category.name).limit(1)).length > 0
#   		self.room_id = rooms.first.id
# 		else

# 			errors.add(:num_of_user, "Rooms are not available #{room_type}")
# 		end
#   end

#   def dates_is_blank?
#     if check_in.blank? || check_out.blank?
#       return true
#     end
#   end

#   def room_type_int
#     self.class.Category.name[self.Category.name]
#   end
# end


user show.html.erb


<p id="notice"><%= notice %></p>

<%# <p>
  <strong>Availibility:</strong>
  <%= @room.availibility %>
  <table class="table">
  	<thead class="bg-success">
  <th >User Emails</th>
    <th>User Status</th>
    </thead>
<% @users.each do |user| %>
<tr>
 <td> <%= user.email %></td>


 </tr>
 <% end %>
</table> 

<%# <% v = UsersRole.where(user_id=user.id).role_id%> 
<%# <user% w = Role.find(v).name%>



pagination
 


<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <% if current_user %>
<%= link_to 'book now!', user_index_path , class: "btn btn-outline-success my-2 my-sm-0" %>
<% else %>
<h3 class="text-danger">You need to login for booking.</h3>
<% end %>
      </li>
      <li class="nav-item col px-md-5">
      <% if current_user && current_user.admin %>
<%= link_to 'add room details!',hotel_rooms_path(@hotel) ,  class: "btn btn-outline-success my-2 my-sm-0" %>
<% end %>
      </li>
      <li class="nav-item col px-md-5">
       <% if current_user && current_user.admin %>
<%= link_to 'Edit', edit_hotel_path(@hotel), class: "btn btn-outline-success my-2 my-sm-0"  %> 
<% end %>
      </li>
      <li class="nav-item">
        <%= link_to 'Back', hotels_path ,  class: "btn btn-outline-success my-2 my-sm-0" %>
      </li>
    </ul>
  </div>
</nav>




 #  @room_category=[]

      #  rooms.each do |room|
      #   @room_category.push(Category.find_by(id: room.category_id))
      #  end