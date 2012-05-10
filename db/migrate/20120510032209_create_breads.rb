class CreateBreads < ActiveRecord::Migration
  def change
    create_table :breads do |t|
      t.string :name, :null => false
      t.string :description, :null => false
    end
  end
end
