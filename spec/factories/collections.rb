FactoryGirl.define do
  factory :collection do
    sequence(:name) { |n| "Collection #{n}" }
    active true
  end
end
