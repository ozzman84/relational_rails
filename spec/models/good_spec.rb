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

  it 'returns pastries over a specified age' do
    bakery_1 = Bakery.create!(name: "Taste of Denmark",
      city: "Lakewood",
      delivery: true,
      review: 5
    )
    good_1 = bakery_1.goods.create!(name: "Cinnamon Roll",
    category: "Pastry",
    days_old: 0,
    gluten_free: true,

  )
    good_2 = bakery_1.goods.create!(name: "Pumpkin Bread",
    category: "Bread",
    days_old: 1,
    gluten_free: true,

  )

  expect(Good.all.over_day(0)).to eq([good_2])
  end
end
