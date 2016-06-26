FactoryGirl.define do
  factory :match do
    association :member1, factory: :member
    association :member2, factory: :member
  end
end
