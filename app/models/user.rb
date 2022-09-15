class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :group_memberships
  has_many :groups, through: :group_memberships

  def member? group
    groups.include?(group)
  end
    
  def user_groups
    groups.where(role: :admin)
  end
  
end
