# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "John Doe #{n}" }
    sequence(:email) { |n| "johndoe#{n}@example.com" }
    sequence(:twitter)  { |n| "@johndoe#{n}" }
    password 'password'
  end
end
