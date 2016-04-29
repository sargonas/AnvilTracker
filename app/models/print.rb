class Print < ActiveRecord::Base
    has_one :filament
    validates :name, presence: true
    validates :length, presence: true
    validates :weight, presence: true
    validates :price, presence: true
    validates :filament_id, presence: true
end
