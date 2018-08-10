class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|

      t.timestamps
      t.string :label_name
      t.index :label_name
    end
  end
end
