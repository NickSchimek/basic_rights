require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  describe 'relationships' do
    it { should have_many(:memberships).dependent(:destroy) }
    it { should have_many(:roles).through(:memberships) }
  end
end
