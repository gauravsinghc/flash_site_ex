class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.references :order, null: false, foreign_key: true
      t.references :deal, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :price
      t.decimal :total_price

      t.timestamps
    end
  end
end
