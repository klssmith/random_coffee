FactoryGirl.define do
  factory :user do
    firstname "Joe"
    lastname "Bloggs"
    sequence(:email) { |n| "#{n}@example.com" }
  end
end
