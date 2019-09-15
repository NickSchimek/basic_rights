FactoryBot.define do
  factory :claim do
    quantity { 2 }
    picked_up { false }
    active { true }
    association :surplu, factory: :surplus
    organization
  end
end
