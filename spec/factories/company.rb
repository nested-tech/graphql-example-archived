# frozen_string_literal: true

FactoryGirl.define do
  factory :company, class: Company do
    name         { Faker::Company.unique.name }
    catch_phrase { Faker::Company.catch_phrase }
  end
end
