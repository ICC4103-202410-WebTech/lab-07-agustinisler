# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all
Post.destroy_all
Tag.destroy_all
require 'faker'

# Seed users
5.times do
    User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Internet.password(min_length: 6)
    )
  end
  
  # Seed tags
  5.times do
    Tag.create(
      name: Faker::Lorem.word
    )
  end
  
# Seed posts
# Seed posts
User.all.each do |user|
    post = Post.create(
      user_id: user.id,
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraph,
      answers_count: rand(0..10),
      likes_count: rand(0..20)
    )
    post.tags << Tag.all.sample
  end
  
  
  
  