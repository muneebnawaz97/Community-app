require "rails_helper"

describe "Groups" do
  let(:user) { create :user }
  let(:member) {create :user}
  let!(:admin_group) do 
    create :group, 
      user_id: user.id
  end
  let!(:member_group) do 
    create :group 
  end
  let!(:group) do 
    create :group 
  end
  let!(:membership) { create :group_membership, user: user, group: admin_group, role: :admin }
  let!(:user_membership) { create :group_membership, user: user, group: member_group, role: :member }
  
  before do
    sign_in user
  end

  scenario "Users logs in and navigates to the index page" do
    expect(page).to have_content group.title
    expect(page).to have_content "+ Create a new group"
    expect(page).to have_content "All Groups"
    expect(page).to have_content "Created by me"
    expect(page).to have_content "Where I am a member"
    expect(page).to have_content user.name
  end

  scenario "User clicks + create group and modal opens" do
    click_on "+ Create a new group"

    expect(page).to have_content "Create Group"
    expect(page).to have_content "Group Name"
    expect(page).to have_content "People will see this name before joing your group"
  end

  scenario "User creates a group" do
    click_on "+ Create a new group"

    expect(page).to have_content "Create Group"
    expect(page).to have_content "Group Name"
    expect(page).to have_content "People will see this name before joing your group"

    fill_in "Title of your group", with: "Rick's adventures"

    click_button "Create Group"

    expect(page).to have_content "Rick's adventures"
  end

  scenario "User sees groups they are a member of" do
    click_on "Where I am a member"
    expect(page).to have_content member_group.title
    expect(page).to have_content admin_group.title
    expect(page).to_not have_content group.title
  end

  scenario "User sees groups they are admin of" do
    click_on "Created by me"
    expect(page).to have_content admin_group.title
    expect(page).to_not have_content member_group.title
  end
end