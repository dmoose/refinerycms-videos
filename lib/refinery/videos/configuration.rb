module Refinery
  module Videos
    include ActiveSupport::Configurable

    config_accessor :captions
    config_accessor :default_poster_image

    self.captions = false
  end
end
