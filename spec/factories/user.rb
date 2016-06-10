FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "user#{n}@example.com"
    end

    password 'changeme'
    password_confirmation 'changeme'
    
    trait :not_admin do
      admin false
    end
    
    trait :admin do
      admin true
    end
  end
end
