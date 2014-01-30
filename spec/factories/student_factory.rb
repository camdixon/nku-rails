FactoryGirl.define do
  factory :student do
    sequence(:name) {|n| "Student Name #{n}"}
    password "password"
    password_confirmation "password"
  end
end
