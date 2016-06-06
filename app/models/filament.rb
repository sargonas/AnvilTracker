class Filament < ActiveRecord::Base
    has_many :prints, dependent: :nullify
    belongs_to :user
    belongs_to :material
    validates :name, presence: true
    validates :color, presence: true
    validates :material_id, presence: true
    validates :length, presence: true
    validates :weight, presence: true
    validates :cost, presence: true
    validates :diameter, presence: true
    validates :user_id, presence: true
  
  #import class for CSV importing
  require 'csv'
  def self.import(file, user_id)
    CSV.foreach(file.path, headers: true) do |row|
      Filament.create! row.to_hash.merge(user_id: user_id)
    end
  end
end