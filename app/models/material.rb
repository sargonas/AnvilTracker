class Material < ActiveRecord::Base
  belongs_to :user
  has_many :filaments, dependent: :nullify
  
  validates :name, presence: true
end
