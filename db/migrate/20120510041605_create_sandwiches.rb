class CreateSandwiches < ActiveRecord::Migration
  def change
    create_table :sandwiches do |t|
      t.datetime :ordered_at, :null => false
      t.datetime :completed_at
      t.references :ordered_by, :null => false
      t.references :completed_by
      t.references :bread, :null => false
      t.references :sandwich_size, :null => false
    end
    add_index :sandwiches, :ordered_by_id
    add_index :sandwiches, :completed_by_id
    add_index :sandwiches, :bread_id
    add_index :sandwiches, :sandwich_size_id
    add_foreign_key :sandwiches, :users, :column => 'ordered_by_id'
    add_foreign_key :sandwiches, :users, :column => 'completed_by_id'
    add_foreign_key :sandwiches, :breads
    add_foreign_key :sandwiches, :sandwich_sizes

    create_table :sandwiches_toppings do |t|
      t.integer :sandwich_id, :null => false
      t.integer :topping_id, :null => false
    end

    add_foreign_key :sandwiches_toppings, :sandwiches
    add_foreign_key :sandwiches_toppings, :toppings
  end
end
