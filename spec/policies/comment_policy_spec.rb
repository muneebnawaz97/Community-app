require "rails_helper"

describe CommentPolicy do
  let(:user) { create :user }
  let(:member) {create :user}
  let!(:post_less_member) {create :user}
  let(:non_member) {create :user}
  let!(:group) do 
    create :group, 
      user_id: user.id
  end
  let!(:membership) { create :group_membership, user: user, group: group, role: :admin }
  let!(:user_membership) { create :group_membership, user: member, group: group, role: :member }

  let!(:post) {create :post, user: member, group: group }
  let!(:comment) { create :comment, user: member, post: post }

  permissions :update? do
    it "user can update their own comment" do
      expect(described_class).to permit(member, comment)
    end

    it "Admin can update coment" do
      expect(described_class).to permit(user, comment)
    end


    it "User cannot update someone else's comment" do
      expect(described_class).to_not permit(post_less_member, comment)
    end
  end

  permissions :destroy? do
    it "Admin can destroy comments" do
      expect(described_class).to permit(user, comment)
    end
    it "user can destroy their own comments" do
      expect(described_class).to permit(member, comment)
    end

    it "User cannot destory someone else's comments" do
      expect(described_class).to_not permit(post_less_member, comment)
    end
  end
end