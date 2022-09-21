class Comment < ApplicationRecord
  belongs_to :parent, class_name: 'Comment', optional: true
  belongs_to :post
  belongs_to :user

  has_many :replies, class_name: 'Comment', foreign_key: 'parent_id', dependent: :destroy

  scope :not_replies, -> { where(parent_id: nil) }

  validates :content, presence: true, allow_blank: false
  validates :post_id, :user, presence: true
end
