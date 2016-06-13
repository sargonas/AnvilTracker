FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "user#{n}@example.com"
    end

    password 'changeme'
    password_confirmation 'changeme'
    admin false
    
    trait :admin do
      admin true
    end
  end
end
