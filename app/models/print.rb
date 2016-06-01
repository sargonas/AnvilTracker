class Print < ActiveRecord::Base
    belongs_to :filament
    belongs_to :user
    validates :name, presence: true
    validates :length, presence: true
    validates :weight, presence: true
    validates :price, presence: true
    validates :filament_id, presence: true
    validates :volume, presence: true
    validates :user_id, presence: true
  #import class for CSV importing
  require 'csv'
  def self.import(file, user_id)
    CSV.foreach(file.path, headers: true) do |row|
      Print.create! row.to_hash.merge(user_id: user_id)
    end
  end
end
