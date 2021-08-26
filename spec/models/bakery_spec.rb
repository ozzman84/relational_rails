require "rails_helper"

describe Bakery, type: :model do
  describe "validations" do
    it { should have_many(:goods) }
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:city)}
    it {should validate_presence_of(:delivery)}
    it { should validate_presence_of(:review)}
  end
end
