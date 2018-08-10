class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|

    t.string  :email,               null: false, default: ""
    t.string  :encrypted_password,  null: false, default: ""
    t.datetime :created_at,         null: false, default: "now"
    t.datetime :updated_at,         null: false, default: "now"

      t.timestamps
    end
  end
end
