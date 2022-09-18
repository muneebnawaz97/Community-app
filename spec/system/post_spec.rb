require "rails_helper"

describe "Posts" do
  let(:user) { create :user }
  let(:member) { create :user }
  let!(:group) do 
    create :group, 
    user_id: user.id
  end
  let!(:membership) { create :group_membership, user: user, group: group, role: :admin}
  let!(:second_membership) { create :group_membership, user: member, group: group, role: :member}
  let!(:post) {create :post, user: user, group: group }

  describe "Logged in as admin" do
    before do
      sign_in user
      click_on "View group"
    end

    scenario "Group has correct name" do
      expect(page).to have_content group.title
    end

    scenario "Admin can create Post" do
      fill_in "What is the title of this post?", with: "Hi this is my post"
      fill_in "Write your post...", with: "this is its description"

      click_button "Create Post"
      
      expect(page).to have_content "Hi this is my post"
      expect(page).to have_content "this is its description"
    end

    scenario "Admin can edit Post" do
      click_on "Edit"
      expect(page).to have_content "Edit Post"

      expect(page).to have_content post.title
      expect(page).to have_content post.content

      within(".modal-component") do
        fill_in "What is the title of this post?", with: "I am editing this post"
        fill_in "Write your post...", with: "I am editing its content"
      end

      click_on "Update Post"

      expect(page).to have_content "I am editing this post"
      expect(page).to have_content "I am editing its content"
    end

    scenario "Admin can delete Post" do
      expect(page).to have_content post.title
      expect(page).to have_content post.content
      
      click_on "Delete"

      expect(page).to_not have_content post.title
      expect(page).to_not have_content post.content
    end

    scenario "Admin can remove member" do
      expect(page).to have_content member.name
      find(".remove-user").click
      expect(page).to_not have_content member.name
    end
  end 

  describe "Logged in as member" do
    before do
      sign_in member
      click_on "View group"
    end

    scenario "Group has correct name" do
      expect(page).to have_content group.title
    end

    scenario "user can create Post" do
      fill_in "What is the title of this post?", with: "Hi this is my post"
      fill_in "Write your post...", with: "this is its description"

      click_button "Create Post"
      
      expect(page).to have_content "Hi this is my post"
      expect(page).to have_content "this is its description"
    end

    scenario "User can not delete someone else's post ost" do
      expect(page).to have_content post.title
      expect(page).to have_content post.content
      expect(page).to_not have_content "Delete"
    end

    scenario "User can not edit someone else's post ost" do
      expect(page).to have_content post.title
      expect(page).to have_content post.content
      expect(page).to_not have_content "Delete"
    end
  end 
end