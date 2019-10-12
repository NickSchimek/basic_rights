require 'rails_helper'

RSpec.describe Membership, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:role) }
    it { should belong_to(:organization).required(false) }
  end
end
