require "rails_helper"

describe Good, type: :model do
  describe "relationships" do
    it { should belong_to(:bakery)}
  end

  describe "validations" do
    it {should allow_value(true).for (:gluten_free)}
    it {should allow_value(false).for (:gluten_free)}
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:category)}
    it { should validate_presence_of(:days_old)}
  end
end
