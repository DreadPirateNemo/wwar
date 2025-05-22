require 'google/apis/youtube_v3'

class YoutubeService
  YOUTUBE_API_SERVICE_NAME = 'youtube'
  YOUTUBE_API_VERSION = 'v3'

  def initialize(api_key)
    @youtube = Google::Apis::YoutubeV3::YouTubeService.new
    @youtube.key = api_key
  end

  def videos(channel_id, max_results = 10, page_token = nil)
    @youtube.list_searches(
      'snippet',
      channel_id: channel_id,
      max_results: max_results,
      page_token: page_token,
      order: 'date',
      type: 'video'
    )
  end


end