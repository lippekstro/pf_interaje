class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.boolean :border

      t.references :size, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
