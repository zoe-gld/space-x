class AddYoutubeLinkToSpaces < ActiveRecord::Migration[5.2]
  def change
    add_column :spaces, :video_url, :string
  end
end
