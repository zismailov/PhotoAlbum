class AddPositionToPhoto < ActiveRecord::Migration[5.1]
  def change
    unless column_exists?(:photos, :position)
      add_column :photos, :position, :integer
    end

    unless column_exists?(:albums, :photos_order)
      add_column :albums, :photos_order, :text, default: nil
    end
  end
end
