FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "user#{n}@example.com"
    end

    password 'changeme'
    password_confirmation 'changeme'
    admin 0
  end
end
