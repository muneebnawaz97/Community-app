class GroupMembership < ApplicationRecord
  
  enum role: [:admin, :member]

  belongs_to :group
  belongs_to :user

  validates :group_id, uniqueness: {scope: :user_id}
  validates :role, presence: true
end
