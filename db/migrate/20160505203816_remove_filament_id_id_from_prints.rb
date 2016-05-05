class RemoveFilamentIdIdFromPrints < ActiveRecord::Migration
  def change
    remove_column :prints, :filament_id_id, :integer
  end
end
