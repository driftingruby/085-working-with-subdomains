# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  company_name = Faker::Company.name
  blog = Blog.create(name: "#{company_name}'s Blog", subdomain: company_name)
  10.times do 
    blog.posts.create(
        title: Faker::Company.catch_phrase,
        content: Faker::Lorem.paragraphs(10, true).join("<br><br>")
      )
  end
end