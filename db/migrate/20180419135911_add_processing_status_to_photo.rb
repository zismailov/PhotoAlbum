class AddProcessingStatusToPhoto < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :processing_status, :string, default: 'new'
  end
end
