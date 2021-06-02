class VideosController < ApplicationController
    before_action :set_video
    def edit
      @video = Video.find(params[:id])
    end
   
    def update
      @video = Video.find(params[:id])
      @video.status = "completed"
      if @video.update(videos_params)
        redirect_to dashboard_path
      else
        render 'edit'
      end
    end

    def change_status
      @video = Video.find(params[:id])
      @video.status = "denied"
      @video.save
      redirect_to dashboard_path
    end

    def review
      @video = Video.find(params[:id])
    end

    def set_review
      @video = Video.find(params[:id])
      if @video.update(review_params)
        redirect_to purchases_path
      else
        render 'review'
      end
    end
   
    private

    def videos_params
      params.require(:video).permit(:content)
    end

    def review_params
      params.require(:video).permit(:review, :rating)
    end
end