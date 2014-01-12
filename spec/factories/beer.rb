require 'factory_girl'

FactoryGirl.define do
  factory :beer do
    name 'Bita-Beer'
    sequence(:obdb_id) 
    brand "No brand"
  end
end
