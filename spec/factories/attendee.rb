# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attendee do
    sequence(:person) { |n| "John Doe #{n}"}
    sequence(:project) { |n| "Project #{n}"}
    sequence(:use_help) { |n| "Help With #{n}"}
    sequence(:could_help) { |n| "Could Help #{n}"}

    factory :invalid_attendee do
      person ''
    end
  end

end
