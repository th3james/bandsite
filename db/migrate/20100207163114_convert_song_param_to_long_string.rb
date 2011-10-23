class ConvertSongParamToLongString < ActiveRecord::Migration
  def self.up
    change_column(:songs, :url, :text) 
  end

  def self.down
    change_column(:songs, :url, :string) 
  end
end
