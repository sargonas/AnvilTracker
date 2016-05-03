class AddNullifyToPrints < ActiveRecord::Migration
  def change
    add_reference :prints, :filament_id, :dependent => :nullify
  end
end
