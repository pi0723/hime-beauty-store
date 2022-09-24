class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.references :product, null: false, foreign_key: true
      t.references :cart,    null: false, foreign_key: true
      t.references :integer, null: false
      t.timestamps
    end
  end
end