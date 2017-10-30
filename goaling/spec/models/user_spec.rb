require 'rails_helper'

RSpec.describe User, type: :model do
  # FactoryBot.build

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe 'associations' do
    it { should have_many(:goals) }
    it { should have_many(:comments) }
  end

  describe 'class methods' do
    context '::find_by_credentials' do
      before(:each) do
        user = FactoryBot.build(:user).save!
      end
      it 'should return correct user with valid params' do
        expect(User.find_by_credentials(user.username, user.password)).to eq(user)
      end
      it 'should return nil with invalid params' do
        user = FactoryBot.build(:user, password: '')
        expect(User.find_by_credentials(user.username, user.password)).to eq(user)
      end
    end
  end
end
