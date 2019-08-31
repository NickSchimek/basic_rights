FactoryBot.define do
  factory :need do
    resource { "Resource" }
    description { "Description" }
    quantity { 10 }
    active { true }
    organization
  end
end
