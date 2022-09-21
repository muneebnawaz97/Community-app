require 'rails_helper'

describe PostPolicy do
  let(:user) { create :user }
  let(:member) { create :user }
  let!(:post_less_member) { create :user }
  let(:non_member) { create :user }
  let!(:group) do
    create :group,
      user_id: user.id
  end
  let!(:membership) { create :group_membership, user: user, group: group, role: :admin }
  let!(:user_membership) { create :group_membership, user: member, group: group, role: :member }

  let!(:post) { create :post, user: member, group: group }

  permissions :update? do
    it 'user can update their own post' do
      expect(described_class).to permit(member, post)
    end

    it 'Admin can update posts' do
      expect(described_class).to permit(user, post)
    end

    it "User cannot update someone else's post" do
      expect(described_class).to_not permit(post_less_member, post)
    end
  end

  permissions :destroy? do
    it 'Admin can destroy posts' do
      expect(described_class).to permit(user, post)
    end
    it 'user can destroy their own posts' do
      expect(described_class).to permit(member, post)
    end

    it "User cannot destory someone else's post" do
      expect(described_class).to_not permit(post_less_member, post)
    end
  end

  permissions :show? do
    it 'Admin can view post' do
      expect(described_class).to permit(user, post)
    end

    it 'user can view post' do
      expect(described_class).to permit(user, post)
    end

    it 'non member can not view post' do
      expect(described_class).to_not permit(non_member, post)
    end
  end
end
