require "rails_helper"

describe GroupPolicy do
  let(:user) { create :user }
  let(:member) { create :user }
  let(:non_member) { create :user }
  let!(:group) do
    create :group,
      user_id: user.id
  end
  let!(:membership) { create :group_membership, user: user, group: group, role: :admin }
  let!(:user_membership) { create :group_membership, user: member, group: group, role: :member }

  permissions :create? do
    it "User can create group" do
      expect(described_class).to permit(user)
    end
  end

  permissions :update? do
    it "Admin can update group" do
      expect(described_class).to permit(user, group)
    end

    it "User cannot update group" do
      expect(described_class).to_not permit(member, group)
    end
  end

  permissions :show? do
    it "Admin can visit group" do
      expect(described_class).to permit(user, group)
    end

    it "member can visit group" do
      expect(described_class).to permit(member, group)
    end

    it "non member visit group" do
      expect(described_class).to_not permit(non_member, group)
    end
  end
end
