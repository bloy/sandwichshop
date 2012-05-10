class CreateToppingTypes < ActiveRecord::Migration
  def change
    create_table :topping_types do |t|
      t.string :name, :null => false
    end
  end
end
