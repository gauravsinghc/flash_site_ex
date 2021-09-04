class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.decimal :sub_total
      t.decimal :tax
      t.decimal :discount
      t.decimal :grand_total
      t.text :internal_note
      t.datetime :date_new
      t.datetime :date_delivered
      t.datetime :date_fulfilled
      t.text :address

      t.timestamps
    end
  end
end
