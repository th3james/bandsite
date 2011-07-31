class RenameSongUrlToEmbed < ActiveRecord::Migration
  def up
    rename_column :songs, :url, :embed
  end

  def down
    rename_column :songs, :embed, :url
  end
end
