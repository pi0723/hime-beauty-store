class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string  :last_name,          null: false
      t.string  :first_name,         null: false
      t.string  :post_code,          null: false
      t.string  :city,               null: false
      t.string  :address,            null: false
      t.string  :building
      t.string  :phone,              null: false
      t.integer :prefecture_id,      null: false
      t.timestamps
    end
  end
end
