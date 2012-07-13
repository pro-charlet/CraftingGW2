class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.integer :member_id, :null => false
      t.integer :item_id, :null => false
      t.string  :statut, :null => false, :default => 'Recherche'

      t.timestamps
    end
  end
end
