require 'faker'

FactoryGirl.define do
  factory :number do
    value { Faker::Lorem.characters(4) }
    
    factory :invalid_number do
      value { Faker::Lorem.characters(5) }
    end
  end
end