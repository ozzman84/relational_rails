require 'rails_helper'

describe Bed, type: :model do
  describe 'relationships' do
    it { should have_many(:guests) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:occupied) }
    it { should validate_presence_of(:guest_count) }
  end
end
