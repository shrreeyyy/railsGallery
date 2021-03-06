class AddUserIdToGaleries < ActiveRecord::Migration[6.1]
  def change
    add_column :galeries, :user_id, :integer
    add_index :galeries, :user_id
  end
end
