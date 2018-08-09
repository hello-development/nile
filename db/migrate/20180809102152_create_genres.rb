class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|

      t.timestamps
      t.string :genre_name
    end
  end
end
