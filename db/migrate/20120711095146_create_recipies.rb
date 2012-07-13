class CreateRecipies < ActiveRecord::Migration
  def change
    create_table :recipies do |t|
      t.integer :item_id, :null => false
      t.integer :ingredient_id, :null => false
      t.integer :number, :default => 1

      t.timestamps
    end
  end
end
