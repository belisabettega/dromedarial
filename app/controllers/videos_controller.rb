class VideosController < ApplicationController

  def create
    @video = Video.new(video_params)
    @video.user_id = current_user

    if @video.save && @video.content.nil?
      redirect_to root_path
    else
      render 'users/video_request'
    end
  end

  private

  def video_params
    params.require(:video).permit(:category_id)
  end
end
