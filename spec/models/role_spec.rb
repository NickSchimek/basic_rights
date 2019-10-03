require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'relationships' do
    it { should have_many(:memberships).dependent(:destroy) }
    it { should have_many(:users).through(:memberships) }
  end
end
