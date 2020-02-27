a=params[:user][:role_ids]
if a=="1"
  @user.add_role :admin
elsif a=="2"
  @user.add_role :hotelowner
elsif a=="3"
  @user.add_role :customer
else
end
