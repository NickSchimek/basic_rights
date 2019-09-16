require 'rails_helper'

RSpec.describe Fulfillment, type: :model do
  it {should belong_to(:organization) }
  it {should belong_to(:need) }
end
