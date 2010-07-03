class AddThumnailUrlToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :thumbnail_url, :string 
  end

  def self.down
    remove_column :photos, :thumbnail_url
  end
end
