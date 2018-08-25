class AddDeletedAtToPurchases < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :deleted_at, :datetime, null: true
  end
end
