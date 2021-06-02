class VideosController < ApplicationController
  before_action :set_users, only: [:new]
  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @video.user_id = current_user.id
    @user = User.find(params[:video][:user_id])
    if @video.save!
      redirect_to root_path
    else
      redirect_to new_user_video_path(@user)
    end
  end

  private

  def video_params
    params.require(:video).permit(:category_id)
  end

  def set_users
    @user = User.find(params[:user_id])
  end
end
