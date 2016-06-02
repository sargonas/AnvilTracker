class AddNotesToPrints < ActiveRecord::Migration
  def change
    add_column :prints, :notes, :text
  end
end