class AddImageToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :image, :string
    remove_column :photos, :url
    remove_column :photos, :thumbnail_url
    rename_column :photos, :title, :notes
  end

  def self.down
    remove_column :photos, :image
    add_column :photos, :url, :string
    add_column :photos, :thumbnail_url, :string
    rename_column :photos, :notes, :title
  end
end
