class CreateSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :spaces do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :address
      t.text :description
      t.string :category
      t.integer :price
      t.string :cover_image
      t.boolean :published

      t.timestamps
    end
  end
end
