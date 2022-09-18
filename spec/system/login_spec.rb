require "rails_helper"

describe "Users log in" do
  let(:user) { create :user }
  let(:member) { create :user }
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
  let!(:membership) { create :group_membership, user: user, group: member_group, role: :member }

  scenario "Users enters the wrong password" do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "password123"

    click_button "Log in"

    expect(page).to have_content "Invalid Email or password."
  end

  scenario "Users go to the login page" do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"
    expect(page).to have_content "Groups"
  end
end
