require 'rails_helper'

RSpec.describe Claim, type: :model do
  describe 'relationships' do
    it { should belong_to(:organization) }
    it { should belong_to(:surplu) }
  end
end
