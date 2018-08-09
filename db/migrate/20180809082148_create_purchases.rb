class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.datetime :purchased_date, null: false, default: ""
      t.integer :total_price,     null: false, default: ""
      t.integer :status,          null: false, default: 0, limit: 1
      t.string :delivery_address, null: false, default: ""
      t.integer :user_id,         null: false, default: ""
      t.datetime :created_at,     null: false, default: "now"
      t.datetime :updated_at,     null: false, default: "now"

      t.timestamps
    end
  end
end
