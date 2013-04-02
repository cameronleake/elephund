FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "foo#{n}@example.com" }
    password "secret"
    first_name "Test"
    last_name "User"
    password_reset_token "123456"
  end
  
  factory :event do
    description "test"
    cost 10.00
  end
  
  factory :contact do
    name "Test User"
    email "Test@example.com"
    sequence(:subject) { |n| "Test Contact Us Form: ##{n}" }
    body "Test body"
  end
  
end