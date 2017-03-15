# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Blog.destroy_all
Comment.destroy_all

10.times do
    User.create(name: Faker::Name.first_name , user_name: Faker::Internet.user_name, email: Faker::Internet.email, password_digest: Faker::Internet.password, admin: Faker::Boolean.boolean)
    Blog.create(title: Faker::Book.title, body: Faker::Lorem.paragraphs, author: Faker::Book.author, media: Faker::LoremPixel.image, user_id: Faker::Number.between(1, 10))
end

10.times do
 Comment.create(tag: Faker::Hacker.abbreviation, post: Faker::ChuckNorris.fact, user_id: Faker::Number.between(1, 10), blog_id: Faker::Number.between(1, 10))
end
