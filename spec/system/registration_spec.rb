require "rails_helper"
require 'faker'

describe "Users sign up" do
  let(:user) { create :user }

  before do
    visit new_user_registration_path
  end
  scenario "Users Leaves form empty and clicks sign up" do

    click_button "Sign up"

    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"
    expect(page).to have_content "Name can't be blank"
  end

  scenario "Users only fills in email and clicks sign up" do
    
    fill_in "Email", with: Faker::Internet.email

    click_button "Sign up"

    expect(page).to have_content "Password can't be blank"
    expect(page).to have_content "Name can't be blank"
  end

  scenario "Users leaves name blank and clicks sign up" do

    fill_in "Email", with: Faker::Internet.email
    fill_in "Password", with: "password"
    fill_in "Confirm password", with: "password"

    click_button "Sign up"

    expect(page).to have_content "Name can't be blank"
  end

  scenario "Users signs up existing user email" do

    fill_in "Email", with: user.email
    fill_in "Name", with: Faker::Books::Dune.character
    fill_in "Password", with: "password"
    fill_in "Confirm password", with: "password"

    click_button "Sign up"
    
    expect(page).to have_content "Email has already been taken"
  end

  scenario "Users successfully signs up" do

    fill_in "Email", with: user.email
    fill_in "Name", with: Faker::Books::Dune.character
    fill_in "Password", with: "password"
    fill_in "Confirm password", with: "password"

    click_button "Sign up"
    
    expect(page).to have_content "Email has already been taken"
  end

end