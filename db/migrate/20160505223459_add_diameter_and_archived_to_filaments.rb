class AddDiameterAndArchivedToFilaments < ActiveRecord::Migration
  def change
    add_column :filaments, :diameter, :decimal
    add_column :filaments, :archived, :boolean, default: false
  end
end