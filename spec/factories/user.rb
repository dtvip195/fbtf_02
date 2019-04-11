FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    phonenumber {"1234567899"}
    password {"123456"}
    password_confirmation {"123456"}
  end
end

FactoryBot.define do
  factory :admin, class: User do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    phonenumber {"1234567899"}
    password {"123456"}
    password_confirmation {"123456"}
    role {1}
    confirmed_at {Date.current}
    updated_at {Date.current}
  end
end
