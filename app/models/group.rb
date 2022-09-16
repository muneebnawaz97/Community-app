class Group < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :group_memberships, dependent: :destroy
  has_many :users, through: :group_memberships
  belongs_to :user

  validates :title, presence: true

  def total_members
    users.count
  end

  def total_posts
    posts.count
  end

  def ordered_posts
    posts.order(created_at: :desc)
  end

  def last_activity
    if (posts&.last&.created_at)
      (Time.current  - posts.last.created_at).to_i
   else
    (Time.current  - created_at).to_i
   end
  end
end
