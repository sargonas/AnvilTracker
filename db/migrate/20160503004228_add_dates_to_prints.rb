class AddDatesToPrints < ActiveRecord::Migration
  def change
    add_column :prints, :printed_date, :date
  end
end
