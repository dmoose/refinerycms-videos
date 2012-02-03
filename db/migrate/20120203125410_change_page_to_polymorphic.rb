class ChangePageToPolymorphic < ActiveRecord::Migration
  def change
    add_column Refinery::PageVideo.table_name, :page_type, :string, :default => "page"
  end
end
