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
   
    private

    def set_video
      @video = Video.find(params[:id])
    end
   
    def videos_params
      params.require(:video).permit(:content)
    end
end