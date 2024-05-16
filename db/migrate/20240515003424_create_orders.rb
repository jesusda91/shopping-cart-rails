class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders, id: :uuid do |t|
      t.string :session_id, null: false
      t.timestamps
    end
  end
end
