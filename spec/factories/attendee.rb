# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attendee do
    sequence(:person) { |n| "John Doe #{n}"}
    sequence(:project) { |n| "Project #{n}"}
    collaborate false
    coach false

    factory :invalid_attendee do
      person ''
    end
  end

end
