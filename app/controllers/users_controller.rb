class UsersController < ApplicationController
  before_action :set_users, only:[:show]

  def index
    @users = User.where(role: 'artist')
  end

  def show
  end

  def dashboard
  end

  private

  def set_users
    @user = User.find(params[:id])
  end
end
