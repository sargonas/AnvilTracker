FactoryGirl.define do
  factory :print do
    name 'Test Print 1'
    filament_id 1
    volume 123.99
    length 90000
    weight 750
    price 25.00
    user_id 1
  end
end
