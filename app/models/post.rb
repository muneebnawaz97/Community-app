class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :group

  validates :title, presence: true, allow_blank: false
  validates :content, presence: true, allow_blank: false
  validates :user_id, presence: true
  validates :group_id, presence: true
end
