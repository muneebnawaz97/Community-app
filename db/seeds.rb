# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

User.create!(name: 'Calvin Corelli', email: 'calvin@simplero.com', password: 'simplero')
User.create!(name: 'Owais', email: 'owais@simplero.com', password: 'simplero')
User.create!(name: 'Muneeb Nawaz', email: 'admin@example.com', password: 'password')
User.create!(name: 'test1', email: 'test1@example.com', password: 'password')
User.create!(name: 'test2', email: 'test2@example.com', password: 'password')
User.create!(name: 'test3', email: 'test3@example.com', password: 'password')
User.create!(name: 'test4', email: 'test4@example.com', password: 'password')
User.create!(name: 'test5', email: 'test5@example.com', password: 'password')
User.create!(name: 'test6', email: 'test6@example.com', password: 'password')
User.create!(name: 'test7', email: 'test7@example.com', password: 'password')

user1=User.find(1)
user2=User.find(2)
user3=User.find(3)
user4=User.find(4)
user5=User.find(5)
user6=User.find(6)
user7=User.find(7)
user8=User.find(8)
user9=User.find(9)
user10=User.find(10)

user1.avatar.attach(io: File.open(Rails.root.join('app/assets/images/9.webp').to_s),
                    filename: '9.jpg',
                    content_type: 'image/jpeg')
user1.save!

user2.avatar.attach(io: File.open(Rails.root.join('app/assets/images/10.jpeg').to_s),
filename: '9.jpg',
content_type: 'image/jpeg')
user2.save!

user3.avatar.attach(io: File.open(Rails.root.join('app/assets/images/11.jpeg').to_s),
filename: '9.jpg',
content_type: 'image/jpeg')
user3.save!

user4.avatar.attach(io: File.open(Rails.root.join('app/assets/images/1.jpeg').to_s),
filename: '9.jpg',
content_type: 'image/jpeg')
user4.save!

user5.avatar.attach(io: File.open(Rails.root.join('app/assets/images/2.jpeg').to_s),
filename: '9.jpg',
content_type: 'image/jpeg')
user5.save!

user6.avatar.attach(io: File.open(Rails.root.join('app/assets/images/3.jpeg').to_s),
filename: '9.jpg',
content_type: 'image/jpeg')
user6.save!

user7.avatar.attach(io: File.open(Rails.root.join('app/assets/images/4.jpeg').to_s),
filename: '9.jpg',
content_type: 'image/jpeg')
user7.save!

user8.avatar.attach(io: File.open(Rails.root.join('app/assets/images/5.jpeg').to_s),
filename: '9.jpg',
content_type: 'image/jpeg')
user8.save!

user9.avatar.attach(io: File.open(Rails.root.join('app/assets/images/6.jpeg').to_s),
filename: '9.jpg',
content_type: 'image/jpeg')
user9.save!

user10.avatar.attach(io: File.open(Rails.root.join('app/assets/images/7.jpeg').to_s),
filename: '9.jpg',
content_type: 'image/jpeg')
user10.save!

Group.create!(title: "Calvin is admin here", user_id: 1)
Group.create!(title: "Owais is admin here", user_id: 2)
Group.create!(title: "Muneeb is admin here", user_id: 3)
Group.create!(title: "test is admin here", user_id: 4)

GroupMembership.create!(user_id: 1, group_id: 1, role: :admin)
GroupMembership.create!(user_id: 2, group_id: 2, role: :admin)
GroupMembership.create!(user_id: 3, group_id: 3, role: :admin)
GroupMembership.create!(user_id: 4, group_id: 4, role: :admin)
GroupMembership.create!(user_id: 5, group_id: 1, role: :member)
GroupMembership.create!(user_id: 6, group_id: 1, role: :member)
GroupMembership.create!(user_id: 7, group_id: 1, role: :member)
GroupMembership.create!(user_id: 8, group_id: 1, role: :member)
GroupMembership.create!(user_id: 9, group_id: 1, role: :member)
GroupMembership.create!(user_id: 10, group_id: 1, role: :member)
GroupMembership.create!(user_id:  1, group_id: 2, role: :member)
GroupMembership.create!(user_id: 3, group_id: 2, role: :member)
GroupMembership.create!(user_id: 4, group_id: 2, role: :member)
GroupMembership.create!(user_id: 5, group_id: 2, role: :member)
GroupMembership.create!(user_id: 6, group_id: 2, role: :member)
GroupMembership.create!(user_id: 7, group_id: 3, role: :member)
GroupMembership.create!(user_id: 8, group_id: 3, role: :member)
GroupMembership.create!(user_id: 9, group_id: 3, role: :member)
GroupMembership.create!(user_id: 10, group_id: 3, role: :member)
GroupMembership.create!(user_id: 1, group_id: 3, role: :member)
GroupMembership.create!(user_id: 2, group_id: 3, role: :member)
GroupMembership.create!(user_id: 4, group_id: 3, role: :member)
GroupMembership.create!(user_id: 5, group_id: 3, role: :member)
GroupMembership.create!(user_id: 6, group_id: 3, role: :member)
GroupMembership.create!(user_id: 7, group_id: 4, role: :member)
GroupMembership.create!(user_id: 8, group_id: 4, role: :member)

Post.create!(content: Faker::Lorem.sentences(number: 6), title: Faker::Lorem.sentence(word_count: 7), user_id: 1, group_id: 1)
Post.create!(content:Faker::Lorem.sentences(number: 3), title: Faker::Lorem.sentence(word_count: 4), user_id: 2, group_id: 1)
Post.create!(content:Faker::Lorem.sentences(number: 15), title: Faker::Lorem.sentence(word_count: 4), user_id: 3, group_id: 1)
Post.create!(content: Faker::Lorem.sentences(number: 6), title: Faker::Lorem.sentence(word_count: 7), user_id: 1, group_id: 2)
Post.create!(content:Faker::Lorem.sentences(number: 3), title: Faker::Lorem.sentence(word_count: 4), user_id: 2, group_id: 2)
Post.create!(content:Faker::Lorem.sentences(number: 15), title: Faker::Lorem.sentence(word_count: 4), user_id: 3, group_id: 2)
Post.create!(content: Faker::Lorem.sentences(number: 6), title: Faker::Lorem.sentence(word_count: 7), user_id: 1, group_id: 3)
Post.create!(content:Faker::Lorem.sentences(number: 15), title: Faker::Lorem.sentence(word_count: 4), user_id: 2, group_id: 3)
Post.create!(content:Faker::Lorem.sentences(number: 3), title: Faker::Lorem.sentence(word_count: 4), user_id: 3, group_id: 3)
Post.create!(content: Faker::Lorem.sentences(number: 6), title: Faker::Lorem.sentence(word_count: 7), user_id: 1, group_id: 4)
Post.create!(content:Faker::Lorem.sentences(number: 15), title: Faker::Lorem.sentence(word_count: 4), user_id: 2, group_id: 4)
Post.create!(content:Faker::Lorem.sentences(number: 3), title: Faker::Lorem.sentence(word_count: 4), user_id: 3, group_id: 4)


Comment.create!(content: Faker::Lorem.sentences(number: 6), user_id: 1, post_id: 1)
Comment.create!(content:Faker::Lorem.sentences(number: 3), user_id: 2, post_id: 1)
Comment.create!(content:Faker::Lorem.sentences(number: 15), user_id: 3, post_id: 1)
Comment.create!(content: Faker::Lorem.sentences(number: 6), user_id: 1, post_id: 2)
Comment.create!(content:Faker::Lorem.sentences(number: 3), user_id: 2, post_id: 2)
Comment.create!(content:Faker::Lorem.sentences(number: 15), user_id: 3, post_id: 2)
Comment.create!(content: Faker::Lorem.sentences(number: 6), user_id: 1, post_id: 3)
Comment.create!(content:Faker::Lorem.sentences(number: 15), user_id: 2, post_id: 3)
Comment.create!(content:Faker::Lorem.sentences(number: 3), user_id: 3, post_id: 3)
Comment.create!(content: Faker::Lorem.sentences(number: 6), user_id: 1, post_id: 4)
Comment.create!(content:Faker::Lorem.sentences(number: 15), user_id: 2, post_id: 4)
Comment.create!(content:Faker::Lorem.sentences(number: 3), user_id: 3, post_id: 4)

Comment.create!(content: Faker::Lorem.sentences(number: 6), user_id: 1, post_id: 1, parent_id: 1)
Comment.create!(content:Faker::Lorem.sentences(number: 3), user_id: 2, post_id: 1, parent_id: 2)
Comment.create!(content:Faker::Lorem.sentences(number: 15), user_id: 3, post_id: 1, parent_id: 3)
Comment.create!(content: Faker::Lorem.sentences(number: 6), user_id: 1, post_id: 2, parent_id: 4)
Comment.create!(content:Faker::Lorem.sentences(number: 3), user_id: 2, post_id: 2, parent_id: 1)
Comment.create!(content:Faker::Lorem.sentences(number: 15), user_id: 3, post_id: 2, parent_id: 2)
Comment.create!(content: Faker::Lorem.sentences(number: 6), user_id: 1, post_id: 3, parent_id: 3)
Comment.create!(content:Faker::Lorem.sentences(number: 15), user_id: 2, post_id: 3, parent_id: 1)
Comment.create!(content:Faker::Lorem.sentences(number: 3), user_id: 3, post_id: 3, parent_id: 2)
Comment.create!(content: Faker::Lorem.sentences(number: 6), user_id: 1, post_id: 4, parent_id: 3)
Comment.create!(content:Faker::Lorem.sentences(number: 15), user_id: 2, post_id: 4, parent_id: 4)
Comment.create!(content:Faker::Lorem.sentences(number: 3), user_id: 3, post_id: 4, parent_id: 1)