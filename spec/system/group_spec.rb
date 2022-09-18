require "rails_helper"

describe "Groups" do
  let(:user) { create :user }
  let!(:group) { create :group, user: user }

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