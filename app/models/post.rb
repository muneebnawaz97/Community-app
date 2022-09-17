class Post < ApplicationRecord
  has_many :comments
  belongs_to :user
  belongs_to :group

  validates :title, presence: true, allow_blank: false
  validates :content, presence: true
  validates :user_id, presence: true
  validates :group_id, presence: true
end
