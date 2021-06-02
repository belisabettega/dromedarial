class VideosController < ApplicationController
    before_action :set_video
    def edit
    end
   
    def update
      @video.status = "completed"
      if @video.update(videos_params)
        redirect_to dashboard_path
      else
        render 'edit'
      end
    end

    def change_status
      @video.status = "denied"
      @video.save
      redirect_to dashboard_path
    end

    def review
    end

    def set_review
      if @video.update(review_params)
        redirect_to purchases_path
      else
        render 'review'
      end
    end
   
    private

    def set_video
      @video = Video.find(params[:id])
    end
   
    def videos_params
      params.require(:video).permit(:content)
    end

    def review_params
      params.require(:video).permit(:review, :rating)
    end
end