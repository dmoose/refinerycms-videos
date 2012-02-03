namespace :refinery do
  namespace :testing do
    task :setup_extension do
      require 'refinerycms-videos'
      Refinery::VideosGenerator.start %w[--quiet]
    end
  end
end
