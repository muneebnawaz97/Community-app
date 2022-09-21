module FeatureHelpers
  def sign_in user=nil, password='password'
    visit new_user_session_path
    fill_sign_in user, password

    expect(page).to have_content 'Groups'
  end

  def fill_sign_in user=nil, password='password'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: password

    click_button 'Log in'
  end
end

RSpec.configure do |config|
  config.include FeatureHelpers, type: :system
end
