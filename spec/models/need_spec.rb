require 'rails_helper'

RSpec.describe Need, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:resource) }
  end

  describe 'relationships' do
    it { should belong_to(:organization) }
    it { should have_many(:fulfillments) }
  end
end
