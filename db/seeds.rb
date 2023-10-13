# db/seeds.rb

# Create sample users
user1 = User.create(name: "John Doe")
user2 = User.create(name: "Jane Smith")

Course.create(
  name: 'React18 Full Course',
  description: 'This is a React18 complete full course to take you from a noob to a pro',
  fee: 1200,
  startDate: "2024-04-04"
).image.attach(io: File.open('assets/images/react.png'), filename: 'react.png', content_type: 'image/png')

Course.create(
  name: 'HTML Beginner Course',
  description: 'This is A beginner Course in HTML and all you need to know to get started with the Web Structuring Language',
  fee: 1500,
  startDate: "2023-11-11"
).image.attach(io: File.open('assets/images/html.png'), filename: 'html.png', content_type: 'image/png')

Course.create(
  name: 'CSS Beginner Course',
  description: 'This is A cascading style sheet introduction course to HTML web page design and its different use cases',
  fee: 1500,
  startDate: "2024-05-07"
).image.attach(io: File.open('assets/images/css.png'), filename: 'css.png', content_type: 'image/png')

Course.create(
  name: 'Npm packages Introdcution',
  description: 'This is An introduction to package usage and maintanance in the world of software development. It includes how to get started with packages, best bundling techniqyes and much more',
  fee: 500,
  startDate: "2024-04-06"
).image.attach(io: File.open('assets/images/npm.png'), filename: 'npm.png', content_type: 'image/png')

Course.create(
  name: 'Webpack Starter Introduction',
  description: 'This is An introduction to the popular javascript bundling service webpack and in this introductory course we cover the latest indystry standard usage and benefits.',
  fee: 200,
  startDate: "2023-12-01"
).image.attach(io: File.open('assets/images/npm.png'), filename: 'npm.png', content_type: 'image/png')
