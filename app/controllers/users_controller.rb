class UsersController < ApplicationController
  before_action :set_users, only:[:show, :video_request]

  def index
    @users = User.where(role: 'artist')
  end

  def show
  end

  def video_request
    @video = Video.new
  end

  private

  def set_users
    @user = User.find(params[:id])
  end
end
