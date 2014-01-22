FactoryGirl.define do
  factory :student do
    sequence(:name) {|n| "Student Name #{n}"}
  end
end
