class CreatePageVideos < ActiveRecord::Migration
  def change
    create_table Refinery::PageVideo.table_name do |t|
      t.integer :raw_video_id
      t.integer :page_id
      t.integer :position
      t.text    :caption
      t.string  :page_type, :default => 'page'
    end

    add_index Refinery::PageVideo.table_name, :raw_video_id
    add_index Refinery::PageVideo.table_name, :page_id
  end
end
