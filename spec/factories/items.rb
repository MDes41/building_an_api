FactoryGirl.define do
  factory :item do
    sequence :name do |n|
      "My Name #{n.to_s}"
    end
    description "MyText"
  end
end
