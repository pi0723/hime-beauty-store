class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string  :name,        null: false
      t.integer :price,       null: false
      t.string  :title,       null: false
      t.text    :explanation, null: false
      t.string  :volume,      null: false
      t.text    :ingredient,  null: false
      t.integer :made_in_id,  null: false
      t.timestamps
    end
  end
end
