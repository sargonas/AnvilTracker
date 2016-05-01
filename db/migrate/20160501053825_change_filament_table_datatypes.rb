class ChangeFilamentTableDatatypes < ActiveRecord::Migration
  def change
    change_column :filaments, :length, :decimal
    change_column :filaments, :weight, :decimal
    change_column :filaments, :cost, :decimal
    change_column :prints, :length, :decimal
    change_column :prints, :weight, :decimal
    change_column :prints, :price, :decimal
  end
end
