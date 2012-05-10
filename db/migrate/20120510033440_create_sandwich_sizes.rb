class CreateSandwichSizes < ActiveRecord::Migration
  def change
    create_table :sandwich_sizes do |t|
      t.string :name, :null => false
    end
  end
end
