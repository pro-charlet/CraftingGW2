class AddV2Wishes < ActiveRecord::Migration
  def change
    add_column :wishes, :number, :integer, :default => 1, :null => false
     
  end
end
