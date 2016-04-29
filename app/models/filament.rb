class Filament < ActiveRecord::Base
    has_many :prints
    validates :name, presence: true
    validates :material, presence: true
    validates :color, presence: true
    validates :length, presence: true
    validates :weight, presence: true
    validates :cost, presence: true
end
