require "faker"

FactoryBot.define do
  factory(:user) do
    email { Faker::Internet.email }
    password { "password" }
    name { Faker::Books::Dune.character }
  end
end

FactoryBot.define do
  factory(:group) do
    title { Faker::Books::Dune.planet }
    user
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
    content { Faker::Lorem.sentences(number: 3) }
    user
    post

    after :create do |comment, options|
      comment.parent_id = options.parent_id
    end
  end
end
