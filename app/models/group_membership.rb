class GroupMembership < ApplicationRecord
  belongs_to :group
  belongs_to :user

  enum role: [:admin, :member]
end
