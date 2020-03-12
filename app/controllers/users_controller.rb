# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @users = User.all
    @users = @users.paginate(per_page: 5, page: params[:page])
  end
end
