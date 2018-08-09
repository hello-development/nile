class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :item_id,         null: false, default: ""
      t.integer :user_id,         null: false, default: ""
      t.datetime :created_at,     null: false, default: "now"
      t.datetime :updated_at,     null: false, default: "now"

      t.timestamps
    end
  end
end
