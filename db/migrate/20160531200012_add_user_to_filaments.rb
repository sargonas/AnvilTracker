class AddUserToFilaments < ActiveRecord::Migration
  def change
    add_column :filaments, :user_id, :integer
  end
end
