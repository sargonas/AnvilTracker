class Print < ActiveRecord::Base
    validates :name, presence: true
    validates :length, presence: true
    validates :weight, presence: true
    validates :price, presence: true
end
