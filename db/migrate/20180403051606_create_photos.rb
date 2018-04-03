class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.integer :album_id
      t.string :picture

      t.timestamps
    end
  end
end
