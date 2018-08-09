class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|

    t.integer  :cart_items_id,  null: false, default: ""
    t.integer  :units,          null: false, default: 0
    t.integer  :cart_id,        null: false, default: ""
    t.integer  :item_id,        null: false, default: ""
    t.datetime :created_at,     null: false, default: "now"
    t.datetime :updated_at,     null: false, default: "now"

      t.timestamps
    end
  end
end
