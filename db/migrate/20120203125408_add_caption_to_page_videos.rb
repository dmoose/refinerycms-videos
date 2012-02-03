class AddCaptionToPageVideos < ActiveRecord::Migration
  def change
    add_column Refinery::PageVideo.table_name, :caption, :text
  end
end
