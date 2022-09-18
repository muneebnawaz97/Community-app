require 'faker'

FactoryBot.define do
  factory(:user) do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8) }
    name { Faker::Books::Dune.character }
  end
end

FactoryBot.define do
  factory(:group) do
    title { Faker::Books::Dune.planet }

    after :create do |group, options|
      group.admins << options.admins
      group.users << options.users
    end
  end
end

FactoryBot.define do
  factory(:group_membership) do
    user
    group
    role { :member }
  end
end

FactoryBot.define do
  factory(:post) do
    title { Faker::Books::Dune.quote }
    content { Faker::Lorem.sentences(number: 3) }
    user
    group
  end
end

FactoryBot.define do
  factory(:comment) do
    title { Faker::Books::Dune.quote }
    content { Faker::Lorem.sentences(number: 3) }
    user
    post

    after :create do |comment, options|
      comment.parent_id = options.parent_id
    end
  end
end


