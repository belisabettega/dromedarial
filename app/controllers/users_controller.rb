class UsersController < ApplicationController

  def index
    @users = User.where(role == 'artist')
  end
end
