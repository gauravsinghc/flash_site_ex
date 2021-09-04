class CreateDeals < ActiveRecord::Migration[6.1]
  def change
    create_table :deals do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 7, scale: 2
      t.decimal :discounted_price, precision: 7, scale: 2
      t.integer :quantity
      t.datetime :publish_date
      t.boolean :active

      t.timestamps
    end
  end
end
