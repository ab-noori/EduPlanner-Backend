# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Create sample users
user1 = User.create(name: "John Doe")
user2 = User.create(name: "Jane Smith")

# Create sample courses
course1 = Course.create(
  name: "Course 1",
  description: "Description for Course 1",
  image: "course1.jpg",
  fee: 100.0,
  startDate: Date.new(2023, 10, 10)
)
course2 = Course.create(
  name: "Course 2",
  description: "Description for Course 2",
  image: "course2.jpg",
  fee: 150.0,
  startDate: Date.new(2023, 11, 5)
)

# Create sample reservations associated with users and courses
Reservation.create(user_id: user1.id, course_id: course1.id, city: "New York", date: Date.new(2023, 10, 12))
Reservation.create(user_id: user2.id, course_id: course2.id, city: "Los Angeles", date: Date.new(2023, 11, 8))
