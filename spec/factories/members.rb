FactoryGirl.define do
  factory :member do
    firstname "Joe"
    lastname "Bloggs"
    sequence(:email) { |n| "#{n}@example.com" }
  end
end
