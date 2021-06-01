class VideosController < ApplicationController
  def video_request
    @video = Video.new
  end
end
