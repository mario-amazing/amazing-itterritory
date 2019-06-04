# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#
grade = rand(1..5)
user = User.create(login: Faker::Name.first_name)
post = Post.create(user_id: user.id, title: Faker::Book.title, description: Faker::Movie.quote)
UserIp.create(ip: Faker::Internet.ip_v4_address, post_id: post.id, user_id: user.id)
Rating.create(grade: grade, post_id: post.id)
PostStatistic.create(average_grade: grade, count: 1, post_id: post.id)
