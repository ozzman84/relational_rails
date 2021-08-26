require "rails_helper"

describe Good, type: :model do
  describe "relationships" do
    it { should belong_to(:bakery)}
  end

  describe "validations" do
    it { should validate_presence_of(:gluten_free)}
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:type)}
    it { should validate_presence_of(:days_old)}
  end
end
