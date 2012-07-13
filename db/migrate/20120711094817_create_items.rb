class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :name, :null => false
      t.integer :crafting_id
      t.integer :niveau, :default => 0
      
      t.boolean :gathering, :default => false
      t.boolean :looting, :default => false
      t.boolean :purchasing, :default => false
      t.boolean :salvaging, :default => false
      
      t.integer :priority_id, :default => 1

      t.timestamps
    end
    
    add_index :items, :name, :unique => true
  end
end
