require 'rails_helper'

  RSpec.describe Bakery, type: :model do
    it { should have_many (:goods)}
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:city)}
    it {should allow_value(true).for (:delivery)}
    it {should allow_value(false).for (:delivery)}
    it { should validate_presence_of(:review)}

    before :each do
      @bakery_1 = Bakery.create!(name: "Taste of Denmark",
        city: "Lakewood",
        delivery: false,
        review: 5
      )
      @bakery_2 = Bakery.create!(name:"Bread",
      city: "Durango",
      delivery: true,
      review: 4
      )
      @good_1 = @bakery_1.goods.create!(name: "Cinnamon Roll",
      category: "Pastry",
      days_old: 0,
      gluten_free: true)
    end

    describe '#ordered_creation' do
      it 'should return an ordered list of bakeries based on most recently created_at' do
        expected = [@bakery_2, @bakery_1]
      expect(Bakery.ordered_creation).to eq(expected)
      end
    end

    describe '#good_count' do
      it 'counts the number of goods per bakery' do
      expect(@bakery_1.goods_count).to eq(1)
    end
    end
  end
