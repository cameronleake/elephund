FactoryGirl.define do

  factory :user do
    first_name "Test"
    last_name "User"
    sequence(:email) { |n| "foo#{n}@example.com" }
    password "secret"
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