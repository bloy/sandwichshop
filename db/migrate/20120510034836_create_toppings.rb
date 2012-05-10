class CreateToppings < ActiveRecord::Migration
  def change
    create_table :toppings do |t|
      t.string :name, :null => false
      t.references :topping_type, :null => false
    end
  end

  add_foreign_key :toppings, :topping_types
end
