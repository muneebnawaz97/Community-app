class Group < ApplicationRecord
  has_many :posts
  has_many :users
  belongs_to :user

  validates_presence_of :title
end
