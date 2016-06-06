class AddMaterialIdToFilaments < ActiveRecord::Migration
  def change
    add_reference :filaments, :material, index: true, foreign_key: true
  end
end
