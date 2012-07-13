class CreateCraftmen < ActiveRecord::Migration
  def change
    create_table :craftmen do |t|
      t.integer :member_id, :null => false
      t.integer :crafting_id, :null => false
      t.integer :level, :default => 0

      t.timestamps
    end
  end
end
