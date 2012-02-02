module Refinery
  class EncodeVideo
    @queue = Videos.encode_queue_name
    
    def self.perform(video_id, format, options = {})
      @raw_video = RawVideo.find(video_id)
      @raw_video.encode(format, options)
    end
  end
end
