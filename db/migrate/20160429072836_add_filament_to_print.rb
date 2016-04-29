class AddFilamentToPrint < ActiveRecord::Migration
  def change
    add_reference :prints, :filament, index: true, foreign_key: true
  end
end
