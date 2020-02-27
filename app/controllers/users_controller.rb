# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @users = User.all
  end

  # def create
  #   if @user.save
  #     UserMailer.signup_confirmation(@user).deliver
  #     redirect_to @user, notice: "signed up successfully."

  # else
  #   render :new
  # end
  # end
end
