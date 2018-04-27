class AddPositionToPhoto < ActiveRecord::Migration[5.1]
  def change
    unless column_exists?(:photos, :position)
      add_column :photos, :position, :integer
    end
  end
end
