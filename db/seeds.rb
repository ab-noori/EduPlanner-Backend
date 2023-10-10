# db/seeds.rb

# Create sample users
user1 = User.create(name: "John Doe")
user2 = User.create(name: "Jane Smith")

# Create an array of image URLs
# image_urls = ['/course/database.png', '/course/web.png']

# Create sample courses
# courses = []
# 6.times do |i|
#   courses << Course.create(
#     name: "Course #{i + 1}",
#     description: "Description for Course #{i + 1}",
#     image: image_urls[i % 2], # Alternating between the two images
#     fee: 100.0 + (i * 10),     # Incrementing fee
#     startDate: Date.new(2023, 10, 10) + i.days  # Incrementing start date
#   )
# end
Course.create(name: 'course_1', description:'this is our first course', image: nil, fee: 1200, startDate: "2023-04-04")

course = Course.first

# Create sample reservations associated with users and courses
Reservation.create(user_id: user1.id, course_id: course.id, city: "New York", date: Date.new(2023, 10, 12))
Reservation.create(user_id: user2.id, course_id: course.id, city: "Los Angeles", date: Date.new(2023, 11, 8))
