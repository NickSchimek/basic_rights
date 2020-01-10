FactoryBot.define do
  factory :role do
    name { 'member' }
  end

  factory :admin_role, class: Role do
    name { 'admin' }
  end
end
