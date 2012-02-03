class TranslatePageVideoCaptions < ActiveRecord::Migration
  def up
    add_column Refinery::PageVideo.table_name, :id, :primary_key

    Refinery::PageVideo.reset_column_information
    unless defined?(Refinery::PageVideo::Translation) && Refinery::PageVideo::Translation.table_exists?
      Refinery::PageVideo.create_translation_table!({
        :caption => :text
      }, {
        :migrate_data => true
      })
    end
  end

  def down
    Refinery::PageVideo.reset_column_information

    Refinery::PageVideo.drop_translation_table! :migrate_data => true

    remove_column Refinery::PageVideo.table_name, :id
  end
end
