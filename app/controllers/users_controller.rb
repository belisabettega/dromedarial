class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_users, only: [:show]

  def index
    if params[:query].present?
      @users = User.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @users = User.where(role: 'artist')
    end
  end

  def show
    @videos = Video.where(category_id: @user.category_ids)
  end

  def dashboard
    @user = current_user
    @videos = Video.where(category_id: current_user.category_ids)
    authorize @videos
    authorize @user
  end

  def purchases
    @user = current_user
    @videos = current_user.videos
    authorize @videos
    authorize @user
  end

  private

  def set_users
    @user = User.find(params[:id])
  end
end
