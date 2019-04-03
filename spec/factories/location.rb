FactoryBot.define do
  factory :location do
    name {Faker::Nation.capital_city}
  end

  factory :invalid_locations, parent: :location do
    name {nil}
  end
end

FactoryBot.define do
  factory :invalid_location, class: Location do
    name {"Đà Nẵng"}
  end
end
