require 'refinerycms-core'
require 'dragonfly-ffmpeg'

module Refinery
  module Videos
    require 'refinery/videos/engine' if defined?(Rails)
    require 'refinery/generators/videos_generator'
    
    autoload :Version, 'refinery/videos/version'
    
    DEFAULT_USE_NGINX_UPLOAD_MODULE = false
    DEFAULT_UPLOAD_PROGRESS_URI = nil

    mattr_accessor :use_nginx_upload_module
    self.use_nginx_upload_module = DEFAULT_USE_NGINX_UPLOAD_MODULE
    
    mattr_accessor :upload_progress_uri
    self.upload_progress_uri = DEFAULT_UPLOAD_PROGRESS_URI
    
    class << self
      # Configure the options of Refinery::Images.
      #
      #   Refinery::Videos.configure do |config|
      #     config.use_nginx_module = true
      #   end
      #
      def configure(&block)
        yield Refinery::Videos
      end

      # Reset Refinery::Videos options to their default values
      #
      def reset!
        self.use_nginx_upload_module = DEFAULT_USE_NGINX_UPLOAD_MODULE
        self.upload_progress_uri = DEFAULT_UPLOAD_PROGRESS_URI
      end
      
      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def version
        Version.to_s
      end
      
      def factory_paths
        @factory_paths ||= [ root.join("spec/factories").to_s ]
      end
    end
  end
end
