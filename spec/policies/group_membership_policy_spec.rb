require 'rails_helper'

describe GroupPolicy do
  let(:user) { create :user }
  let!(:group) do
    create :group,
      user_id: user.id
  end
  let!(:membership) { create :group_membership, user: user, group: group, role: :admin }

  permissions :create? do
    it 'User can join a group' do
      expect(described_class).to permit(user, group)
    end
  end
end
