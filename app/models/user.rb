class User < ApplicationRecord
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :group_memberships
  has_many :groups, through: :group_memberships
  has_many :comments

  validates :name, :email, presence: true, allow_blank: false

  def post_owner post
    post.user.id == id
  end

  def comment_owner comment
    comment.user.id == id
  end

  def admin group
    group.admins.include?(self)
  end

  def member? group
    groups.include?(group)
  end

  def user_groups
    groups.where(role: :admin)
  end
end
