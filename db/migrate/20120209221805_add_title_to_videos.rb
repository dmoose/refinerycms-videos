class AddTitleToVideos < ActiveRecord::Migration
  def change
    add_column Refinery::RawVideo.table_name, :title, :string
  end
end
