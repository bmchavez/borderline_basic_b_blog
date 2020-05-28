# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating Seed Posts...'
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