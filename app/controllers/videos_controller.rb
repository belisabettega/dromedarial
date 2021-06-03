class VideosController < ApplicationController
  before_action :set_users, only: [:new]
  def new
    @video = Video.new
    authorize @video
  end

  def create
    @video = Video.new(video_params)
    @video.user_id = current_user.id
    @user = User.find(params[:video][:user_id])
    authorize @video
    if @video.save
      redirect_to root_path
    else
      redirect_to new_user_video_path(@user)
    end
  end

  def edit
    @video = Video.find(params[:id])
    authorize @video
  end

  def update
    @video = Video.find(params[:id])
    @video.status = "completed"
    authorize @video
    if @video.update(video_content_params)
      redirect_to dashboard_path
    else
      render 'edit'
    end
  end

  def change_status
    @video = Video.find(params[:id])
    @video.status = "denied"
    authorize @video
    @video.save
    redirect_to dashboard_path
  end

  def review
    @video = Video.find(params[:id])
    authorize @video
  end

  def set_review
    @video = Video.find(params[:id])
    authorize @video
    if @video.update(review_params)
      redirect_to purchases_path
    else
      render 'review'
    end
  end

  private

  def video_content_params
    params.require(:video).permit(:content)
  end

  def review_params
    params.require(:video).permit(:review, :rating)
  end

  def video_params
    params.require(:video).permit(:category_id)
  end

  def set_users
    @user = User.find(params[:user_id])
  end
end
