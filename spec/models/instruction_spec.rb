require 'rails_helper'

RSpec.describe Instruction, type: :model do
  it { is_expected.to belong_to(:recipe) }
end
