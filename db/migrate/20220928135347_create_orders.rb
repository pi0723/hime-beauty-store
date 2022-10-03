class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :destination, null: false, foreign_key: true
      t.references :user,        null: false, foreign_key: true
      t.datetime   :sold_at,     null: false
      t.string     :charge_id,   null: false
      t.string     :order_code,  null: false
      t.timestamps
      t.index [ :order_code ], unique: true
    end
  end
end
