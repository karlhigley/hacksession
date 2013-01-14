FactoryGirl.define do
  factory :announcement do
    sequence(:content) { |n| "This is the content for announcement ##{n}."}

    factory :invalid_announcement do
      content ''
    end
  end

end