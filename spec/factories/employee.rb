# frozen_string_literal: true

FactoryGirl.define do
  factory :employee, class: Employee do
    company
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    age        { (18..70).to_a.sample }
    email      { Faker::Internet.email("#{first_name}.#{last_name}") }
  end
end
