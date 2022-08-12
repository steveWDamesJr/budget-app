FactoryBot.define do
  factory :user do
    name { 'John Dalia' }
    email { 'john@gmail.com' }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { Time.now }
  end
end
