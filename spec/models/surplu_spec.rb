require 'rails_helper'

RSpec.describe Surplu, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:resource) }
  end

  describe 'relationships' do
    it { should belong_to(:organization) }
    it { should have_many(:claims).dependent(:destroy) }
  end
end
