class AddV2Craftings < ActiveRecord::Migration
  def change
    add_column :craftings, :icone, :string
     
  end
end
