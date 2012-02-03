module Refinery
  module Videos
    include ActiveSupport::Configurable

    config_accessor :captions

    self.captions = false
  end
end
