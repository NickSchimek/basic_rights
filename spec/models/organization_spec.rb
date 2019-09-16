require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'relationships' do
    it { should have_many(:needs).dependent(:destroy) }
    it { should have_many(:surplus).dependent(:destroy) }
    it { should have_many(:claims) }
    it { should have_many(:fulfillments) }
  end
end
