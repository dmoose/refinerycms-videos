module Refinery
  class VideosGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    
    def generate_videos_initializer
      template "config/initializers/refinery_videos.rb.erb", File.join(destination_root, "config", "initializers", "refinery_videos.rb")
    end
    
    def generate_resque_config
      template 'config/resque.yml', File.join(destination_root, 'config/resque.yml')
    end
    
    def append_load_seed_data
      create_file "db/seeds.rb" unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
      append_file 'db/seeds.rb', :verbose => true do
        <<-EOH

# Added by RefineryCMS Videos engine
Refinery::Videos::Engine.load_seed
        EOH
      end
    end
  end
end
