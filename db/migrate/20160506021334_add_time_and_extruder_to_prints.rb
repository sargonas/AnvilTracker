class AddTimeAndExtruderToPrints < ActiveRecord::Migration
  def change
    add_column :prints, :extruder_id, :integer
    add_column :prints, :print_time, :integer
  end
end
