FactoryBot.define do
  factory :user do
    name { 'Guest' }
    phone { '503-555-5555' }
    email { 'guest@example.org' }
    password { 'asdf1234' }
  end
end
