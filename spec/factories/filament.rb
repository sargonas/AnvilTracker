FactoryGirl.define do
  factory :filament do
    name 'USER2 Atomic Black #2'
    material
    color 'black'
    length 90000
    weight 750
    cost 25.00
    diameter 1.75
    archived false
    user
  end
end
