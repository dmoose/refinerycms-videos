module Refinery
  class EncodeVideo
    
    def self.queue
      Videos.encode_queue_name
    end
    
    def self.perform(video_id, format, options = {})
      @raw_video = RawVideo.find(video_id)
      @raw_video.encode(format, options)
    end
  end
end
