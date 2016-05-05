class AddVolumeToPrints < ActiveRecord::Migration
  def change
    add_column :prints, :volume, :decimal
  end
end
