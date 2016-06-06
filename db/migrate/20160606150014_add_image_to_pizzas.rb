class AddImageToPizzas < ActiveRecord::Migration
  def change
    add_column :pizzas, :image, :string
  end
end
