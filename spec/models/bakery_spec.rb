require 'rails_helper'

describe Bakery, type: :model  do
    it { should have_many (:goods)}
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:city)}
    it {should validate_presence_of(:delivery)}
    it { should validate_presence_of(:review)}

    describe '#ordered_creation' do
    it 'should return an ordered list of bakeries based on most recently created_at' do
      bakery_1 = Bakery.create!(name: "Taste of Denmark",
        city: "Lakewood",
        delivery: true,
        review: 5
      )
      bakery_2 = Bakery.create!(name:"Bread",
      city: "Durango",
      delivery: true,
      review: 4
      )
      expected = [bakery_2, bakery_1]
      expect(Bakery.ordered_creation).to eq(expected)
    end
  end
end
