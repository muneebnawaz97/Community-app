# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
if User.count < 10
  user1 = User.create!(name: 'Ghulam Murtaza', email: 'gm@example.com', password: 'password')
  user2 = User.create!(name: 'Sami', email: 'sami@example.com', password: 'password')
  user3 = User.create!(name: 'Muneeb Nawaz', email: 'admin@example.com', password: 'password')
  user4 = User.create!(name: 'test1', email: 'test1@example.com', password: 'password')
  user5 = User.create!(name: 'test2', email: 'test2@example.com', password: 'password')
  user6 = User.create!(name: 'test3', email: 'test3@example.com', password: 'password')
  user7 = User.create!(name: 'test4', email: 'test4@example.com', password: 'password')
  user8 = User.create!(name: 'test5', email: 'test5@example.com', password: 'password')
  user9 = User.create!(name: 'test6', email: 'test6@example.com', password: 'password')
  user10 = User.create!(name: 'test7', email: 'test7@example.com', password: 'password')

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

  group1 = Group.create!(title: "Ghulam Murtaza is admin here", user_id: 1)
  group2 = Group.create!(title: "Sami is admin here", user_id: 2)
  group3 = Group.create!(title: "Muneeb is admin here", user_id: 3)
  group4 = Group.create!(title: "test is admin here", user_id: 4)

  GroupMembership.create!(user: user1, group: group1, role: :admin)
  GroupMembership.create!(user: user2, group: group2, role: :admin)
  GroupMembership.create!(user: user3, group: group3, role: :admin)
  GroupMembership.create!(user: user4, group: group4, role: :admin)
  GroupMembership.create!(user: user5, group: group1, role: :member)
  GroupMembership.create!(user: user6, group: group1, role: :member)
  GroupMembership.create!(user: user7, group: group1, role: :member)
  GroupMembership.create!(user: user8, group: group1, role: :member)
  GroupMembership.create!(user: user9, group: group1, role: :member)
  GroupMembership.create!(user: user10, group: group1, role: :member)
  GroupMembership.create!(user:  user1, group: group2, role: :member)
  GroupMembership.create!(user: user3, group: group2, role: :member)
  GroupMembership.create!(user: user4, group: group2, role: :member)
  GroupMembership.create!(user: user5, group: group2, role: :member)
  GroupMembership.create!(user: user6, group: group2, role: :member)
  GroupMembership.create!(user: user7, group: group3, role: :member)
  GroupMembership.create!(user: user8, group: group3, role: :member)
  GroupMembership.create!(user: user9, group: group3, role: :member)
  GroupMembership.create!(user: user10, group: group3, role: :member)
  GroupMembership.create!(user: user1, group: group3, role: :member)
  GroupMembership.create!(user: user2, group: group3, role: :member)
  GroupMembership.create!(user: user4, group: group3, role: :member)
  GroupMembership.create!(user: user5, group: group3, role: :member)
  GroupMembership.create!(user: user6, group: group3, role: :member)
  GroupMembership.create!(user: user7, group: group4, role: :member)
  GroupMembership.create!(user: user8, group: group4, role: :member)

  post1 = Post.create!(content: Faker::Lorem.sentences(number: 6), title: Faker::Lorem.sentence(word_count: 7), user: user1, group: group1)
  post2 = Post.create!(content:Faker::Lorem.sentences(number: 3), title: Faker::Lorem.sentence(word_count: 4), user: user2, group: group1)
  post3 = Post.create!(content:Faker::Lorem.sentences(number: 15), title: Faker::Lorem.sentence(word_count: 4), user: user3, group: group1)
  post4 = Post.create!(content: Faker::Lorem.sentences(number: 6), title: Faker::Lorem.sentence(word_count: 7), user: user1, group: group2)
  post5 = Post.create!(content:Faker::Lorem.sentences(number: 3), title: Faker::Lorem.sentence(word_count: 4), user: user2, group: group2)
  post6 = Post.create!(content:Faker::Lorem.sentences(number: 15), title: Faker::Lorem.sentence(word_count: 4), user: user3, group: group2)
  post7 = Post.create!(content: Faker::Lorem.sentences(number: 6), title: Faker::Lorem.sentence(word_count: 7), user: user1, group: group3)
  post8 = Post.create!(content:Faker::Lorem.sentences(number: 15), title: Faker::Lorem.sentence(word_count: 4), user: user2, group: group3)
  post9 = Post.create!(content:Faker::Lorem.sentences(number: 3), title: Faker::Lorem.sentence(word_count: 4), user: user3, group: group3)
  post10 = Post.create!(content: Faker::Lorem.sentences(number: 6), title: Faker::Lorem.sentence(word_count: 7), user: user1, group: group4)
  post11 = Post.create!(content:Faker::Lorem.sentences(number: 15), title: Faker::Lorem.sentence(word_count: 4), user: user2, group: group4)
  post12 = Post.create!(content:Faker::Lorem.sentences(number: 3), title: Faker::Lorem.sentence(word_count: 4), user: user3, group: group4)


  comment1 = Comment.create!(content: Faker::Lorem.sentences(number: 6), user: user1, post: post1)
  comment2 = Comment.create!(content:Faker::Lorem.sentences(number: 3), user: user2, post: post1)
  comment3 = Comment.create!(content:Faker::Lorem.sentences(number: 15), user: user3, post: post1)
  comment4 = Comment.create!(content: Faker::Lorem.sentences(number: 6), user: user1, post: post2)
  comment5 = Comment.create!(content:Faker::Lorem.sentences(number: 3), user: user2, post: post2)
  comment6 = Comment.create!(content:Faker::Lorem.sentences(number: 15), user: user3, post: post2)
  comment7 = Comment.create!(content: Faker::Lorem.sentences(number: 6), user: user1, post: post3)
  comment8 = Comment.create!(content:Faker::Lorem.sentences(number: 15), user: user2, post: post3)
  comment9 = Comment.create!(content:Faker::Lorem.sentences(number: 3), user: user3, post: post3)
  comment10 = Comment.create!(content: Faker::Lorem.sentences(number: 6), user: user1, post: post4)
  comment11 = Comment.create!(content:Faker::Lorem.sentences(number: 15), user: user2, post: post4)
  comment12 = Comment.create!(content:Faker::Lorem.sentences(number: 3), user: user3, post: post4)

  Comment.create!(content: Faker::Lorem.sentences(number: 6), user: user1, post: post1, parent_id: comment1)
  Comment.create!(content:Faker::Lorem.sentences(number: 3), user: user2, post: post1, parent_id: comment2)
  Comment.create!(content:Faker::Lorem.sentences(number: 15), user: user3, post: post1, parent_id: comment3)
  Comment.create!(content: Faker::Lorem.sentences(number: 6), user: user1, post: post2, parent_id: comment4)
  Comment.create!(content:Faker::Lorem.sentences(number: 3), user: user2, post: post2, parent_id: comment1)
  Comment.create!(content:Faker::Lorem.sentences(number: 15), user: user3, post: post2, parent_id: comment2)
  Comment.create!(content: Faker::Lorem.sentences(number: 6), user: user1, post: post3, parent_id: comment3)
  Comment.create!(content:Faker::Lorem.sentences(number: 15), user: user2, post: post3, parent_id: comment1)
  Comment.create!(content:Faker::Lorem.sentences(number: 3), user: user3, post: post3, parent_id: comment2)
  Comment.create!(content: Faker::Lorem.sentences(number: 6), user: user1, post: post4, parent_id: comment3)
  Comment.create!(content:Faker::Lorem.sentences(number: 15), user: user2, post: post4, parent_id: comment4)
  Comment.create!(content:Faker::Lorem.sentences(number: 3), user: user3, post: post4, parent_id: comment1)
end