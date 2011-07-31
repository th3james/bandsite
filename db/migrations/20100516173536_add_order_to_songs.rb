class AddOrderToSongs < ActiveRecord::Migration
  def self.up
    add_column :songs, :order, :integer
  end

  def self.down
    remove_column :songs, :order
  end
end
