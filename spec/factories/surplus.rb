FactoryBot.define do
  factory :surplus, class: :surplu do
    resource { 'resource' }
    description { 'description' }
    quantity { 5 }
    active { true }
  end
end
