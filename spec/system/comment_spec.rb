require 'rails_helper'
require 'byebug'
describe 'Comments' do
  let(:user) { create :user }
  let(:member) { create :user }
  let!(:group) do
    create :group,
    user_id: user.id
  end
  let!(:membership) { create :group_membership, user: user, group: group, role: :admin }
  let!(:second_membership) { create :group_membership, user: member, group: group, role: :member }
  let!(:post) { create :post, user: user, group: group }
  let!(:comment) { create :comment, user: user, post: post }

  before do
    sign_in user
    click_on 'View group'
    click_on 'View Post ->'
  end

  scenario 'User can see the post' do
    expect(page).to have_content post.title
    expect(page).to have_content post.content
    expect(page).to have_content 'Comments'
  end

  scenario 'User can create a comment' do
    fill_in 'Write your comment...', with: 'This is my comment'
    click_on 'Create Comment'

    expect(page).to have_content 'This is my comment'
  end

  scenario 'User can delete a comment' do
    expect(page).to have_content comment.content

    click_on 'Delete'

    expect(page).to_not have_content comment.content
  end
end
