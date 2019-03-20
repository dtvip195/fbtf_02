# fake user
User.create!(name: "Tran Le Thanh Dat",
             email: "tranlethanhdat@gmail.com",
             phonenumber: 193456789,
             password: "123456",
             password_confirmation: "123456",
             role: 1)

20.times do |n|
  name = Faker::Name.name
  email = "tranlethanhdat#{n+1}@gmail.com"
  phonenumber = Faker::Number.number(10)
  User.create!(name: name,
               email: email,
               phonenumber: phonenumber,
               password: "123456",
               password_confirmation: "123456")
end

# create review
20.times do |n|
  content = Faker::Lorem.sentence(20)
  Review.create!(tour_id: 1,
                 user_id: n+1,
                 content: content)
end
20.times do |n|
  content = Faker::Lorem.sentence(20)
  Review.create!(tour_id: 2,
                 user_id: n+1,
                 content: content)
end

20.times do |n|
  content = Faker::Lorem.sentence(20)
  Review.create!(tour_id: 3,
                 user_id: n+1,
                 content: content)
end

# create category
Category.create!(name: "domestic")
Category.create!(name: "foreign")
# create location
Location.create!(name: "Đà Nẵng")
Location.create!(name: "Sài Gòn")
Location.create!(name: "Hà Nội")
Location.create!(name: "Hội An")
Location.create!(name: "Đà Lạt")
Location.create!(name: "Sapa")
Location.create!(name: "Lào Cai")
Location.create!(name: "Hạ Long")
Location.create!(name: "Huế")
4.times do |n|
  location = Faker::Nation.capital_city
  Location.create!(name: location)
end
# create travelling
Travelling.create!(location_start_id: 1,
                   location_end_id: 2)
Travelling.create!(location_start_id: 1,
                   location_end_id: 3)
Travelling.create!(location_start_id: 1,
                   location_end_id: 4)
Travelling.create!(location_start_id: 1,
                   location_end_id: 5)
Travelling.create!(location_start_id: 1,
                   location_end_id: 6)
Travelling.create!(location_start_id: 1,
                   location_end_id: 7)
Travelling.create!(location_start_id: 4,
                   location_end_id: 2)
Travelling.create!(location_start_id: 4,
                   location_end_id: 3)
Travelling.create!(location_start_id: 4,
                   location_end_id: 5)
Travelling.create!(location_start_id: 4,
                   location_end_id: 6)
Travelling.create!(location_start_id: 4,
                   location_end_id: 7)
Travelling.create!(location_start_id: 3,
                   location_end_id: 4)
Travelling.create!(location_start_id: 3,
                   location_end_id: 5)
Travelling.create!(location_start_id: 2,
                   location_end_id: 5)
Travelling.create!(location_start_id: 2,
                   location_end_id: 7)
Travelling.create!(location_start_id: 2,
                   location_end_id: 1)
Travelling.create!(location_start_id: 2,
                   location_end_id: 6)


# create tour
16.times do |n|
  price = Faker::Number.number(6)
  time_start = Faker::Time.between(DateTime.now + 2, DateTime.now + 7)
  time_end = Faker::Time.between(DateTime.now + 10, DateTime.now + 15)
  recent_quantity = Faker::Number.number(1)
  max_quantity = Faker::Number.number(2)
Tour.create!(category_id: 1,
             travelling_id: n+1,
             price: price,
             time_start: time_start,
             time_end: time_end,
             title: "Du Lịch Trong Nuoc",
             description: "Du Lịch Bụi",
             avatar: "avatar-5.jpg",
             recent_quantity: "9",
             average_rating: "4.3",
             max_quantity: max_quantity)
end
2.times do |n|
  price = Faker::Number.number(6)
  time_start = Faker::Time.between(DateTime.now + 2, DateTime.now + 7)
  time_end = Faker::Time.between(DateTime.now + 10, DateTime.now + 15)
  max_quantity = Faker::Number.number(2)
Tour.create!(category_id: 2,
             travelling_id: n+3,
             price: price,
             time_start: time_start,
             time_end: time_end,
             title: "Du Lich Trong Nước",
             description: "Du Lịch Nghỉ Dưỡng",
             avatar: "avatar-7.jpg",
             recent_quantity: "10",
             average_rating: "4.7",
             max_quantity: max_quantity)
end

10.times do |n|
  price = Faker::Number.number(6)
  time_start = Faker::Time.between(DateTime.now + 2, DateTime.now + 7)
  time_end = Faker::Time.between(DateTime.now + 10, DateTime.now + 15)
  max_quantity = Faker::Number.number(2)
Tour.create!(category_id: 1,
             travelling_id: 1,
             price: price,
             time_start: time_start,
             time_end: time_end,
             title: "Du Lich Trong Nước",
             description: "Du Lịch Bụi",
             avatar: "architecture-buildings-business.jpg",
             recent_quantity: "11",
             average_rating: "5",
             max_quantity: max_quantity)
end

10.times do |n|
  price = Faker::Number.number(6)
  time_start = Faker::Time.between(DateTime.now + 2, DateTime.now + 7)
  time_end = Faker::Time.between(DateTime.now + 10, DateTime.now + 15)
  max_quantity = Faker::Number.number(2)
Tour.create!(category_id: 1,
             travelling_id: 2,
             price: price,
             time_start: time_start,
             time_end: time_end,
             title: "Du Lich Trong Nước",
             description: "Du Lịch Nghỉ Dưỡng",
             avatar: "avatar-5.jpg",
             recent_quantity: "12",
             average_rating: "4.0",
             max_quantity: max_quantity)
end

10.times do |n|
  price = Faker::Number.number(6)
  time_start = Faker::Time.between(DateTime.now + 2, DateTime.now + 7)
  time_end = Faker::Time.between(DateTime.now + 10, DateTime.now + 15)
  max_quantity = Faker::Number.number(2)
Tour.create!(category_id: 1,
             travelling_id: 3,
             price: price,
             time_start: time_start,
             time_end: time_end,
             title: "Du Lich Trong Nước",
             description: "Du Lịch Bụi",
             avatar: "avatar-7.jpg",
             recent_quantity: "13",
             average_rating: "3.7",
             max_quantity: max_quantity)
end

10.times do |n|
  price = Faker::Number.number(6)
  time_start = Faker::Time.between(DateTime.now + 2, DateTime.now + 7)
  time_end = Faker::Time.between(DateTime.now + 10, DateTime.now + 15)
  max_quantity = Faker::Number.number(2)
Tour.create!(category_id: 1,
             travelling_id: 4,
             price: price,
             time_start: time_start,
             time_end: time_end,
             title: "Du Lich Trong Nước",
             description: "Du Lịch Nghỉ Dưỡng",
             avatar: "architecture-buildings-business.jpg",
             recent_quantity: "14",
             average_rating: "4.5",
             max_quantity: max_quantity)
end

10.times do |n|
  price = Faker::Number.number(6)
  time_start = Faker::Time.between(DateTime.now + 2, DateTime.now + 7)
  time_end = Faker::Time.between(DateTime.now + 10, DateTime.now + 15)
  max_quantity = Faker::Number.number(2)
Tour.create!(category_id: 1,
             travelling_id: 4,
             price: price,
             time_start: time_start,
             time_end: time_end,
             title: "Du Lịch Trong Nước",
             description: "Du Lịch Bụi",
             avatar: "avatar-7.jpg",
             recent_quantity: "15",
             average_rating: "4.5",
             max_quantity: max_quantity)
end

10.times do |n|
  price = Faker::Number.number(6)
  time_start = Faker::Time.between(DateTime.now + 2, DateTime.now + 7)
  time_end = Faker::Time.between(DateTime.now + 10, DateTime.now + 15)
  max_quantity = Faker::Number.number(2)
Tour.create!(category_id: 1,
             travelling_id: 4,
             price: price,
             time_start: time_start,
             time_end: time_end,
             title: "Du Lich Trong Nước",
             description: "Du Lịch Nghỉ Dưỡng",
             avatar: "architecture-buildings-business.jpg",
             recent_quantity: "15",
             average_rating: "4.5",
             max_quantity: max_quantity)
end

10.times do |n|
  price = Faker::Number.number(6)
  time_start = Faker::Time.between(DateTime.now + 2, DateTime.now + 7)
  time_end = Faker::Time.between(DateTime.now + 10, DateTime.now + 15)
  max_quantity = Faker::Number.number(2)
Tour.create!(category_id: 1,
             travelling_id: 10,
             price: price,
             time_start: time_start,
             time_end: time_end,
             title: "Du Lich Trong Nước",
             description: "Du Lịch Bụi",
             avatar: "avatar-5.jpg",
             recent_quantity: "15",
             average_rating: "4.5",
             max_quantity: max_quantity)
end
Booking.create!(user_id: 2,
                tour_id: 1,
                quantity: 1,
                status: 2,
                bill: Tour.first.price,
                name: "A",
                phonenumber: 121999999,
                address: "Da Nang",
                note: "1nguoi")
Booking.create!(user_id: 3,
                tour_id: 2,
                quantity: 1,
                status: 2,
                bill: Tour.second.price,
                name: "B",
                phonenumber: 121888888,
                address: "Ha Noi",
                note: "1nguoi")
Booking.create!(user_id: 3,
                tour_id: 3,
                quantity: 1,
                status: 2,
                bill: Tour.third.price,
                name: "B",
                phonenumber: 121888888,
                address: "Ha Noi",
                note: "1nguoi")
Booking.create!(user_id: 4,
                tour_id: 3,
                quantity: 1,
                status: 2,
                bill: Tour.third.price,
                name: "C",
                phonenumber: 999999999,
                address: "Sai Gon",
                note: "1nguoi")
Booking.create!(user_id: 5,
                tour_id: 4,
                quantity: 1,
                status: 2,
                bill: Tour.fourth.price,
                name: "D",
                phonenumber: 999888888,
                address: "Hue",
                note: "1nguoi")
