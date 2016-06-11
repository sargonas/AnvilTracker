FactoryGirl.define do
  factory :print do
    name 'Print #1'
    length 900
    weight 75
    price 25.00
    filament
    volume 12
    user
  end
end
