class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_users, only: [:show]

  def index
    @users = User.where(role: 'artist')
  end

  def show
  end

  def dashboard
    @videos = Video.where(category_id: current_user.category_ids)
    authorize @videos
  end

  def purchases
    @videos = current_user.videos
    authorize @videos
  end

  private

  def set_users
    @user = User.find(params[:id])
  end
end
