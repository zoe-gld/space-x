class ChangeUserColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :spaces, :user_id, :owner_id
  end
end
