FactoryBot.define do
  factory :user do
    name { 'John Dalia' }
    email { 'john@gmail.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
