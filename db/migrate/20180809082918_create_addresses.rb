class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
    	t.integer :address_id
    	t.string :postal_code
    	t.text :address
    	t.string :address_name
    	t.integer :user_id
    	t.datetime :created_at
    	t.datetime :updated_at
      t.timestamps
    end
  end
end
