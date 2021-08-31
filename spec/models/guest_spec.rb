require 'rails_helper'

describe Guest, type: :model do
  describe 'relationships' do
    it { should belong_to(:bed) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:rent) }
    it { should allow_value(true).for (:visiting) }
    it { should allow_value(false).for (:visiting) }
  end
end
