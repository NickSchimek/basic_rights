require 'rails_helper'

RSpec.describe Surplu, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:resource) }
  end
end
