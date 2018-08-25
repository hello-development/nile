class AddDeletedAtToPurchaseDatails < ActiveRecord::Migration[5.2]
  def change
    add_column :purchase_datails, :deleted_at, :datetime, null: true
  end
end
