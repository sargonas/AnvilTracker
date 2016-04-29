class Print < ActiveRecord::Base
    belongs_to :filament
    validates :name, presence: true
    validates :length, presence: true
    validates :weight, presence: true
    validates :price, presence: true
    validates :filament_id, presence: true
end
