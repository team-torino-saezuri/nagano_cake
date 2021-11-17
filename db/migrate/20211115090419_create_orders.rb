class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :shopping_cost, default: 800
      t.integer :total_payment
      t.string :name
      t.integer :payment_method, default: 0
      t.integer :status, default: 0
      t.string :address
      t.string :postal_code

      t.timestamps
    end
  end
end
