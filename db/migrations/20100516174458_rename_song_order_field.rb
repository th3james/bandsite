class RenameSongOrderField < ActiveRecord::Migration
  def self.up
    rename_column :songs, :order, :order_int
  end

  def self.down
    rename_column :songs, :order_int, :order
  end
end
