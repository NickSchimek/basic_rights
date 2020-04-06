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
    it { should have_many(:memberships).dependent(:destroy) }
    it { should have_many(:users).through(:memberships) }
  end

  describe 'enum contact method' do
    it do
      should define_enum_for(:contact_method).
        with_values(call: 'call', text: 'text').
        backed_by_column_of_type(:enum)
    end
  end
end
