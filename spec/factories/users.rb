FactoryBot.define do
  factory :user do
    name { 'Guest' }
    email { 'guest@example.org' }
    password { 'asdf1234' }
  end
end
