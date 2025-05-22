class VideosController < ApplicationController
  def index
    api_key = ENV['YOUTUBE_API_KEY']
    channel_id = ENV['YOUTUBE_CHANNEL_ID']

    youtube_service = YoutubeService.new(api_key)
    page_token = params[:page_token]
    response = youtube_service.videos(channel_id, 10, page_token)
    @videos = response.items
    @next_page_token = response.next_page_token
    @prev_page_token = response.prev_page_token
  rescue StandardError => e
    @error = "Error fetching videos: #{e.message}"
  end
end
