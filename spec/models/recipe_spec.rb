require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'associations' do
    it{ is_expected.to have_many(:ingredients) }
    it{ is_expected.to have_many(:instructions) }
    it { is_expected.to belong_to(:user) }

    it { is_expected.to accept_nested_attributes_for(:instructions).allow_destroy(true) }
    it { is_expected.to accept_nested_attributes_for(:ingredients).allow_destroy(true) }
  end

  describe 'validations' do
    it{ is_expected.to validate_presence_of :title }
    it{ is_expected.to validate_presence_of :description }

    it { is_expected.to validate_length_of(:title).is_at_least(Recipe::TITLE_LENGTH) }
    it { is_expected.to validate_length_of(:description).is_at_most(Recipe::DESCRIPTION_LENGTH) }
  end


end
