require 'factory_girl'

FactoryGirl.define do
  factory :beer do
    name 'Bita beer'
    sequence(:obdb_id) 
    brand "bita brand"
  end
end
