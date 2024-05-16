class CreateOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items, id: :uuid do |t|
      t.references :order, null: false, foreign_key: true, type: :uuid
      t.references :product, null: false, foreign_key: true, type: :uuid
      t.integer :quantity, null: false, default: 1

      t.timestamps
    end
  end
end
