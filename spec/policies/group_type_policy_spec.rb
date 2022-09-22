require 'rails_helper'

describe GroupTypePolicy do
  let(:user) { create :user }

  permissions :index? do
    it 'User can see groups they are a member of' do
      expect(described_class).to permit(user)
    end

    it 'Unauthneticated user can not see groups they are a member of' do
      user = nil
      expect(described_class).to_not permit(user)
    end
  end


  permissions :show? do
    it 'User can see groups they created' do
      expect(described_class).to permit(user)
    end

    it 'Unauthneticated user can not see groups they created' do
      user = nil
      expect(described_class).to_not permit(user)
    end
  end
end