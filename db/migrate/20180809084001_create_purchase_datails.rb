class CreatePurchaseDatails < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_datails do |t|
      t.integer :item_id,         null: false, default: ""
      t.integer :price,           null: false, default: ""
      t.integer :quantity,        null: false, default: ""
      t.integer :purchase_id,     null: false, default: ""
      t.datetime :purchase_date,  null: false, default: ""
      t.datetime :created_at,     null: false, default: "now"
      t.datetime :updated_at,     null: false, default: "now"

      t.timestamps
    end
  end
end
