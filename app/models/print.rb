class Print < ActiveRecord::Base
    belongs_to :filament
    validates :name, presence: true
    validates :length, presence: true
    validates :weight, presence: true
    validates :price, presence: true
    validates :filament_id, presence: true
    
  #import class for CSV importing
  require 'csv'
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Print.create! row.to_hash
    end
  end
end
