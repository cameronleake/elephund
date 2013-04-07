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
    name "Example User Name"
    email "TestUser@example.com"
    subject "Some subject text"
    body "Example contact us message"
  end
  
end