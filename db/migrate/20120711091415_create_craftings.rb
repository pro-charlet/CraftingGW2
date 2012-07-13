class CreateCraftings < ActiveRecord::Migration
  def change
    create_table :craftings do |t|
      t.string :name, :null => false

      t.timestamps
    end

    add_index :craftings, :name, :unique => true
  end
end
