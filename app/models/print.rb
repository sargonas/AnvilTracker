class Print < ActiveRecord::Base
    belongs_to :filament
    belongs_to :user
    attr_accessor :print_duration
    attr_accessor :print_long_duration
    before_save :calculate_duration_seconds
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
  def calculate_duration_seconds
     self.print_time = self.print_duration.to_s.split(":").map.with_index{|x,i| x.to_i.send(%w[hours minutes seconds][i])}.reduce(:+).to_i
  end
end