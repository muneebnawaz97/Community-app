class Post < ApplicationRecord
  belongs_to :user
  belongs_to :group

  has_many :comments, dependent: :destroy

  validates :title, :content, presence: true, allow_blank: false
  validates :user_id, :group_id, presence: true
end
