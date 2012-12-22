# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sitting do
    sequence(:person) { |n| "John Doe #{n}"}
    sequence(:project) { |n| "Project #{n}"}
    collaborate false
    coach false

    factory :invalid_sitting do
      person ''
    end
  end

end
