class AddV2Members < ActiveRecord::Migration
  def change
    add_column :members, :phpbb_id, :string
     
  end
end
