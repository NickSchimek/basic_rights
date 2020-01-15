FactoryBot.define do
  factory :user do
    name { 'Guest' }
    email { 'guest@example.org' }
    password { 'asdf1234' }

    trait :admin do
      after(:create) do |user|
        create(:membership, user: user, role: create(:admin_role))
      end
    end
  end
end
