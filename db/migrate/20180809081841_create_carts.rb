class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|

    t.integer  :user_id,  null: false, default: ""
    t.datetime :created_at, null: false, default: "now"
    t.datetime :updated_at, null: false, default: "now"

      t.timestamps
    end
  end
end
