class Filament < ActiveRecord::Base
    has_many :prints, dependent: :nullify
    validates :name, presence: true
    validates :material, presence: true
    validates :color, presence: true
    validates :length, presence: true
    validates :weight, presence: true
    validates :cost, presence: true
  
  #import class for CSV importing
  require 'csv'
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Filament.create! row.to_hash
    end
  end
end
