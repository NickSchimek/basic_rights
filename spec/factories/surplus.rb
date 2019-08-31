FactoryBot.define do
  factory :surplus do
    resource { 'resource' }
    description { 'description' }
    quantity { 5 }
    active { true }
    organization
  end
end
