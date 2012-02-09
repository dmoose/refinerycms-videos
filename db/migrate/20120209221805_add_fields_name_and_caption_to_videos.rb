class AddFieldsNameAndCaptionToVideos < ActiveRecord::Migration
  def change
    add_column Refinery::RawVideo.table_name, :custom_name, :string
    add_column Refinery::RawVideo.table_name, :caption, :text
  end
end
