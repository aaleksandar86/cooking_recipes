require 'rails_helper'

RSpec.describe User, type: :model do
  it{ is_expected.to have_many(:recipes) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }

    it { is_expected.to have_secure_password }

    it { is_expected.to validate_length_of(:username).is_at_most(User::USERNAME_LENGTH) }
    it { is_expected.to validate_length_of(:email).is_at_most(User::EMAIL_LENGTH) }
    it { is_expected.to validate_length_of(:first_name).is_at_most(User::FIRST_NAME_LENGTH) }
    it { is_expected.to validate_length_of(:last_name).is_at_most(User::LAST_NAME_LENGTH) }
    it { is_expected.to validate_length_of(:password).is_at_least(User::PASSWORD_LENGTH) }
  end

  context 'when saving a user' do
    it 'transforms the email to down case' do
      user = create(:user, email: 'USER@ExAmPlE.CoM')
      expect(user.email).to eq 'user@example.com'
    end
  end
end
