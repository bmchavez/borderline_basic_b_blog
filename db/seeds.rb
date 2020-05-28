# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating Seed Posts...'

# USER SEEDS
User.create!({
  first_name: 'Bri',
  last_name: 'Webb',
  email: 'briannawebb@email.com',
  password: '123456'
})
User.create!({
  first_name: 'Ben',
  last_name: 'Chavez',
  email: 'ben.m.chavez@gmail.com',
  password: '123456',
  admin: true
})

# POST SEEDS
Post.create!({
  title: "001.",
  body: "This is the first blog post",
  user_id: 2
})
Post.create!({
  title: "002.",
  body: "This is the SECOND blog post",
  user_id: 2
})

puts 'Finished!'